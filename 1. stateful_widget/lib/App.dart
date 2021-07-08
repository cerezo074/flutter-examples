import 'package:flutter/material.dart';
import './ResultModel.dart';
import './TextControl.dart';

class App extends StatelessWidget {
  static const String _appBarTitle = "Assingment 1";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(_appBarTitle),
            ),
            body: TextControl()));
  }
}
