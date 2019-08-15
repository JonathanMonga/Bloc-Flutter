import 'package:bloc_app/data/models/transaction_item.dart';

class Transaction {
  String resultat;
  List<TransactionItem> transactions;

  Transaction({this.resultat, this.transactions});

  static Transaction formJson(dynamic json) {
    return Transaction(
        resultat: json['resultat'], transactions: json['transactions']);
  }
}
