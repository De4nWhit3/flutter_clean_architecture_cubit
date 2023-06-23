import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitial()) {
    on<AdviceEvent>((event, emit) async {
      emit(AdviserStateLoading());
      // execute business logic
      // for example: get an advice
      debugPrint("Fakeget advice triggered!");
      await Future.delayed(const Duration(seconds: 2), () {});
      debugPrint('Got fake advice');
      emit(AdviserStateLoaded(advice: 'Fake advice test bloc'));
      // emit(AdviserStateError(errorMessage: 'error message goes here'));
    });
  }
}
