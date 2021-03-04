import 'package:base_project/components/_layouts/app_lib.dart';
import 'package:base_project/components/_variables/values/app_style.dart';
import 'package:base_project/components/_variables/values/text_app_data.dart';
import 'package:base_project/controllers/user/account_controller.dart';
import 'package:base_project/models/user/account_model.dart';
import 'package:base_project/models/main/main_model.dart';
import 'package:base_project/views/home/layouts/notification_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountLayout extends StatelessWidget {
  final String _userName;
  AccountLayout(this._userName);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = AccountController();
    AccountModel viewModel = AccountModel(input: _userName);
    final actionModel = Provider.of<ActionModel>(context, listen: true);
    actionModel.changeValues(show: true, actions: [NotificationLayout()]);

    final List<FocusNode> _nodes = [FocusNode(), FocusNode()];

    return Card(
      color: Colors.white,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Container(
            //   padding: EdgeInsets.only(top: 15, bottom: 15),
            //   color: AppStyle.colors[2][1],
            //   child: Align(
            //     alignment: Alignment.center,
            //     child: Text(
            //       TextAppData.getValue("changeAccount"),
            //       style: TextStyle(fontSize: 19, color: Colors.black54),
            //     ),
            //   ),
            // ),
            Builder(
              builder: (context) => Form(
                key: formKey,
                child: Container(
                  padding:
                      EdgeInsets.only(top: 30, bottom: 25, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      AppLib.getRow(
                        AppLib.getTextFormField(
                          (value) {
                            viewModel.userName = value;
                          },
                          value: viewModel.userName,
                          text: TextAppData.getValue("userName"),
                          isRequired: true,
                          action: TextInputAction.next,
                          focus: _nodes[0],
                          onSubmitted: (term) {
                            _nodes[0].unfocus();
                            _nodes[1].requestFocus();
                          },
                          autoFocus: true,
                        ),
                        start: AppLib.getCircle(
                          AppStyle.colors[0][1],
                          32,
                          32,
                          Icon(
                            Icons.vpn_key,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                      AppLib.getRow(
                        AppLib.getTextFormField(
                          (value) {
                            viewModel.password = value;
                          },
                          text: TextAppData.getValue("password"),
                          value: viewModel.password,
                          isRequired: true,
                          action: TextInputAction.next,
                          focus: _nodes[1],
                          onSubmitted: (term) {
                            _nodes[1].unfocus();
                          },
                        ),
                        start: AppLib.getCircle(
                          AppStyle.colors[0][1],
                          32,
                          32,
                          Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 45, left: 20, right: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: RaisedButton(
                  child: Text(
                    TextAppData.getValue("save"),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    final form = formKey.currentState;
                    form.save();
                    if (form.validate()) {
                      controller.changeAccount(context, viewModel);
                    }
                  },
                  color: AppStyle.colors[0][3],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // Scaffold(
    //     backgroundColor: AppStyle.colors[1][0],
    //     appBar: AppBar(
    //       title: Text(TextAppData.getValue("changeAccount")),
    //       titleSpacing: -5,
    //     ),
    //     drawer: DrawerMenuLayout(),
    //     body: );
  }
}
