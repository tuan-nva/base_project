import 'package:base_project/components/_layouts/app_lib.dart';
import 'package:base_project/components/_variables/values/app_style.dart';
import 'package:base_project/components/_variables/values/text_app_data.dart';
import 'package:base_project/controllers/menus/menu_profile_controller.dart';
import 'package:base_project/models/user/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuProfileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProfileModel>(context, listen: true);

    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: 64.0,
                      padding: EdgeInsets.only(left: 70, top: 16),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('assets/logo.png'),
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          TextAppData.getValue("app"),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  AppLib.getRow(
                    Text(
                      viewModel.user == null ? '' : viewModel.user?.userName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                      ),
                    ),
                    start: Icon(
                      Icons.alternate_email,
                      size: 16,
                      color: Colors.white,
                    ),
                    space: 4,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    viewModel.user == null ? '' : viewModel.user?.fullName,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: AssetImage("assets/menu5.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children:
              viewModel.user != null && viewModel.user.eduRole == 'TEACHER'
                  ? [
                      Divider(
                        height: 1,
                      ),
                      AppLib.getRow(
                        FlatButton(
                          padding: EdgeInsets.only(left: 10),
                          onPressed: () =>
                              MenuProfileController().viewProfile(context),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              TextAppData.getValue("profile"),
                            ),
                          ),
                        ),
                        start: Container(
                          child: Icon(
                            Icons.verified_user,
                            color: AppStyle.colors[0][1],
                            size: 20,
                          ),
                          width: 24,
                        ),
                        end: Icon(Icons.chevron_right),
                        space: 0,
                        padding: EdgeInsets.only(left: 10, right: 10),
                      ),
                      Divider(
                        height: 1,
                      ),
                      AppLib.getRow(
                        FlatButton(
                          padding: EdgeInsets.only(left: 10),
                          onPressed: () =>
                              MenuProfileController().changeAccount(context),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              TextAppData.getValue("changeAccount"),
                            ),
                          ),
                        ),
                        start: Container(
                          child: Icon(
                            Icons.account_circle,
                            color: AppStyle.colors[0][1],
                            size: 20,
                          ),
                          width: 24,
                        ),
                        end: Icon(Icons.chevron_right),
                        space: 0,
                        padding: EdgeInsets.only(left: 10, right: 10),
                      ),
                      Divider(
                        height: 1,
                      ),
                      AppLib.getRow(
                        FlatButton(
                          padding: EdgeInsets.only(left: 10),
                          onPressed: () =>
                              MenuProfileController().userLogout(context),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              TextAppData.getValue("logout"),
                            ),
                          ),
                        ),
                        start: Container(
                          child: Icon(
                            Icons.exit_to_app,
                            color: AppStyle.colors[0][1],
                            size: 20,
                          ),
                          width: 24,
                        ),
                        end: Icon(Icons.chevron_right),
                        space: 0,
                        padding: EdgeInsets.only(left: 10, right: 10),
                      ),
                      Divider(
                        height: 1,
                      ),
                    ]
                  : [
                      Divider(
                        height: 1,
                      ),
                      AppLib.getRow(
                        FlatButton(
                          padding: EdgeInsets.only(left: 10),
                          onPressed: () =>
                              MenuProfileController().userLogout(context),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              TextAppData.getValue("logout"),
                            ),
                          ),
                        ),
                        start: Container(
                          child: Icon(
                            Icons.exit_to_app,
                            color: AppStyle.colors[0][1],
                            size: 20,
                          ),
                          width: 24,
                        ),
                        end: Icon(Icons.chevron_right),
                        space: 0,
                        padding: EdgeInsets.only(left: 10, right: 10),
                      ),
                      Divider(
                        height: 1,
                      ),
                    ],
        ),
      ],
    );
  }
}
