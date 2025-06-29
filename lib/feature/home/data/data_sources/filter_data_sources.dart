import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/filter_entity.dart';

abstract class FilterDataSources {
  Future<Either<Failures, FilterEntity>> getFilterData(int cityId);
}