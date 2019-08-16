import 'package:bloc_app/blocs/transaction_bloc.dart';
import 'package:bloc_app/blocs/transaction_event.dart';
import 'package:bloc_app/blocs/transaction_states.dart';
import 'package:bloc_app/data/models/transaction.dart';
import 'package:bloc_app/data/models/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[_TransactionListView()],
    );
  }
}

class _TransactionListView extends StatefulWidget {
  @override
  _TransactionListViewState createState() => _TransactionListViewState();
}

class _TransactionListViewState extends State<_TransactionListView> {
  TransactionBloc _transactionBloc;

  @override
  void initState() {
    super.initState();
    _transactionBloc = BlocProvider.of<TransactionBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _transactionBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _transactionBloc.dispatch(LoadingEvent());

    return BlocBuilder<TransactionEvent, TransactionState>(
        builder: (context, state) {
          if (state is TransactionStateLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TransactionStateError) {
            return Text(state.error);
          }
          if (state is TransactionStateSuccess) {
            return state.items.transactions.isEmpty
                ? Text('No Results')
                : Expanded(child: _TransactionResults(items: state.items));
          }
          return Text('Please enter a term to begin');
        },
        bloc: _transactionBloc);
  }
}

class _TransactionResults extends StatelessWidget {
  final Transaction items;

  const _TransactionResults({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.transactions.length,
      itemBuilder: (BuildContext context, int index) {
        return _TransactionResultItem(item: items.transactions[index]);
      },
    );
  }
}

class _TransactionResultItem extends StatelessWidget {
  final TransactionItem item;

  const _TransactionResultItem({Key key, @required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(item.prenom_dest.substring(0, 1))),
      title: Text(item.type_jrn == "e"
          ? "Envoie a ${item.prenom_dest} ${item.nom_dest}"
          : "Reception de ${item.prenom_dest} ${item.nom_dest}"),
      subtitle: Text("${item.montant_jrn} ${item.monnaie_jrn}"),
      onTap: () async {},
    );
  }
}
