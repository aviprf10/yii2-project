<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\Appointments;


class AppointmentsController extends \yii\web\Controller
{
    public function actionBookappointment() //add book appointment
    {
        $requestBody = Yii::$app->request->getBodyParams();
        $jsonString = key($requestBody);
        $data = json_decode($jsonString, true);
        $appointment = new Appointments();
        $appointment->coach_id = $data['coach_id'];
        $appointment->start_time = $data['start_time'];
        $appointment->end_time = $data['end_time'];
        if ($appointment->save()) {
            $response = [
                'status' => 'success',
                'message' => 'Appointment booked successfully',
            ];
        } else {
            $response = [
                'status' => 'error',
                'message' => $appointment->errors,
            ];
           
        }

        Yii::$app->response->format = Response::FORMAT_JSON;
        return $response;
    }

}
