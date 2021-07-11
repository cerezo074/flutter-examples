import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/TransactionModel.dart';

typedef TransactionInputCallback = void Function(String, double);

class TransactionInput extends StatefulWidget {
  final TransactionInputCallback _callBack;

  TransactionInput({required TransactionInputCallback callBack})
      : this._callBack = callBack;

  @override
  State<StatefulWidget> createState() {
    return TransactionInputState(callBack: _callBack);
  }
}

class TransactionInputState extends State<TransactionInput> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final TransactionInputCallback _callBack;
  bool _amountError = false;
  bool _titleError = false;

  TransactionInputState({required TransactionInputCallback callBack})
      : this._callBack = callBack;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, children: _allWidgets),
      ),
    );
  }

  List<Widget> get _allWidgets {
    List<Widget> list = [];

    final TextField titleInput = TextField(
      controller: _titleController,
      decoration: InputDecoration(
        labelText: "Enter title",
      ),
    );

    list.add(titleInput);

    if (_titleError) {
      final titleError = Container(
          width: double.infinity,
          child: Text("Invalid title.",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              )));
      list.add(titleError);
    }

    final TextField amountInput = TextField(
      controller: _amountController,
      decoration: InputDecoration(labelText: "Enter Amount"),
    );

    list.add(amountInput);

    if (_amountError) {
      final amountError = Container(
          width: double.infinity,
          child: Text("Invalid amount.",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              )));
      list.add(amountError);
    }

    final FlatButton addTransactionButton = FlatButton(
      onPressed: _saveTransaction,
      child: Text("Add Transaction"),
    );

    list.add(addTransactionButton);

    return list;
  }

  void _saveTransaction() {
    _titleError = !Transaction.isValidTitle(_titleController.text);
    _amountError = !Transaction.isValidAmount(_amountController.text);

    if (_titleError || _amountError) {
      setState(() {});
      return;
    }

    _callBack(
        _titleController.text, double.tryParse(_amountController.text) ?? 0);
  }
}
