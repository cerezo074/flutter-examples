import 'package:flutter/material.dart';
import 'widgets/TransactionHome.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter App'),
          ),
          body: TransactionHome()),
    );
  }
}
