import 'package:bloc_app/data/models/transaction.dart';

class TransactionCache {
  Transaction _transactionCache;

  Transaction get transactionCache => _transactionCache;

  set transactionCache(Transaction transactionCache) =>
      _transactionCache = transactionCache;
}
