part of 'adviser_cubit.dart';

abstract class AdviserState extends Equatable {
  const AdviserState();

  @override
  List<Object?> get props => [];
}

class AdviceInitial extends AdviserState {}

class AdviserStateLoading extends AdviserState {}

class AdviserStateLoaded extends AdviserState {
  final String advice;

  const AdviserStateLoaded({required this.advice});

  List<Object?> get props => [advice];
}

class AdviserStateError extends AdviserState {
  final String errorMessage;

  const AdviserStateError({required this.errorMessage});

  List<Object?> get props => [errorMessage];
}
