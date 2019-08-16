import 'package:bloc_app/data/client/transaction_client.dart';
import 'package:bloc_app/data/models/transaction.dart';
import 'package:bloc_app/data/repositories/repository.dart';
import 'package:bloc_app/data/storage/transaction_cache.dart';

class TransactionRepository extends Repository {
  TransactionRepository({TransactionCache cache, TransactionClient client})
      : super(cache, client);

  Future<Transaction> getTransactions(String telephone) async {
    final result = await client.getTransactions(telephone);
    cache.transactionCache = result;
    return result;
  }
}
