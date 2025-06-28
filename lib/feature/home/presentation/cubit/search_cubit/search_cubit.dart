import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/home_entity.dart';
import '../../../domain/usecase/search_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUsecase) : super(SearchInitial());

  final SearchUsecase searchUsecase;


  Future<void> search(String nameDoctor) async {
    if (nameDoctor.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
    final result = await searchUsecase.call(nameDoctor);
    result.fold(
      (failure) => emit(SearchError(failure.error)),
      (r) {
        final List<DoctorListEntity> list = r.doctorList;
        if (list.isEmpty) {
          emit(SearchEmpty());
        } else {
          emit(SearchSuccess(list));
        }
      }
    );
  }
}
