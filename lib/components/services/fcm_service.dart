// import 'package:ql_edunet/locator.dart';
// import 'package:ql_edunet/models/fcm/message_model.dart';
// import 'package:ql_edunet/components/services/navigator_service.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_core/firebase_core.dart';

// class FirebaseService extends ChangeNotifier {
//   FirebaseService();

//   final _navigationService = locator<NavigatorService>();

//   void navigateToItemDetail(Map<String, dynamic> message) {
//     final FcmMessage item = itemForMessage(message);
//     // var uri = Uri.parse(ModalRoute.of(context).settings.name);

//     if (ModalRoute.of(_navigationService.navigatorKey.currentContext)
//             .settings
//             .name ==
//         item.chatId) {
//       print(
//           '========================== ${item.chatId} =======================');
//     } else {
//       print(
//           '========================== ${ModalRoute.of(NavigatorService().navigatorKey.currentContext).settings.name} =======================');
//     }
//     // if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'chat') {
//     //   var currentChatId = uri.pathSegments[1];
//     //   if (item.chatId == currentChatId) {
//     //     ConversationController().onMessageFromFCM(
//     //       context,
//     //     );
//     //   }
//     // } else {
//     //   print(ModalRoute.of(context).settings.name);
//     // }
//   }

//   void initFCMService(fn1, fn2, fn3) {
//     Firebase.initializeApp();
//     FirebaseMessaging().requestNotificationPermissions(
//         const IosNotificationSettings(sound: true, badge: true, alert: true));
//     FirebaseMessaging()
//         .onIosSettingsRegistered
//         .listen((IosNotificationSettings settings) {
//       print("iOS Settings registered: $settings");
//     });

//     FirebaseMessaging().configure(
//       onMessage: (Map<String, dynamic> message) async {
//         print("onMessage : $message");
//         navigateToItemDetail(message);
//       },
//       onLaunch: (Map<String, dynamic> message) async {
//         print("onLaunch : $message");
//         navigateToItemDetail(message);
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print("onResume : $message");
//         navigateToItemDetail(message);
//       },
//     );
//   }
// }
