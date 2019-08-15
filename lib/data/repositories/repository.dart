import 'package:bloc_app/data/client/transaction_client.dart';
import 'package:bloc_app/data/storage/transaction_cache.dart';

class Repository {
  final TransactionCache cache;
  final TransactionClient client;

  Repository(this.cache, this.client);
}
