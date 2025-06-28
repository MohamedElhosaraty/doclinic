import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/home_entity.dart';

abstract class HomeDataSources {
  Future<Either<Failures, HomeEntity>> getHomeData();
}