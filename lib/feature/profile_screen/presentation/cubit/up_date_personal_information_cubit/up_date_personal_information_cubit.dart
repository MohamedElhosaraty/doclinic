
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/up_date_profile_usecase.dart';

part 'up_date_personal_information_state.dart';

class UpDatePersonalInformationCubit extends Cubit<UpDatePersonalInformationState> {
  UpDatePersonalInformationCubit(this.upDateProfileUsecase) : super(UpDatePersonalInformationInitial());

  final UpDateProfileUseCase upDateProfileUsecase;


  Future<void> upDateProfile(String name, String email, String phone,
      String gender) async {
    emit(UpDatePersonalInformationLoading());
    final result = await upDateProfileUsecase.call(name, email, phone, gender);
    result.fold(
      (failure) => emit(UpDatePersonalInformationError(failure.error)),
      (user) => emit(UpDatePersonalInformationSuccess()),
    );
  }
}
