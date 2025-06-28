import 'package:dartz/dartz.dart';

import 'package:doclinic/core/error/failures.dart';

import 'package:doclinic/feature/home/domain/entities/filter_entity.dart';

import '../../domain/repositories/search_repo.dart';
import '../data_sources/search_data_sources.dart';

class SearchRepoImpl implements SearchRepo{

  final SearchDataSources searchDataSources;
  SearchRepoImpl( this.searchDataSources);

  @override
  Future<Either<Failures, FilterEntity>> search(String nameDoctor) async {
    return await searchDataSources.getSearchData(nameDoctor);

  }


}