<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\Coaches;
use app\models\Appointments;

class CoachesController extends \yii\web\Controller
{

   
    public function actionListcoaches()
    {
        $coaches = Coaches::find()->where(['status' => 1, 'is_deleted' => 0])->all();
        Yii::$app->response->format = Response::FORMAT_JSON;
        if (!empty($coaches)) {
            return [
                'status' => 'success',
                'message' => 'Coaches list successfully.',
                'data' => $coaches,
            ];
        } else {
            return [
                'status' => 'error',
                'message' => 'No coaches found.',
                'data' => [],
            ];
        }
    }

    public function actionAvailabletimeclots()
    {
        $requestBody = Yii::$app->request->getBodyParams();
        $jsonString = key($requestBody);
        $data = json_decode($jsonString, true);
        if (isset($data['id'])) {
            $coachId = $data['id'];
           
            $availableTimeSlots = Appointments::getAvailableTimeSlots($coachId); // get coach time slots
            if (!empty($availableTimeSlots)) {
                $response = [
                    'status' => 'success',
                    'message' => 'Available Time Slots list successfully.',
                    'data' => $availableTimeSlots,
                ];
               
            } else {
                $response = [
                    'status' => 'error',
                    'message' => 'No coaches found.',
                    'data' => [],
                ];
            }
        }
        
        Yii::$app->response->format = Response::FORMAT_JSON;
        return $response;
        
    }

}
