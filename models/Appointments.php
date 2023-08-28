<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "appointments".
 *
 * @property int $id
 * @property int $coach_id
 * @property string $day_of_week
 * @property string $start_time
 * @property string $end_time
 * @property int $status
 * @property int $is_deleted
 *
 * @property Coaches $coach
 */
class Appointments extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'appointments';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
           // [['coach_id', 'day_of_week', 'start_time', 'end_time'], 'required'],
            [['coach_id', 'status', 'is_deleted'], 'integer'],
            [['start_time', 'end_time'], 'safe'],
            [['day_of_week'], 'string', 'max' => 255],
            [['coach_id'], 'exist', 'skipOnError' => true, 'targetClass' => Coaches::class, 'targetAttribute' => ['coach_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'coach_id' => 'Coach ID',
            'day_of_week' => 'Day Of Week',
            'start_time' => 'Start Time',
            'end_time' => 'End Time',
            'status' => 'Status',
            'is_deleted' => 'Is Deleted',
        ];
    }

    /**
     * Gets query for [[Coach]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCoach()
    {
        return $this->hasOne(Coaches::class, ['id' => 'coach_id']);
    }

    public function getAvailableTimeSlots($id) //Check Time slots
    {
        $appointments = Appointments::find()->where(['coach_id' => $id])->all();

        $availableTimeSlots = [];


        $startTime = strtotime(date('Y-m-d H:i:s'));
        $tomorrowTimestamp = strtotime("+1 day");
        $endTime = strtotime(date("Y-m-d  H:i:s", $tomorrowTimestamp));

        $currentSlot = $startTime;

        while ($currentSlot < $endTime) {
            $formattedTime = date('H:i:s', $currentSlot);
            
            
            $isSlotAvailable = true;
            foreach ($appointments as $appointment) {
                if (strtotime($formattedTime) >= strtotime($appointment->start_time)
                    && strtotime($formattedTime) < strtotime($appointment->end_time)) {
                    $isSlotAvailable = false;
                    break;
                }
            }

            if ($isSlotAvailable) {
                $availableTimeSlots[] = $formattedTime;
            }

            $currentSlot += 1800;
        }

        return $availableTimeSlots;
    }
}
