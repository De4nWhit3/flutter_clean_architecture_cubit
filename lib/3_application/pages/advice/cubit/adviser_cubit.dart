import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'adviser_state.dart';

class AdviserCubit extends Cubit<AdviserState> {
  AdviserCubit() : super(AdviserInitial());
}
