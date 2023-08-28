<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "coaches".
 *
 * @property int $id
 * @property string $name
 * @property string $timezone
 * @property int $status
 * @property int $is_deleted
 * @property string $created_on
 * @property string|null $updated_on
 *
 * @property Appointments[] $appointments
 */
class Coaches extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'coaches';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'timezone'], 'required'],
            [['status', 'is_deleted'], 'integer'],
            [['created_on', 'updated_on'], 'safe'],
            [['name', 'timezone'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'timezone' => 'Timezone',
            'status' => 'Status',
            'is_deleted' => 'Is Deleted',
            'created_on' => 'Created On',
            'updated_on' => 'Updated On',
        ];
    }

    /**
     * Gets query for [[Appointments]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAppointments()
    {
        return $this->hasMany(Appointments::class, ['coach_id' => 'id']);
    }


}
