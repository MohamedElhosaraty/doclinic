import 'package:dartz/dartz.dart';
import 'package:doclinic/feature/home/domain/repositories/home_repo.dart';

import '../../../../core/error/failures.dart';
import '../entities/home_entity.dart';

class HomeUsecase {

  final HomeRepo homeRepo;

  HomeUsecase(this.homeRepo);

  Future<Either<Failures, HomeEntity>> call() async {
    return await homeRepo.getHomeData();
  }
}