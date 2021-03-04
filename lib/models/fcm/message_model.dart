import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

class FCMNotificationDataModal {
  String title;
  String body;
  String icon;
  FCMNotificationDataModal({
    this.title,
    this.body,
    this.icon,
  });
  factory FCMNotificationDataModal.fromJson(Map<String, dynamic> jsonInput) {
    if (jsonInput == null) return null;
    return FCMNotificationDataModal(
      title: jsonInput['title'],
      body: jsonInput['body'],
      icon: jsonInput['icon'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();

    map['title'] = title;
    map['body'] = body;
    map['icon'] = icon;

    return map;
  }
}

final Map<String, FcmMessage> _items = <String, FcmMessage>{};

FcmMessage itemForMessage(Map<String, dynamic> message) {
  final data = message['data'] ?? message;
  final dynamic conversation = json.decode(data['conversation']) ?? data;
  final String chatId =
      conversation.groupId ?? conversation.senderId.toString();
  final FcmMessage item =
      _items.putIfAbsent(chatId, () => FcmMessage(chatId: chatId))
        ..status = conversation.status
        ..conversation = conversation
        .._listNotification = _items;
  return item;
}

class FcmMessage {
  final String chatId;
  dynamic conversation;
  FcmMessage({this.chatId});

  StreamController<FcmMessage> _controller =
      StreamController<FcmMessage>.broadcast();
  Stream<FcmMessage> get onChanged => _controller.stream;

  String _status;
  String get status => _status;
  set status(String value) {
    _status = value;
    _controller.add(this);
  }

  Map<String, FcmMessage> _listNotification = <String, FcmMessage>{};
  Map<String, FcmMessage> get listNotification => _listNotification;
  set listNotification(Map<String, FcmMessage> values) {
    if (true) {
      _listNotification = values;
    }
    _controller.add(this);
  }

  static final Map<String, Route<void>> routes = <String, Route<void>>{};

  Route<void> get route {
    final String routeName = '/chat/$chatId';
    return routes.putIfAbsent(
      routeName,
      () => MaterialPageRoute<void>(
        settings: RouteSettings(name: routeName, arguments: conversation),
        builder: (BuildContext context) => null,
      ),
    );
  }
}
