import 'package:bloc_app/data/models/transaction_item.dart';
import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  dynamic resultat;
  List<TransactionItem> transactions;

  Transaction({this.resultat, this.transactions});

  static Transaction fromJson(dynamic json) {
    return Transaction(
        resultat: json['resultat'],
        transactions: (json['transactions'] as List)
            .map((it) => TransactionItem.fromJson(it))
            .toList());
  }
}
