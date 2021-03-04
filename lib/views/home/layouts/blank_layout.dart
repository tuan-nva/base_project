import 'package:flutter/material.dart';

class BlankLayout extends StatelessWidget {
  BlankLayout();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        'Vui lòng sử dụng tài khoản Giáo viên để đăng nhập ứng dụng này!',
        style: TextStyle(color: Colors.red),
      ),
    );
    // : Scaffold(
    //     appBar: AppBar(
    //       title: Text(TextAppData.getValue("app")),
    //     ),
    //     drawer: DrawerMenuLayout(),
    //     backgroundColor: AppStyle.colors[1][0],
    //     body: ListView(
    //       children: [
    //         Container(
    //           margin: EdgeInsets.all(10),
    //           child: Text(
    //             'Vui lòng sử dụng tài khoản Giáo viên để đăng nhập ứng dụng này!',
    //             style: TextStyle(color: Colors.red),
    //           ),
    //         ),
    //       ],
    //     ));
  }
}
