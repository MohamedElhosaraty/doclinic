import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/home_entity.dart';

abstract class HomeRepo {
  Future<Either<Failures, HomeEntity>> getHomeData();
}