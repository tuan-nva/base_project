import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:base_project/components/_layouts/app_lib.dart';

enum ButtonType {
  RaisedButton,
  FlatButton,
}

class AppDialog {
  static Future<String> showMessage(
    BuildContext context,
    String message,
    String detail, {
    bool detailIsHTML,
    ButtonType type,
    String buttonText,
    Color buttonColor,
    Color buttonTextColor,
  }) async {
    buttonText = buttonText != null ? buttonText : "OK";
    detailIsHTML = detailIsHTML != null ? detailIsHTML : false;

    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.all(24),
          title: AppLib.getRow(
            Text(message),
            start: AppLib.getRect(
              Colors.white,
              36,
              36,
              Image.asset("assets/logo.png"),
            ),
          ),
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: detailIsHTML ? Html(data: detail) : Text(detail),
            ),
            type == null || type == ButtonType.RaisedButton
                ? RaisedButton(
                    child: Text(buttonText),
                    onPressed: () {
                      Navigator.of(context).pop(buttonText);
                    },
                    textColor: buttonTextColor,
                    color: buttonColor,
                  )
                : type == ButtonType.FlatButton
                    ? FlatButton(
                        child: Text(buttonText),
                        onPressed: () {
                          Navigator.of(context).pop(buttonText);
                        },
                        textColor: buttonTextColor,
                        color: buttonColor,
                      )
                    : Container()
          ],
        );
      },
    );
  }

  static customDialog1(
    BuildContext context,
    String title,
    Widget content, {
    bool usingBottomButton,
    ButtonType buttonType,
    Widget bottomButton,
    String buttonText,
    Color buttonColor,
    Color buttonTextColor,
  }) async {
    usingBottomButton = usingBottomButton != null ? usingBottomButton : false;
    buttonText = buttonText != null ? buttonText : "OK";

    Widget _title() {
      return Container(
        padding: EdgeInsets.all(10),
        child: new Row(
          children: <Widget>[
            Expanded(
              child: AppLib.getRow(
                Text(
                  title,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                start: AppLib.getRect(
                  Colors.white,
                  36,
                  36,
                  Image.asset("assets/logo.png"),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 14.0,
                  backgroundColor: Colors.grey[200],
                  child: Icon(Icons.close, color: Colors.black),
                ),
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      );
    }

    Widget _bottomButton() {
      return buttonType == null || buttonType == ButtonType.RaisedButton
          ? RaisedButton(
              child: Text(buttonText),
              onPressed: () {
                Navigator.of(context).pop(buttonText);
              },
              textColor: buttonTextColor,
              color: buttonColor,
            )
          : buttonType == ButtonType.FlatButton
              ? FlatButton(
                  child: Text(buttonText),
                  onPressed: () {
                    Navigator.of(context).pop(buttonText);
                  },
                  textColor: buttonTextColor,
                  color: buttonColor,
                )
              : Container();
    }

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 0.0,
            backgroundColor: Colors.white,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _title(),
                content,
                usingBottomButton ? _bottomButton() : Container()
              ],
            ),
          );
        });
  }
}

enum FileType { File, Url, Asset, Memory }

class DialogViewImage extends StatefulWidget {
  final dynamic file;
  final FileType type;

  const DialogViewImage({Key key, this.file, this.type}) : super(key: key);

  @override
  _DialogViewImageState createState() => _DialogViewImageState();
}

class _DialogViewImageState extends State<DialogViewImage> {
  @override
  Widget build(BuildContext context) {
    Widget img;
    img = widget.type == FileType.File
        ? Image.file(widget.file as File)
        : widget.type == FileType.Url
            ? Image.network(
                widget.file.fileUrl,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
              )
            : widget.type == FileType.Asset
                ? Image.asset(widget.file)
                : Image.memory(base64Decode(widget.file.data));

    return SimpleDialog(
      backgroundColor: Colors.white,
      title: _title(context),
      titlePadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      children: [
        Center(
          child: Container(padding: const EdgeInsets.all(5.0), child: img),
        ),
        Container(
          child: RaisedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Đóng'),
          ),
          margin: EdgeInsets.only(left: 20, right: 20),
        )
      ],
    );
  }

  Widget _title(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: new Row(
        children: <Widget>[
          Expanded(
            child: AppLib.getRow(
              Text(
                'Xem hình ảnh',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              start: AppLib.getRect(
                Colors.white,
                36,
                36,
                Image.asset("assets/logo.png"),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 14.0,
                backgroundColor: Colors.grey[200],
                child: Icon(Icons.close, color: Colors.black),
              ),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
