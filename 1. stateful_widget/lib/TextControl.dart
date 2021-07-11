import 'package:flutter/material.dart';
import './ResultText.dart';
import './ResultModel.dart';

class TextControl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    ResultModel model = ResultModel(["Text number 16", "Text number 2"], -20);
    return TextControlState(model);
  }
}

class TextControlState extends State<TextControl> {
  final ResultModel _model;

  TextControlState(this._model);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80,
            ),
            ResultText(_model.message),
            Container(
              width: double.infinity,
              height: 60,
            ),
            ElevatedButton(
                onPressed: () {
                  _switchButtonPressed();
                },
                child: Text(ResultModel.SwitchMessage))
          ],
        ));
  }

  void _switchButtonPressed() {
    setState(() {
      _model.updateMessage();
    });
  }
}
