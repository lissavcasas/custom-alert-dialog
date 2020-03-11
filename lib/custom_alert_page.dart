import 'package:alertdialog/dialog.dart';
import 'package:flutter/material.dart';

class CustomAlertPage extends StatelessWidget {
  const CustomAlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Open Dialog'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) {
                return MyDialog();
              },
            );
          },
        ),
      ),
    );
  }
}
