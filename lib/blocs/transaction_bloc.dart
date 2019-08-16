import 'dart:async';

import 'package:bloc_app/blocs/transaction_event.dart';
import 'package:bloc_app/blocs/transaction_states.dart';
import 'package:bloc_app/data/models/transaction_error.dart';
import 'package:bloc_app/data/repositories/repository.dart';
import 'package:bloc_app/data/repositories/transaction_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

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
    if (event is LoadingEvent) {
      final String telephone =
          "243996980422"; //Normaly the event is comming with data Ex: event.data

      yield TransactionStateLoading();

      try {
        final results = await (repository as TransactionRepository)
            .getTransactions(telephone);
        yield TransactionStateSuccess(results);
      } catch (error) {
        yield error is TransactionError
            ? TransactionStateError(error: error.message)
            : TransactionStateError(error: 'something went wrong');
      }
    }
  }
}
