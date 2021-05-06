import 'package:flutter/material.dart';
import 'package:local_notification_example/services/notification.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<NotificationService>(context, listen: false).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Consumer<NotificationService>(
          builder: (context, modal, _) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => modal.instantNotification(),
                  child: Text('Instant Notification')),
              ElevatedButton(
                  onPressed: () => modal.imageNotification(),
                  child: Text('Image Notification')),
              ElevatedButton(
                  onPressed: () => modal.stylishNotification(),
                  child: Text('Media Notification')),
              ElevatedButton(
                  onPressed: () => modal.scheduledNotification(),
                  child: Text('Scheduled Notification')),
              ElevatedButton(
                  onPressed: () => modal.cancelNotification(),
                  child: Text('Cancel Notification')),
            ],
          ),
        )),
      ),
    );
  }
}
