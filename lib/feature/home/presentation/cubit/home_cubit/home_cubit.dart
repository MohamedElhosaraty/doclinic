
import 'package:doclinic/feature/home/domain/usecase/home_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/home_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeUsecase) : super(HomeInitial());

  final HomeUsecase homeUsecase ;
  final List<DoctorListEntity> doctors = [];
  final List<String> cityName = [];
  final List<int> cityId = [];
  final List<Map<String, dynamic>> city = [];

  Future<void> getHomeData() async {
    emit(HomeLoading());
    final result = await homeUsecase.call();
    result.fold((failure) => emit(HomeError(failure.error)),
            (r){
              for (var specialization in r.specializationList) {
                for (var doctor in specialization.doctorList) {
                  doctors.add(doctor);
                  if (!cityName.contains(doctor.cityEntity.nameCity)) {
                    cityName.add(doctor.cityEntity.nameCity);
                    cityId.add(doctor.cityEntity.id);

                    city.add({
                      "cityName": doctor.cityEntity.nameCity,
                      "cityId": doctor.cityEntity.id,
                    });
                  }
                }
              }

              emit(HomeSuccess(r));
            }
        );
  }
}
