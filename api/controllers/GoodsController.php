<?php

namespace api\controllers;

class GoodsController extends \yii\rest\Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }

}
