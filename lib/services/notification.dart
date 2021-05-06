import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_notification_example/views/new_screen.dart';

class NotificationService extends ChangeNotifier {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize
  Future initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("ic_launcher");

    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Instant Notification
  Future instantNotification() async {
    var android = AndroidNotificationDetails("id", "channel", "description");

    // If working only for IOS so pass Id, channel and desc as defined above.
    var ios = IOSNotificationDetails();

    var platform = new NotificationDetails(android: android, iOS: ios);
    await _flutterLocalNotificationsPlugin.show(0, 'Demo Instant Notification',
        'Body of Instant Notification', platform,
        payload: 'Welcome to Demo App');
  }

  // Image Notification
  Future imageNotification() async {
    var bigPicture = BigPictureStyleInformation(
      DrawableResourceAndroidBitmap('ic_launcher'),
      largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
      contentTitle: "Demo Image Notification",
      summaryText: "This is some text",
      htmlFormatContent: true,
      htmlFormatContentTitle: true,
    );

    var android = AndroidNotificationDetails("id", "channel", "description",
        priority: Priority.high,
        importance: Importance.max,
        styleInformation: bigPicture);
    var platform = new NotificationDetails(
      android: android,
    );

    await _flutterLocalNotificationsPlugin.show(
        0, 'Demo Image Notification', 'Body of Image Notification', platform,
        payload: 'Welcome to Demo App');
  }

  // Stylish Notification
  Future stylishNotification() async {
    var android = AndroidNotificationDetails(
      "id",
      "channel",
      "description",
      color: Colors.deepOrange,
      enableLights: true,
      enableVibration: true,
      largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
      styleInformation:
          MediaStyleInformation(htmlFormatContent: true, htmlFormatTitle: true),
    );

    var platform = new NotificationDetails(android: android);

    await _flutterLocalNotificationsPlugin.show(0, 'Demo Stylish Notification',
        'Body of Stylish Notification', platform);
  }

  // Scheduled Notification
  Future scheduledNotification() async {
    var interval = RepeatInterval.everyMinute;

    var bigPicture = BigPictureStyleInformation(
      DrawableResourceAndroidBitmap('ic_launcher'),
      largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
      contentTitle: "Demo Scheduled Notification",
      summaryText: "This is some text",
      htmlFormatContent: true,
      htmlFormatContentTitle: true,
    );

    var android = AndroidNotificationDetails("id", "channel", "description",
        styleInformation: bigPicture);
    var platform = new NotificationDetails(
      android: android,
    );

    await _flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        'Demo Scheduled Notification',
        'Body of Image Notification',
        interval,
        platform);
  }

  // Cancel Notification
  Future cancelNotification() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
