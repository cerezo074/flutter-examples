import 'package:flutter/material.dart';
import '../Models/TransactionModel.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionList({required List<Transaction> transactions})
      : this._transactions = transactions;

  Widget _buildAmount({required Transaction transaction}) {
    return Expanded(
      flex: 4,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Text(
          transaction.total,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purple),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.purple,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildDetails({required Transaction transaction}) {
    return Expanded(
      flex: 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            transaction.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(transaction.date.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                  color: Colors.grey)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._transactions.map((tx) {
          return Card(
            child: Row(
              children: [
                _buildAmount(transaction: tx),
                _buildDetails(transaction: tx)
              ],
            ),
          );
        }).toList()
      ],
    );
  }
}
