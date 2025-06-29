part of 'filter_cubit.dart';

sealed class FilterState {}

final class FilterInitial extends FilterState {}

final class FilterLoading extends FilterState {}

final class FilterCurrentIndex extends FilterState {}

final class FilterSuccess extends FilterState {
  final FilterEntity filterEntity;
  FilterSuccess(this.filterEntity);
}

final class FilterError extends FilterState {
  final String error;
  FilterError(this.error);
}
