import './TransactionList.dart';
import './TransactionInput.dart';
import '../Models/TransactionModel.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TransactionHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransactionHomeState();
  }
}

class _TransactionHomeState extends State<TransactionHome> {
  final List<Transaction> _transactions = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Socks", amount: 6.99, date: DateTime.now()),
    Transaction(
        id: "t3", title: "New Tie", amount: 15.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Card(
            color: Colors.green,
            child: Text("CHART!"),
          ),
        ),
        TransactionInput(
          callBack: _addNewTransaction,
        ),
        TransactionList(
          transactions: _transactions,
        )
      ],
    );
  }

  void _addNewTransaction(String title, double amount) {
    var uuid = Uuid();
    final newTransaction = Transaction(
      id: uuid.v4(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }
}
