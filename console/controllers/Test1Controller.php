<?php
namespace console\controllers;

use yii\console\Controller;


class Test1Controller extends Controller
{
	public function actionNsqPub()
	{

		$nsq = new \nsqphp\nsqphp;
    	$res = $nsq->publishTo('localhost',1)
        	->publish('mytopic1', new \nsqphp\Message\Message('some message payload'));

        var_dump($res);
	}

	public function actionNsqSub()
	{

		$lookup = new \nsqphp\Lookup\Nsqlookupd;
    	$nsq = new \nsqphp\nsqphp($lookup);
    	$ret = [];
    	$res = $nsq->subscribe('mytopic1', 'foo', function($msg) use (&$ret){
    		$ret[] = $msg->getPayload();
        	var_dump($msg->getPayload());
        })->run(1);
        var_dump($ret);
	}
}