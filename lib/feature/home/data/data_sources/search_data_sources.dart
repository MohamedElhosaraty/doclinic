import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/filter_entity.dart';

abstract class SearchDataSources {

  Future<Either<Failures, FilterEntity>> getSearchData(String nameDoctor) ;
}