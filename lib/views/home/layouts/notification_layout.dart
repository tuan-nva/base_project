import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:base_project/models/fcm/message_model.dart';
import 'package:base_project/models/main/main_model.dart';

class NotificationLayout extends StatefulWidget {
  final FcmMessage item;
  NotificationLayout({this.item});
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationLayout> {
  // StreamSubscription<FcmMessage> _subscription;
  bool _isNotification = false;
  @override
  void initState() {
    super.initState();
    FirebaseMessaging().requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    FirebaseMessaging()
        .onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("iOS Settings registered: $settings");
    });

    FirebaseMessaging().configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage : $message");
        setState(() {
          _isNotification = true;
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch : $message");
        setState(() {
          _isNotification = true;
        });
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume : $message");
        setState(() {
          _isNotification = true;
        });
      },
    );
  }

  void readNotification() {
    setState(() {
      _isNotification = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mainModel = Provider.of<MainModel>(context, listen: true);
    return Container(
      child: GestureDetector(
        child: Stack(
          children: [
            Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            Positioned(
              child: ClipOval(
                child: _isNotification
                    ? Container(height: 5, width: 5, color: Colors.red)
                    : Container(),
              ),
              right: 2,
              top: 0,
            )
          ],
        ),
        onTap: () {
          readNotification();
          mainModel.changeValues(
              // child: CMSPostView(CMSPostType.Notify),
              );
        },
      ),
      margin: EdgeInsets.only(top: 15, right: 15),
    );
  }
}
