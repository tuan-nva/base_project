import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:base_project/components/_variables/https/edu_app_http.dart';
import 'package:base_project/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitBrowserLayout extends StatelessWidget {
  final String token;
  InitBrowserLayout(this.token);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context, listen: false);

    var flutterWebViewPlugin = new FlutterWebviewPlugin();

    flutterWebViewPlugin.close();

    flutterWebViewPlugin.onStateChanged.listen((viewState) async {
      if (viewState.type == WebViewState.finishLoad) {
        await Future.delayed(Duration(seconds: 2));

        flutterWebViewPlugin.close();
        flutterWebViewPlugin.dispose();

        controller.finishedInit(context);
      }
    });

    flutterWebViewPlugin.launch(
      EduMobileAppHttp.eduUrl(
        "account/setToken/#" + token,
      ),
      rect: new Rect.fromLTWH(
        0.0,
        80.0,
        MediaQuery.of(context).size.width,
        100.0,
      ),
    );

    return Container();
  }
}
