<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%goods}}`.
 */
class m190228_015952_create_goods_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            // http://stackoverflow.com/questions/766809/whats-the-difference-between-utf8-general-ci-and-utf8-unicode-ci
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }
        $this->createTable('{{%goods}}', [
            'id' => $this->primaryKey(),
            'name' => $this->string(32)->notNull(),
            'create_time' => $this->datetime(),
        ],$tableOptions);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%goods}}');
    }
}
