

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class local_notification_service{


  static const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');


  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();


  Future<void> init() async {
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

}



  Future<void> showNotifications(String title,String body) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('exam id', 'exam',
        channelDescription: 'Exam notification',
        importance: Importance.high,
        priority: Priority.high,);

    const NotificationDetails platformDetails =
      NotificationDetails(android: androidNotificationDetails);


    await flutterLocalNotificationsPlugin.show(
        0, 'You are close to destination', body,platformDetails);


  }




}