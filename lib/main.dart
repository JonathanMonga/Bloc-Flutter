import 'package:bloc_app/blocs/transaction_bloc.dart';
import 'package:bloc_app/blocs/transaction_event.dart';
import 'package:bloc_app/data/client/transaction_client.dart';
import 'package:bloc_app/data/repositories/repository.dart';
import 'package:bloc_app/data/repositories/transaction_repository.dart';
import 'package:bloc_app/data/storage/transaction_cache.dart';
import 'package:bloc_app/ui/transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

void main() {
  final Repository _transactionRepository = TransactionRepository(
      cache: TransactionCache(), client: TransactionClient());

  runApp(_HomePage(transactionRepository: _transactionRepository));
}

class _HomePage extends StatefulWidget {
  final TransactionRepository transactionRepository;

  const _HomePage({
    Key key,
    @required this.transactionRepository,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maishapay Transactions',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Maishapay Transactions'),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  onPressed: null)
            ],
          ),
          body: BlocProvider<TransactionBloc>(
            bloc: TransactionBloc(repository: widget.transactionRepository),
            child: TransactionWidget(),
          )),
    );
  }
}
