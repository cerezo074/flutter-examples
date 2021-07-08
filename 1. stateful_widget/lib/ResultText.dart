import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  final String _title;

  ResultText(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }
}
