import 'package:flutter/material.dart';
import 'package:fruit_market/screens/notifications/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  userwait() async {
    await Future.delayed(Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
            ],
          ),
        ));
  }
}
