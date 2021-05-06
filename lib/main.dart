import 'package:flutter/material.dart';
import 'package:local_notification_example/services/notification.dart';
import 'package:local_notification_example/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'Monteserat'),
          home: HomeScreen(),
          debugShowCheckedModeBanner: false,
        ),
        providers: [
          ChangeNotifierProvider(
            create: (_) => NotificationService(),
          )
        ]);
  }
}
