import 'package:base_project/components/_bases/base_model.dart';
import 'package:base_project/components/_variables/values/text_app_data.dart';
import 'package:base_project/controllers/main/main_controller.dart';
import 'package:base_project/models/main/main_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<MainModel>(
            create: (_) => MainModel.instance(),
          ),
          ChangeNotifierProvider<TitleModel>(
            create: (_) => TitleModel.instance(),
          ),
          ChangeNotifierProvider<StatusModel>(
            create: (_) => StatusModel.instance(),
          ),
          ChangeNotifierProvider<DrawerModel>(
            create: (_) => DrawerModel.instance(),
          ),
          ChangeNotifierProvider<BottomSheetModel>(
            create: (_) => BottomSheetModel.instance(),
          ),
          ChangeNotifierProvider<BottomModel>(
            create: (_) => BottomModel.instance(),
          ),
          ChangeNotifierProvider<LeadingModel>(
            create: (_) => LeadingModel.instance(),
          ),
          ChangeNotifierProvider<ActionModel>(
            create: (_) => ActionModel.instance(),
          ),
          ChangeNotifierProvider<FloatingActionModel>(
            create: (_) => FloatingActionModel.instance(),
          ),
          Provider<MainController>(
            create: (context) => MainController.instance(context),
          ),
        ],
        child: Consumer<MainModel>(builder: (context, model, child) {
          return Consumer<MainController>(
              builder: (context, controller, child) {
            return Scaffold(
              appBar: AppBar(
                title: title(context),
                bottom: bottom(context),
                leading: leading(context),
                actions: actions(context),
              ),
              body: ListView(
                children: <Widget>[body(context)],
              ),
              drawer: drawerLayout(context),
              floatingActionButton: floatingActionButton(context),
              floatingActionButtonAnimator:
                  floatingActionButtonAnimator(context),
              floatingActionButtonLocation:
                  floatingActionButtonLocation(context),
              bottomSheet: bottomSheetLayout(context),
            );
          });
        }));
  }
}

Widget title(BuildContext context) {
  final titleModel = Provider.of<TitleModel>(context, listen: true);

  return titleModel != null && titleModel.title != null
      ? Text(titleModel.title)
      : Text(TextAppData.getValue("title"));
}

Widget statusLayout(BuildContext context) {
  final statusModel = Provider.of<StatusModel>(context, listen: true);

  return statusModel != null && statusModel.status == BaseModelStatus.Loading
      ? LinearProgressIndicator()
      : Container();
}

PreferredSizeWidget bottom(BuildContext context) {
  final bottomModel = Provider.of<BottomModel>(context, listen: true);
  return bottomModel != null && bottomModel.child != null
      ? bottomModel.child
      : PreferredSize(
          child: statusLayout(context),
          preferredSize: Size.zero,
        );
}

Widget leading(BuildContext context) {
  final leadingModel = Provider.of<LeadingModel>(context, listen: true);
  return leadingModel != null && leadingModel.show ? leadingModel.child : null;
}

Widget drawerLayout(BuildContext context) {
  final drawerModel = Provider.of<DrawerModel>(context, listen: true);
  return drawerModel != null && drawerModel.isDisplayed
      ? drawerModel.drawer
      : null;
}

Widget bottomSheetLayout(BuildContext context) {
  final bottomSheetModel = Provider.of<BottomSheetModel>(context, listen: true);
  return bottomSheetModel != null &&
          bottomSheetModel.status == BaseModelStatus.View
      ? bottomSheetModel.child
      : null;
}

Widget floatingActionButton(BuildContext context) {
  final floatingActionModel =
      Provider.of<FloatingActionModel>(context, listen: true);
  return floatingActionModel.show ? floatingActionModel.button : null;
}

FloatingActionButtonLocation floatingActionButtonLocation(
    BuildContext context) {
  final floatingActionModel =
      Provider.of<FloatingActionModel>(context, listen: true);
  return floatingActionModel.buttonLocation;
}

FloatingActionButtonAnimator floatingActionButtonAnimator(
    BuildContext context) {
  final floatingActionModel =
      Provider.of<FloatingActionModel>(context, listen: true);
  return floatingActionModel.buttonAnimator;
}

List<Widget> actions(BuildContext context) {
  final actionModel = Provider.of<ActionModel>(context, listen: true);
  return actionModel.show ? actionModel.actions : [];
}

Widget body(BuildContext context) {
  final mainModel = Provider.of<MainModel>(context, listen: true);
  return mainModel != null && mainModel.child != null
      ? mainModel.child
      : Container(
          color: Colors.white,
        );
}
