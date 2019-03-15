<?php

namespace common\models;

use yii;
use yii\db\ActiveRecord;

class BaseModel extends yii\db\ActiveRecord
{
    /**
     * 获取一条记录[基类]
     * @param array $condition 筛选条件
     * @param string $field 查找字段
     * @param bool $object 是否返回对象
     * @return array|null|ActiveRecord
     */
    public function selectOne($condition = array(), $field = '*', $object = false)
    {
        $query = self::find()->select($field);
        if (!empty($condition)) {
            $query = $query->where($condition);
        }
        if (!$object) {
            $query = $query->asArray();
        }
        $ret = $query->one();
        return $ret;
    }

    /** 获取所有记录[基类]
     * @param array $condition 筛选条件
     * @param string $field 查找字段
     * @param bool $object 是否返回对象
     * @return array|ActiveRecord[]
     */
    public function selectAll($condition = array(), $field = '*', $object = false)
    {
        $query = self::find()->select($field);
        if (!empty($condition)) {
            $query = $query->where($condition);
        }
        if (!$object) {
            $query = $query->asArray();
        }
        $ret = $query->all();
        return $ret;
    }

    /**
     * 修改数据[基类]
     * @param array $updata 修改的字段和值
     * @param array $where 筛选条件
     * @return bool|int
     */
    public function updateData($updata = array(), $where = array())
    {
        if (empty($updata) || empty($where)) {
            return false;
        }
        $ret = self::updateAll($updata, $where);
        return $ret;
    }


    /**
     *
     * @param array $value 插入记录一维数组
     */
    public function add($data)
    {
        if (empty($data) || !is_array($data)) {
            return false;
        }
        return static::getDb()->createCommand()->insert(static::tableName(), $value)->execute();
    }


    /**
     *
     * @param array $value 插入记录二维数组
     */
    public function addAll($data)
    {
        if (empty($data) || !is_array($data)) {
            return false;
        }
        return static::getDb()->createCommand()
            ->batchInsert(static::tableName(), array_keys($data),
                $data)
            ->execute();
    }

    /**
     * 查询第一条记录的某列标量值
     * @return false|null|string           
     */
    public static function selectScalar($condition = [], $fieldName='')
    {
        if (empty($fieldName)) {
            return false;
        }
        if (empty($condition)) {
            return false;
        }

        return self::find()->where($condition)->select($fieldName)->scalar();
    }

}