import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'adviser_state.dart';

class AdviserCubit extends Cubit<AdviserState> {
  AdviserCubit() : super(AdviceInitial());

  void adviceRequested() async {
    emit(AdviserStateLoading());
    // execute business logic
    // for example: get an advice
    debugPrint("Fakeget advice triggered!");
    await Future.delayed(const Duration(seconds: 2), () {});
    debugPrint('Got fake advice');
    emit(const AdviserStateLoaded(advice: 'Fake advice test bloc'));
    // emit(AdviserStateError(errorMessage: 'error message goes here'));
  }
}
