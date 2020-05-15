import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterexamproject/my_style_widget/platform_widget.dart';

class PlatformAlertDialog extends PlatformWidget {
  final String alert_title;
  final String alert_content;
  final String main_button_text;
  final String cancel_button_text;


  PlatformAlertDialog({
    @required this.alert_title,
    @required this.alert_content,
    @required this.main_button_text,
    @required this.cancel_button_text});

  Future<bool> show(BuildContext context) async {
    return Platform.isIOS ? await showCupertinoDialog(
        context: context, builder: (context) => this) :
    await showDialog<bool>(context: context, builder: (context) => this,
        barrierDismissible: false);
  }


  @override
  Widget buildAndroidWidget(BuildContext context) {
    return AlertDialog(
      title: Text(alert_title),
      content: Text(alert_content),
      actions: _dialogButonlariniAyarla(context),
    );
  }

  @override
  Widget buildIOSWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(alert_title),
      content: Text(alert_content),
      actions: _dialogButonlariniAyarla(context),
    );
  }

  List<Widget> _dialogButonlariniAyarla(BuildContext context) {
    final allButtons = <Widget>[];

    if (Platform.isIOS) {
      if (cancel_button_text != null) {
        allButtons.add(
          CupertinoDialogAction(
            child: Text(cancel_button_text),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        );
      }

      allButtons.add(
        CupertinoDialogAction(
          child: Text(main_button_text),
          onPressed: () {
            Navigator.of(context).pop(true);

          },
        ),
      );
    }

    else {
      if (cancel_button_text != null) {
        allButtons.add(
          FlatButton(
            child: Text(cancel_button_text),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        );
      }

      allButtons.add(
        FlatButton(
          child: Text("Tamam"),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      );
    }

    return allButtons;
  }
}
