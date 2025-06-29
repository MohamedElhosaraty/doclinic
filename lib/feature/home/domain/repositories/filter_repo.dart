import '../../../../core/error/failures.dart';
import '../entities/filter_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FilterRepo {
  Future<Either<Failures, FilterEntity>> getFilterData(int cityId);

}