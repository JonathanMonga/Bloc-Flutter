import 'package:equatable/equatable.dart';

abstract class TransactionEvent extends Equatable {
  TransactionEvent([List props = const []]) : super(props);
}

class LoadingEvent extends TransactionEvent {
  LoadingEvent() : super([]);

  @override
  String toString() => 'LoadingEvent';
}
