<?php

namespace backend\modules\settings\models;

use Yii;

/**
 * This is the model class for table "company".
 *
 * @property integer $company_id
 * @property string $company_name
 * @property string $company_email
 * @property string $company_address
 * @property string $company_created_date
 * @property string $company_status
 * @property string $company_start_date
 *
 * @property Branches[] $branches
 * @property Departments[] $departments
 */
class Company extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'company';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['company_name', 'company_email', 'company_address', 'company_created_date', 'company_status', 'company_start_date'], 'required'],
            [['company_created_date', 'company_start_date'], 'safe'],
            [['company_status'], 'string'],
            [['company_name', 'company_email'], 'string', 'max' => 100],
            [['company_address'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'company_id' => 'Company ID',
            'company_name' => 'Company Name',
            'company_email' => 'Company Email',
            'company_address' => 'Company Address',
            'company_created_date' => 'Company Created Date',
            'company_status' => 'Company Status',
            'company_start_date' => 'Company Start Date',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBranches()
    {
        return $this->hasMany(Branches::className(), ['company_id' => 'company_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDepartments()
    {
        return $this->hasMany(Departments::className(), ['company_id' => 'company_id']);
    }
}
