import 'dart:convert';

import 'package:bloc_app/data/models/transaction.dart';
import 'package:bloc_app/data/models/transaction_error.dart';
import 'package:http/http.dart' as http;

class TransactionClient {
  final String baseUrl;
  final http.Client httpClient;

  TransactionClient(
      {http.Client httpClient,
      this.baseUrl = "https://maishapay.net/maishapay/api/"})
      : this.httpClient = httpClient ?? http.Client();

  Future<Transaction> getTransactions(String telephone) async {
    final response = await httpClient.post(Uri.parse("$baseUrl"),
        body: {"ent": "rapport", "telephone": telephone});
    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return Transaction.fromJson(results);
    } else {
      throw TransactionError();
    }
  }
}
