import 'package:base_project/components/_layouts/app_lib.dart';
import 'package:base_project/components/_variables/values/app_style.dart';
import 'package:base_project/components/_variables/values/text_app_data.dart';
import 'package:base_project/controllers/user/profile_controller.dart';
import 'package:base_project/models/user/profile_model.dart';
import 'package:base_project/models/main/main_model.dart';
import 'package:base_project/views/home/layouts/notification_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = ProfileController();
    final viewModel = Provider.of<ProfileModel>(context, listen: true);
    final actionModel = Provider.of<ActionModel>(context, listen: true);
    actionModel.changeValues(show: true, actions: [NotificationLayout()]);

    final List<FocusNode> _nodes = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode()
    ];

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
            //       TextAppData.getValue("profile"),
            //       style: TextStyle(fontSize: 19, color: Colors.black54),
            //     ),
            //   ),
            // ),
            Builder(
              builder: (context) => Form(
                key: formKey,
                child: Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 25, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      AppLib.getRow(
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 48,
                          child: Text(
                            viewModel.user.userName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppStyle.colors[0][3],
                                fontSize: 18),
                          ),
                        ),
                        start: Container(
                          child: Text(
                            TextAppData.getValue("userName"),
                            style: TextStyle(fontSize: 16),
                          ),
                          width: 105,
                        ),
                        space: 10,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        height: 1,
                      ),
                      AppLib.getRow(
                        viewModel.status == ProfileModelStatus.View
                            ? Container(
                                alignment: Alignment.centerLeft,
                                height: 47,
                                child: Text(
                                  viewModel.user.fullName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: AppStyle.colors[0][3],
                                      fontSize: 18),
                                ),
                              )
                            : AppLib.getTextFormField(
                                (value) {
                                  viewModel.user.fullName = value;
                                },
                                value: viewModel.user.fullName,
                                isRequired: true,
                                action: TextInputAction.next,
                                focus: _nodes[0],
                                onSubmitted: (term) {
                                  _nodes[0].unfocus();
                                  _nodes[1].requestFocus();
                                },
                                autoFocus: true,
                              ),
                        start: Container(
                          child: Text(
                            TextAppData.getValue("fullName"),
                            style: TextStyle(fontSize: 16),
                          ),
                          width: 105,
                        ),
                        space: viewModel.status == ProfileModelStatus.View
                            ? 10
                            : 0,
                      ),
                      viewModel.status == ProfileModelStatus.View
                          ? Divider(
                              height: 1,
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      AppLib.getRow(
                        viewModel.status == ProfileModelStatus.View
                            ? Container(
                                alignment: Alignment.centerLeft,
                                height: 47,
                                child: Text(
                                  viewModel.user.emailAddress,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: AppStyle.colors[0][3],
                                      fontSize: 18),
                                ),
                              )
                            : AppLib.getTextFormField(
                                (value) {
                                  viewModel.user.emailAddress = value;
                                },
                                value: viewModel.user.emailAddress,
                                isRequired: true,
                                action: TextInputAction.next,
                                focus: _nodes[1],
                                onSubmitted: (term) {
                                  _nodes[1].unfocus();
                                  _nodes[2].requestFocus();
                                },
                              ),
                        start: Container(
                          child: Text(
                            TextAppData.getValue("email"),
                            style: TextStyle(fontSize: 16),
                          ),
                          width: 105,
                        ),
                        space: viewModel.status == ProfileModelStatus.View
                            ? 10
                            : 0,
                      ),
                      viewModel.status == ProfileModelStatus.View
                          ? Divider(
                              height: 1,
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      AppLib.getRow(
                        viewModel.status == ProfileModelStatus.View
                            ? Container(
                                alignment: Alignment.centerLeft,
                                height: 47,
                                child: Text(
                                  viewModel.user.phoneNumber != null
                                      ? viewModel.user.phoneNumber
                                      : "",
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            : AppLib.getTextFormField(
                                (value) {
                                  viewModel.user.phoneNumber = value;
                                },
                                value: viewModel.user.phoneNumber,
                                isRequired: true,
                                action: TextInputAction.next,
                                focus: _nodes[2],
                                onSubmitted: (term) {
                                  _nodes[2].unfocus();
                                  _nodes[3].requestFocus();
                                },
                              ),
                        start: Container(
                          child: Text(
                            TextAppData.getValue("phone"),
                            style: TextStyle(fontSize: 16),
                          ),
                          width: 105,
                        ),
                        space: viewModel.status == ProfileModelStatus.View
                            ? 10
                            : 0,
                      ),
                      viewModel.status == ProfileModelStatus.View
                          ? Divider(
                              height: 1,
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      AppLib.getRow(
                        viewModel.status == ProfileModelStatus.View
                            ? Container(
                                alignment: Alignment.centerLeft,
                                height: 47,
                                child: Text(
                                  viewModel.user.address,
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            : AppLib.getTextFormField(
                                (value) {
                                  viewModel.user.address = value;
                                },
                                value: viewModel.user.address,
                                action: TextInputAction.done,
                                focus: _nodes[3],
                                onSubmitted: (term) {
                                  _nodes[3].unfocus();
                                },
                              ),
                        start: Container(
                          child: Text(
                            TextAppData.getValue("address"),
                            style: TextStyle(fontSize: 16),
                          ),
                          width: 105,
                        ),
                        space: viewModel.status == ProfileModelStatus.View
                            ? 10
                            : 0,
                      ),
                      viewModel.status == ProfileModelStatus.View
                          ? Divider(
                              height: 3,
                            )
                          : SizedBox(
                              height: 0,
                            ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 0, bottom: 35, left: 20, right: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: viewModel.status == ProfileModelStatus.View
                    ? RaisedButton(
                        child: Text(TextAppData.getValue("edit")),
                        onPressed: () => controller.changeStatus(
                            context, ProfileModelStatus.Edit),
                        color: AppStyle.colors[0][1])
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RaisedButton(
                              child: Text(
                                TextAppData.getValue("save"),
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                final form = formKey.currentState;
                                form.save();
                                if (form.validate()) {
                                  controller.saveProfile(context);
                                }
                              },
                              color: AppStyle.colors[0][3]),
                          RaisedButton(
                            child: Text(TextAppData.getValue("cancelEdit")),
                            onPressed: () => controller.changeStatus(
                                context, ProfileModelStatus.View),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
