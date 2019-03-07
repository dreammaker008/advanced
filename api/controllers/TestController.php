<?php

namespace frontend\controllers;
use common\models\Goods;

class TestController extends \yii\web\Controller
{
    public function actionIndex()
    {

        $sql = Goods::find()->where(
        	[
        		'name'=>'fff',
        		'id'=>[1,2]
        	]
        )->limit(100)->createCommand()->getRawSql();
        var_dump($sql);
    }

    public function actionAdd()
    {

        $res = Goods::getDb()->createCommand()->insert(Goods::tableName(),['name'=>'ttt'])->execute();
        var_dump($res);
    }

    public function actionUpdate()
    {

        $res = Goods::updateAll(['name'=>'fff'],['id'=>1]);
        var_dump($res);
    }

}
