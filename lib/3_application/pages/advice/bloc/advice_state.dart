part of 'advice_bloc.dart';

@immutable
abstract class AdviceState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AdviceInitial extends AdviceState {}

class AdviserStateLoading extends AdviceState {}

class AdviserStateLoaded extends AdviceState {
  final String advice;

  AdviserStateLoaded({required this.advice});

  List<Object?> get props => [advice];
}

class AdviserStateError extends AdviceState {
  final String errorMessage;

  AdviserStateError({required this.errorMessage});

  List<Object?> get props => [errorMessage];
}
