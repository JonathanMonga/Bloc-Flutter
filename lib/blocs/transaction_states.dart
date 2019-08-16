import 'package:bloc_app/data/models/transaction.dart';
import 'package:equatable/equatable.dart';

abstract class TransactionState extends Equatable {
  TransactionState([List props = const []]) : super(props);
}

class TransactionStateEmpty extends TransactionState {
  @override
  String toString() => 'TransactionStateEmpty';
}

class TransactionStateLoading extends TransactionState {
  @override
  String toString() => 'TransactionStateLoading';
}

class TransactionStateSuccess extends TransactionState {
  final Transaction items;

  TransactionStateSuccess(this.items) : super([items]);

  @override
  String toString() => 'TransactionStateSuccess';
}

class TransactionStateError extends TransactionState {
  final String error;

  TransactionStateError({this.error}) : super([error]);

  @override
  String toString() => 'TransactionStateError';
}
