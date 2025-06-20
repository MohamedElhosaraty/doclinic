import 'package:dartz/dartz.dart';

import 'package:doclinic/core/error/failures.dart';
import '../../domain/entites/auth_entity.dart';
import '../../domain/repositories/login_repo.dart';
import '../data_sources/login_data_sources.dart';

class LoginRepoImpl implements LoginRepo {

  final LoginDataSources loginDataSources;
  LoginRepoImpl(this.loginDataSources);

  @override
  Future<Either<Failures, AuthEntity>> login(String email, String password) async {
    return await loginDataSources.login(email, password);
  }
}