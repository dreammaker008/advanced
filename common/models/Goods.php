<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "goods".
 *
 * @property int $id
 * @property string $name
 * @property string $create_time
 */
class Goods extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%goods}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['create_time'], 'safe'],
            [['name'], 'string', 'max' => 32],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'create_time' => Yii::t('app', 'Create Time'),
        ];
    }

    public static function consume($msg)
    {
        var_dump('here');
        // $goods = new self();
        // $goods->name = $msg->payload;
        // $goods->save();
        $user = new \common\models\User();
        $user->testCall();
        self::secondCall();
    }

    private static function secondCall()
    {
        var_dump('there');
    }
}
