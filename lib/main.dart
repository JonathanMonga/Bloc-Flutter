import 'package:bloc_app/blocs/transaction_bloc.dart';
import 'package:bloc_app/blocs/transaction_states.dart';
import 'package:bloc_app/data/client/transaction_client.dart';
import 'package:bloc_app/data/repositories/repository.dart';
import 'package:bloc_app/data/repositories/transaction_repository.dart';
import 'package:bloc_app/data/storage/transaction_cache.dart';
import 'package:bloc_app/ui/transaction_widget.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final Repository _transactionRepository = TransactionRepository(
      cache: TransactionCache(), client: TransactionClient());

  runApp(App(transactionRepository: _transactionRepository));
}

class App extends StatelessWidget {
  final TransactionRepository transactionRepository;

  const App({
    Key key,
    @required this.transactionRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Search',
      home: Scaffold(
          appBar: AppBar(title: Text('Github Search')),
          body: BlocProvider<TransactionBloc>(
            bloc: TransactionBloc(repository: transactionRepository),
            child: TransactionWidget(),
          )),
    );
  }
}
