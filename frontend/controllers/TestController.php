<?php

namespace frontend\controllers;
use common\models\Goods;
use common\models\GoodsCate;

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

    public function actionAddAll()
    {

        $res = Goods::getDb()->createCommand()->batchInsert(Goods::tableName(),['name'],[['tttt']])->execute();
        var_dump($res);
    }

    public function actionUpdate()
    {

        $res = Goods::updateAll(['name'=>'fff'],['id'=>1]);
        var_dump($res);
    }

    public function actionTest()
    {
    	var_dump((new Goods())->selectAll(['name'=>'f']));
    }

    public function actionJoin()
    {
        
        $res = GoodsCate::find()->alias('c')->leftJoin(Goods::tableName().' as g','c.id=g.cate')->select('c.id cate_id,c.name as cate_name,g.id goods_id,g.name')->where(['c.id'=>1])->asArray()->all();
        var_dump($res);exit;
    }

}
