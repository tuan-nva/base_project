import 'dart:async';
import 'dart:convert';

import 'package:base_project/components/_variables/values/app_const.dart';
import 'package:signalr_client/signalr_client.dart';

class SignalrService {
  // Properties
  String _serverUrl;
  HubConnection _hubConnection;

  bool _connectionIsOpen;
  bool get connectionIsOpen => _connectionIsOpen;
  set connectionIsOpen(bool value) {
    if (true) {
      _connectionIsOpen = value;
    }
  }

  StreamController _streamController = StreamController.broadcast();
  Stream get onChanged => _streamController.stream;

// Methods

  SignalrService() {
    _serverUrl = apiHUB + "signalr?enc_auth_token=";
    _connectionIsOpen = false;

    // openChatConnection();
  }

  Future<void> openChatConnection(String encrptedAuthToken) async {
    if (encrptedAuthToken != null) {
      _serverUrl = _serverUrl + Uri.encodeComponent(encrptedAuthToken);
      if (_hubConnection == null) {
        _hubConnection = HubConnectionBuilder().withUrl(_serverUrl).build();
        _hubConnection.onclose((error) => connectionIsOpen = false);
        _hubConnection.on("GetMessageToGroup", _handleIncommingMessageToGroup);

        _hubConnection.on("GetMessageToUser", _handleIncomingMessageToInbox);
      }

      if (_hubConnection.state != HubConnectionState.Connected) {
        await _hubConnection.start();
        print(_hubConnection.state);
        _connectionIsOpen = true;
      }
    }
    return this;
  }

  Future<void> sendChatMessage(
    dynamic message,
    String encrptedAuthToken,
  ) async {
    if (message == null) {
      return;
    }
    await openChatConnection(encrptedAuthToken);
    _hubConnection.invoke(
      "MobileSendMessgersAsync", //server function
      args: <Object>[jsonEncode((message.toMap()))],
    );
  }

  Future<void> _handleIncommingMessageToGroup(List<Object> args) async {
    // final group = GroupDataModal.fromJson(args[1]);
    // final message = ConversationOutputDataModal.fromJson(args[0]);

    _streamController.add(this);
  }

  Future<void> _handleIncomingMessageToInbox(List<Object> args) async {
    // final int senderId = args[0];
    // final message = ConversationOutputDataModal.fromJson(args[1]);

    _streamController.add(this);
  }
}
