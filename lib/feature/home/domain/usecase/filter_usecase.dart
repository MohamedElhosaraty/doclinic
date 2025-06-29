
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/filter_entity.dart';
import '../repositories/filter_repo.dart';

class FilterUsecase {
  final FilterRepo filterRepo;

  FilterUsecase(this.filterRepo);

  Future<Either<Failures, FilterEntity>> call(int cityId, ) async => await filterRepo.getFilterData(cityId);
}