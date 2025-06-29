
import 'package:doclinic/feature/home/domain/usecase/filter_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/filter_entity.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit(this.filterUsecase) : super(FilterInitial());

  final FilterUsecase filterUsecase;
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(FilterCurrentIndex());
  }


  Future<void> getFilterData(int cityId) async {
    emit(FilterLoading());
    final result = await filterUsecase.call(cityId);
    result.fold((failure) => emit(FilterError(failure.error)), (r) => emit(FilterSuccess(r)));
  }

}
