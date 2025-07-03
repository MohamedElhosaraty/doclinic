import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/my_appointment_entity.dart';
import '../../domain/usecase/my_appointment_usecase.dart';

part 'my_appointment_state.dart';

class MyAppointmentCubit extends Cubit<MyAppointmentState> {
  MyAppointmentCubit(this.myAppointmentUseCase) : super(MyAppointmentInitial());

  final MyAppointmentUseCase myAppointmentUseCase;
  List<DataEntity> allMyAppointments = [];
  List<DataEntity> doneMyAppointments = [];
  List<DataEntity> cancelMyAppointments = [];

  Future<void> getMyAppointments() async {
    emit(MyAppointmentLoading());
    final result = await myAppointmentUseCase.getMyAppointments();
    result.fold(
      (l) => emit(MyAppointmentError(error: l.error)),
      (r) {
        allMyAppointments = r.data;
        doneMyAppointments = [];
        cancelMyAppointments = [];
        emit(MyAppointmentSuccess(
          allMyAppointments: allMyAppointments,
          doneMyAppointments: doneMyAppointments,
          canceledMyAppointments: cancelMyAppointments ,
        ));
      }
    );
  }

  void getDoneMyAppointments(DataEntity data) async {
    if (!doneMyAppointments.any((item) => item.id == data.id)) {
      doneMyAppointments.add(data);
      allMyAppointments.removeWhere((item) => item.id == data.id);
      emit(MyAppointmentSuccess(
        allMyAppointments: allMyAppointments,
        doneMyAppointments: doneMyAppointments,
        canceledMyAppointments: cancelMyAppointments,
      ));
    }
  }

  void getCancelMyAppointments(DataEntity data) async {
    if (!cancelMyAppointments.any((item) => item.id == data.id)) {
      cancelMyAppointments.add(data);
      allMyAppointments.removeWhere((item) => item.id == data.id);
      emit(MyAppointmentSuccess(
        allMyAppointments: allMyAppointments,
        doneMyAppointments: doneMyAppointments,
        canceledMyAppointments: cancelMyAppointments,
      ));
    }
  }
}
