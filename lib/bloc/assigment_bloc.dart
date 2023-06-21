import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'assigment_event.dart';
part 'assigment_state.dart';
part 'assigment_bloc.freezed.dart';

class AssigmentBloc extends Bloc<AssigmentEvent, AssigmentState> {
  AssigmentBloc()
      : super(AssigmentState.initial(
            result: [],
            status: Status.idle,
            textController: TextEditingController())) {
    on<AssigmentEventGetResult1>(_onGetResult1);
    on<AssigmentEventGetResult2>(_onGetResult2);
    on<AssigmentEventGetResult3>(_onGetResult3);
    on<AssigmentEventGetResult4>(_onGetResult4);
  }

  Future<void> _onGetResult1(
      AssigmentEventGetResult1 event, Emitter<AssigmentState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final List<String> hasil = [];

    for (var i = 1; i <= int.parse(event.number.toString()); i++) {
      hasil.add(i.toString());
    }
    emit(state.copyWith(result: hasil, status: Status.succes));
  }

  Future<void> _onGetResult2(
      AssigmentEventGetResult2 event, Emitter<AssigmentState> emit) async {
    final List<String> hasil = [];

    emit(state.copyWith(
      status: Status.loading,
    ));

    for (var i = 1; i <= int.parse(event.number.toString()); i++) {
      hasil.add(i.toString());

      if (i == int.parse(event.number.toString())) {
        for (var j = int.parse(event.number.toString()) - 1; j > 0; j--) {
          hasil.add(j.toString());
        }
      }
    }
    emit(state.copyWith(result: hasil, status: Status.succes));
  }

  Future<void> _onGetResult3(
      AssigmentEventGetResult3 event, Emitter<AssigmentState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final List<String> hasil = [];
    int Index = 10;

    for (var i = 0; i < int.parse(event.number.toString()); i++) {
      hasil.add((Index + i * 11).toString());
    }
    emit(state.copyWith(result: hasil, status: Status.succes));
  }

  Future<void> _onGetResult4(
      AssigmentEventGetResult4 event, Emitter<AssigmentState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final List<String> hasil = [];

    for (var i = 1; i < int.parse(event.number.toString()) + 1; i++) {
      if (i % 7 == 0) {
        hasil.add('TUJUH');
      } else if (i % 5 == 0) {
        hasil.add('LIMA');
      } else {
        hasil.add(i.toString());
      }
    }
    emit(state.copyWith(result: hasil, status: Status.succes));
  }
}
