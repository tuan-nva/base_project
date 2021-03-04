import 'package:base_project/components/_layouts/app_lib.dart';
import 'package:base_project/components/_variables/values/app_style.dart';
import 'package:base_project/components/_variables/values/text_app_data.dart';
import 'package:base_project/controllers/main/login_controller.dart';
import 'package:base_project/models/main/login_model.dart';
import 'package:base_project/views/bases/logo/layouts/logo_layout.dart';
import 'package:flutter/material.dart';

class LoginLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var viewModel = LoginModel();
    LoginController viewController = LoginController();
    final formKey = GlobalKey<FormState>();

    final FocusNode _userNameFocus = FocusNode();
    final FocusNode _passwordFocus = FocusNode();

    return Container(
      color: AppStyle.colors[0][4],
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 30.0,
          ),
          LogoLayout(),
          SizedBox(height: 12.0),
          // Text(
          //   TextAppData.getValue("login"),
          //   textAlign: TextAlign.center,
          //   style: TextStyle(color: AppStyle.colors[1][1], fontSize: 18),
          // ),
          Container(
            padding: EdgeInsets.only(left: 32, right: 32, top: 20),
            child: Builder(
              builder: (context) => Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        child: AppLib.getTextFormField(
                          (value) => viewModel.userName = value,
                          start: AppLib.getCircle(
                            AppStyle.colors[0][1],
                            32,
                            32,
                            Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          text: TextAppData.getValue("userName"),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          isRequired: true,
                          action: TextInputAction.next,
                          focus: _userNameFocus,
                          onSubmitted: (term) {
                            _userNameFocus.unfocus();
                            _passwordFocus.requestFocus();
                          },
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        child: AppLib.getTextFormField(
                          (value) => viewModel.password = value,
                          start: AppLib.getCircle(
                            AppStyle.colors[0][1],
                            32,
                            32,
                            Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          text: TextAppData.getValue("password"),
                          isSecurity: true,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          isRequired: true,
                          action: TextInputAction.done,
                          focus: _passwordFocus,
                          onSubmitted: (term) {
                            _passwordFocus.unfocus();
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: RaisedButton(
                        child: Text(
                          TextAppData.getValue("login"),
                        ),
                        color: AppStyle.colors[0][3],
                        textColor: Colors.white,
                        onPressed: () {
                          final form = formKey.currentState;
                          form.save();

                          viewController.login(context, viewModel);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
