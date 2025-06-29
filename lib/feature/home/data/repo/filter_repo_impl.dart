import 'package:dartz/dartz.dart';

import 'package:doclinic/core/error/failures.dart';

import 'package:doclinic/feature/home/domain/entities/filter_entity.dart';

import '../../domain/repositories/filter_repo.dart';
import '../data_sources/filter_data_sources.dart';

class FilterRepoImpl implements FilterRepo{

  final FilterDataSources filterDataSources;

  FilterRepoImpl(this.filterDataSources);
  @override
  Future<Either<Failures, FilterEntity>> getFilterData(int cityId) async  {
   return await filterDataSources.getFilterData(cityId);
  }
}