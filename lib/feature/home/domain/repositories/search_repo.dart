import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/filter_entity.dart';

abstract class SearchRepo {
  Future<Either<Failures, FilterEntity>> search(String nameDoctor);
}