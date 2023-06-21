part of 'assigment_bloc.dart';

@freezed
class AssigmentEvent with _$AssigmentEvent {
  const factory AssigmentEvent.onGetResult1(int number) =
      AssigmentEventGetResult1;
  const factory AssigmentEvent.onGetResult2(int number) =
      AssigmentEventGetResult2;
  const factory AssigmentEvent.onGetResult3(int number) =
      AssigmentEventGetResult3;
  const factory AssigmentEvent.onGetResult4(int number) =
      AssigmentEventGetResult4;
}
