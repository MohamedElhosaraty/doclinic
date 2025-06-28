import 'package:dartz/dartz.dart';
import 'package:doclinic/feature/home/domain/repositories/search_repo.dart';

import '../../../../core/error/failures.dart';
import '../entities/filter_entity.dart';

class SearchUsecase {

  final SearchRepo searchRepo;

  SearchUsecase(this.searchRepo);

  Future<Either<Failures, FilterEntity>> call(
      String nameDoctor) async => await searchRepo.search(nameDoctor);

}