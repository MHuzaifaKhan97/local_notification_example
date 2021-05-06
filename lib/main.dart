// import 'package:flutter/material.dart';
// import 'package:local_notification_example/services/notification.dart';
// import 'package:local_notification_example/views/home_screen.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//         child: MaterialApp(
//           theme: ThemeData(fontFamily: 'Monteserat'),
//           home: HomeScreen(),
//           debugShowCheckedModeBanner: false,
//         ),
//         providers: [
//           ChangeNotifierProvider(create: (_) => NotificationService())
//         ]);
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(new MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: Colors.red,
      )),
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    initialize();
  }

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

  // Show Notification
  Future showNotification() async {
    print('show  notification');
    var android = AndroidNotificationDetails("id", "channel", "description",
        importance: Importance.max);
    var ios = IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: android, iOS: ios);

    // await flutterLocalNotificationsPlugin.show(
    //     0, "Task", "you created a task", generalNotificationDetails);

    var scheduleTime = DateTime.now().add(Duration(seconds: 10));
    await flutterLocalNotificationsPlugin.schedule(0, "Task",
        "Schedule Notification", scheduleTime, generalNotificationDetails,
        androidAllowWhileIdle: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text('Flutter notification demo'),
      ),
      body: new Center(
        child: ElevatedButton(
          onPressed: showNotification,
          child: new Text(
            'Flutter Notification',
          ),
        ),
      ),
    );
  }

  // On Selected Notification
  Future notificationSelected(String payload) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text('Flutter Notification'),
            ));
  }
}
