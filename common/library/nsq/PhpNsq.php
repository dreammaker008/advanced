<?php
/**
 * Created by PhpStorm.
 * User: xiangzhun.chen
 * Date: 2019/3/1
 * Time: 15:45
 */

namespace common\library\nsq;


class PhpNsq
{
    public $nsqParams = null;//配置nsq的服务器
    public $topic     = null;//nsq的topic
    public $partition = 0;

    protected $producer = null;
    protected $consumer = null;

    public function __construct()
    {
        $this->nsqParams = \Yii::$app->params['NsqParam'];
    }

    /** 生产者
     * @param string $messages 需写入队列的数据
     * @param int $type 订阅/回调类型（1是快递100订阅，2是快递100回调，3是中通汇通订阅，4是中通汇通回调）
     * @return mixed
     * @throws Exception
     */
    public function send($messages = '', $type = 1)
    {
        try {
            $this->changeTopicType($type);
            $nsq = new \nsqphp\nsqphp;
            $nsq->publishTo($this->nsqParams['host'],1)
                ->publish($this->topic, new \nsqphp\Message\Message($messages));
        } catch (\Exception $e) {
            throw $e;
        }
        
    }


    /** 消费队列
     * @param int $num 每次从队列取多少条记录
     * @param int $type 订阅/回调类型（1是快递100订阅，2是快递100回调，3是中通汇通订阅，4是中通汇通回调）
     * @return array
     * @throws Exception
     */
    public function lowConsumer($type = 1)
    {
        try {
            $this->changeTopicType($type);
            $hosts = [];
            foreach ($this->nsqParams['host'] as $host) {
                $host = explode(':',$host);
                $hosts[] = $host[0];
            }
            $lookup = new \nsqphp\Lookup\Nsqlookupd($hosts);
            $nsq = new \nsqphp\nsqphp($lookup);
            $ret = [];
            $nsq->subscribe($this->topic, 'express', function($msg) use (&$ret){
                $ret[] = $msg->getPayload();
            })->run(5);
        } catch (\Exception $e) {
            throw $e;
        }
    }

    /**
     * 转换渠道和类型
     * @param $type
     */
    public function changeTopicType($type)
    {
        switch ($type) {
            case '1':
                $this->topic = $this->nsqParams['topic_subscribe'];
                break;
            case '2':
                $this->topic = $this->nsqParams['topic_kd100_callback'];
                break;
            case '3':
                $this->topic = $this->nsqParams['topic_ztobest_callback'];
                break;
            case '4':
                $this->topic = $this->nsqParams['topic_other_callback'];
                break;
            default:
                $this->topic = $this->nsqParams['topic_subscribe'];
                break;
        }
    }

}