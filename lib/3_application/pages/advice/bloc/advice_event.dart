part of 'advice_bloc.dart';

@immutable
abstract class AdviceEvent extends Equatable {
  List<Object?> get props => [];
}

class AdviceRequestedEvent extends AdviceEvent {}
