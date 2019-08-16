import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/blocs/transaction_event.dart';
import 'package:bloc_app/blocs/transaction_states.dart';
import 'package:bloc_app/data/models/transaction_error.dart';
import 'package:bloc_app/data/repositories/repository.dart';
import 'package:bloc_app/data/repositories/transaction_repository.dart';
import 'package:meta/meta.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final Repository repository;

  TransactionBloc({@required this.repository});

  @override
  void onTransition(
    Transition<TransactionEvent, TransactionState> transition,
  ) {
    print(transition);
  }

  @override
  TransactionState get initialState => TransactionStateLoading();

  @override
  Stream<TransactionState> mapEventToState(
      TransactionState currentState, TransactionEvent event) async* {
    print("mapEventToState");
    if (event is LoadingEvent) {
      final String telephone =
          "243996980422"; //Normaly the event is comming with data Ex: event.data

      try {
        final results = await (repository as TransactionRepository)
            .getTransactions(telephone);

        print(results.resultat);
        yield TransactionStateSuccess(results);
      } catch (error) {
        print(error.toString());
        yield error is TransactionError
            ? TransactionStateError(error: error.message)
            : TransactionStateError(error: 'something went wrong');
      }
    }
  }
}
