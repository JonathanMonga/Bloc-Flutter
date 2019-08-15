import 'package:bloc_app/data/models/transaction.dart';

class TransactionCache {
  final _cache = <Transaction>[];

  List<Transaction> get() => _cache;

  void set(Transaction result) => _cache.add(result);

  bool contains(Transaction result) => _cache.contains(result);

  void remove(Transaction result) => _cache.remove(result);
}
