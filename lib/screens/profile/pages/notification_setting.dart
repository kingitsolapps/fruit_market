import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fruit_market/constants.dart';
import 'package:get/get.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({Key? key}) : super(key: key);

  @override
  _NotificationSettingState createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool account_notification = true;
  bool pramotional_notification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Setting'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      child: Icon(
                        Icons.notifications,
                        color: kPrimaryColor,
                        size: 35,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'My Account',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'You will receive daily updates',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    child: FlutterSwitch(
                      width: 60.0,
                      height: 27.0,
                      valueFontSize: 15.0,
                      toggleSize: 25.0,
                      value: account_notification,
                      borderRadius: 30.0,
                      padding: 4.0,
                      showOnOff: true,
                      activeColor: kPrimaryColor,
                      onToggle: (val) {
                        setState(() {
                          account_notification = val;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1,
              width: Get.width,
              child: Container(
                color: Colors.grey.shade300,
              ),
            ),

            /// secont notification

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      child: Icon(
                        Icons.notifications,
                        color: kPrimaryColor,
                        size: 35,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Pramotional Notifications',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'You will receive daily updates',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    child: FlutterSwitch(
                      width: 60.0,
                      height: 27.0,
                      valueFontSize: 15.0,
                      toggleSize: 25.0,
                      value: pramotional_notification,
                      borderRadius: 30.0,
                      padding: 4.0,
                      showOnOff: true,
                      activeColor: kPrimaryColor,
                      onToggle: (val) {
                        setState(() {
                          pramotional_notification = val;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 1,
            //   width: Get.width,
            //   child: Container(
            //     color: Colors.grey.shade300,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
