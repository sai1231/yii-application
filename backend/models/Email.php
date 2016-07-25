<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "email".
 *
 * @property integer $id
 * @property string $receiver_name
 * @property string $receiver_email
 * @property string $content
 * @property string $attachment
 * @property string $subject
 */
class Email extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'email';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [[ 'receiver_name', 'receiver_email', 'content', 'attachment', 'subject'], 'required'],
            // [['id'], 'integer'],
            [['content'], 'string'],
            [['receiver_name'], 'string', 'max' => 100],
            [['receiver_email'], 'string', 'max' => 200],
            [['attachment', 'subject'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'receiver_name' => 'Receiver Name',
            'receiver_email' => 'Receiver Email',
            'content' => 'Content',
            'attachment' => 'Attachment',
            'subject' => 'Subject',
        ];
    }
}
