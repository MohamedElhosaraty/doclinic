import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/my_appointment_entity.dart';
import '../../domain/usecase/my_appointment_usecase.dart';

part 'my_appointment_state.dart';

class MyAppointmentCubit extends Cubit<MyAppointmentState> {
  MyAppointmentCubit(this.myAppointmentUseCase) : super(MyAppointmentInitial());

  final MyAppointmentUseCase myAppointmentUseCase;
  List<DataEntity> allMyAppointments = [];

  Future<void> getMyAppointments() async {
    emit(MyAppointmentLoading());
    final result = await myAppointmentUseCase.getMyAppointments();
    result.fold(
      (l) => emit(MyAppointmentError(error: l.error)),
      (r) {
        emit(MyAppointmentSuccess());
        allMyAppointments = r.data;
      }
    );
  }
}
