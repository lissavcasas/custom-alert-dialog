import 'package:alertdialog/alert_builder_page.dart';
//import 'package:alertdialog/custom_alert_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Dialog Alert',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Dialog Alert'),
        ),
        //body: CustomAlertPage(),
        body:AlertBuilderPage (),
      ),
    );
  }
}