import 'package:date_format/date_format.dart';

class Transaction {
  String id;
  String title;
  double _amount;
  DateTime _date;

  Transaction(
      {required String id,
      required String title,
      required double amount,
      required DateTime date})
      : this.id = id,
        this.title = title,
        this._amount = amount,
        this._date = date;

  String get total {
    return "\$${_amount.toString()}";
  }

  String get date {
    return formatDate(_date, [M, ' ', d, ', ', yyyy]);
  }

  static bool isValidAmount(String value) {
    return !value.isEmpty && double.tryParse(value) != null;
  }

  static bool isValidTitle(String value) {
    return !value.isEmpty && value != " ";
  }
}
