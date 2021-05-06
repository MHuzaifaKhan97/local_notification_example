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

  // Instant Notification
  Future instantNotification() async {
    var android = AndroidNotificationDetails(
      "id",
      "channel",
      "description",
    );

    // If working only for IOS so pass Id, channel and desc as defined above.
    var ios = IOSNotificationDetails();

    var platform = new NotificationDetails(android: android, iOS: ios);
    await flutterLocalNotificationsPlugin.show(0, 'Demo Instant Notification',
        'Body of Instant Notification', platform,
        payload: 'Welcome to Demo App');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text('Flutter notification demo'),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: instantNotification,
              child: new Text(
                'showNotification',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
