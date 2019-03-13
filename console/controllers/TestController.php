<?php
namespace console\controllers;

use yii\console\Controller;
use \RdKafka;
use common\library\Kafka;

class TestController extends Controller
{
	/**
	 * 生产者
	 * @param  string $value [description]
	 * @return [type]        [description]
	 */
	public function actionKafkaProducer($value='')
	{

		$conf = new RdKafka\Conf();
		$conf->setDrMsgCb(function ($kafka, $message) {
		    file_put_contents("./dr_cb.log", var_export($message, true).PHP_EOL, FILE_APPEND);
		});
		$conf->setErrorCb(function ($kafka, $err, $reason) {
		    file_put_contents("./err_cb.log", sprintf("Kafka error: %s (reason: %s)", rd_kafka_err2str($err), $reason).PHP_EOL, FILE_APPEND);
		});

		$rk = new RdKafka\Producer($conf);
		$rk->setLogLevel(LOG_DEBUG);
		$rk->addBrokers("127.0.0.1");

		$cf = new RdKafka\TopicConf();
		// -1必须等所有brokers同步完成的确认 1当前服务器确认 0不确认，这里如果是0回调里的offset无返回，如果是1和-1会返回offset
		// 我们可以利用该机制做消息生产的确认，不过还不是100%，因为有可能会中途kafka服务器挂掉
		$cf->set('request.required.acks', 0);
		$topic = $rk->newTopic("test", $cf);

		$option = 'qkl';
		for ($i = 0; $i < 20; $i++) {
		    //RD_KAFKA_PARTITION_UA自动选择分区
		    //$option可选
		    $topic->produce(RD_KAFKA_PARTITION_UA, 0, "qkl . $i", $option);
		}


		$len = $rk->getOutQLen();
		while ($len > 0) {
		    $len = $rk->getOutQLen();
		    var_dump($len);
		    $rk->poll(50);
		}
	}

	/**
	 * 低级消费
	 * @param  string $value [description]
	 * @return [type]        [description]
	 */
	public function actionLowConsume()
	{
		$kafka = new Kafka();
		$handle = new \common\models\Goods();
		$kafka->lowConsume([$handle,'consume']);

	}
	/**
	 * 高级消费，不好用
	 * @param  string $value [description]
	 * @return [type]        [description]
	 */
	public function actionHighConsume($value='')
	{

		$conf = new \RdKafka\Conf();

		// Set a rebalance callback to log partition assignments (optional)
		$conf->setRebalanceCb(function(\RdKafka\KafkaConsumer $kafka, $err, array $partitions = null) {
		    global $offset;
		    switch ($err) {
		        case RD_KAFKA_RESP_ERR__ASSIGN_PARTITIONS:
		            echo "Assign: ";
		            var_dump($partitions);
		            $kafka->assign();
		//            $kafka->assign([new RdKafka\TopicPartition("qkl01", 0, 0)]);
		            break;

		        case RD_KAFKA_RESP_ERR__REVOKE_PARTITIONS:
		            echo "Revoke: ";
		            var_dump($partitions);
		            $kafka->assign(NULL);
		            break;

		        default:
		            throw new \Exception($err);
		    }
		});

		// Configure the group.id. All consumer with the same group.id will consume
		// different partitions.
		$conf->set('group.id', 'test-110-g100');

		// Initial list of Kafka brokers
		$conf->set('metadata.broker.list', '127.0.0.1');

		$topicConf = new \RdKafka\TopicConf();

		$topicConf->set('request.required.acks', -1);
		//在interval.ms的时间内自动提交确认、建议不要启动
		$topicConf->set('auto.commit.enable', 0);
		//$topicConf->set('auto.commit.enable', 0);
		$topicConf->set('auto.commit.interval.ms', 100);

		// 设置offset的存储为file
		$topicConf->set('offset.store.method', 'file');
		$topicConf->set('offset.store.path', __DIR__);
		// 设置offset的存储为broker
		// $topicConf->set('offset.store.method', 'broker');

		// Set where to start consuming messages when there is no initial offset in
		// offset store or the desired offset is out of range.
		// 'smallest': start from the beginning
		$topicConf->set('auto.offset.reset', 'smallest');

		// Set the configuration to use for subscribed/assigned topics
		$conf->setDefaultTopicConf($topicConf);

		$consumer = new \RdKafka\KafkaConsumer($conf);

		//$KafkaConsumerTopic = $consumer->newTopic('qkl01', $topicConf);

		// Subscribe to topic 'test'
		$consumer->subscribe(['test']);

		echo "Waiting for partition assignment... (make take some time when\n";
		echo "quickly re-joining the group after leaving it.)\n";

		while (true) {
		    $message = $consumer->consume(120*1000);
		    if (is_null($message)) {
		        sleep(1);
		        echo "No more messages\n";
		        continue;
		    }
		    try {
			    switch ($message->err) {
			        case RD_KAFKA_RESP_ERR_NO_ERROR:
			            var_dump($message);
			//            $consumer->commit($message);
			//            $KafkaConsumerTopic->offsetStore(0, 20);
			            break;
			        case RD_KAFKA_RESP_ERR__PARTITION_EOF:
			            echo "No more messages; will wait for more\n";
			            break;
			        case RD_KAFKA_RESP_ERR__TIMED_OUT:
			            echo "Timed out\n";
			            break;
			        default:
			            throw new \Exception($message->errstr(), $message->err);
			            break;
			    }
			} catch (\Exception $e) {
				var_dump($e->getMessage());
			}
		}
	}
}