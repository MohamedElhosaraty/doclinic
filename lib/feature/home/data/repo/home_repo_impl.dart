import 'package:dartz/dartz.dart';

import 'package:doclinic/core/error/failures.dart';

import 'package:doclinic/feature/home/domain/entities/home_entity.dart';

import '../../domain/repositories/home_repo.dart';
import '../data_sources/home_data_sources.dart';

class HomeRepoImpl implements HomeRepo{

  final HomeDataSources homeDataSources;

  HomeRepoImpl(this.homeDataSources);
  @override
  Future<Either<Failures, HomeEntity>> getHomeData() async{
    return await homeDataSources.getHomeData();
  }
}