part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

class SearchEmpty extends SearchState {}

final class SearchSuccess extends SearchState {

  final List<DoctorListEntity> searchList;
  SearchSuccess(this.searchList);
}

final class SearchError extends SearchState {

  final String error;
  SearchError(this.error);
}
