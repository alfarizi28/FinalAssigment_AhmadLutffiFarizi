part of 'assigment_bloc.dart';

enum Status { idle, loading, succes }

@freezed
class AssigmentState with _$AssigmentState {
  const factory AssigmentState.initial(
      {required List<String> result,
      required Status status,
      required TextEditingController textController}) = AssigmentStateInitial;
}
