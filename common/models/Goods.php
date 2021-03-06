<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "goods".
 *
 * @property int $id
 * @property int $cate 分类
 * @property string $name
 * @property string $create_time
 */
class Goods extends \common\models\BaseModel
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'goods';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['cate'], 'integer'],
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
            'id' => 'ID',
            'cate' => 'Cate',
            'name' => 'Name',
            'create_time' => 'Create Time',
        ];
    }
}
