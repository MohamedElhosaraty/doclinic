import 'package:dartz/dartz.dart';

import 'package:doclinic/core/error/failures.dart';

import 'package:doclinic/feature/auth/domain/entites/auth_entity.dart';

import '../../domain/repositories/sign_up_repo.dart';
import '../data_sources/sign_up_data_sources.dart';

class SignUpRepoImpl implements SignUpRepo{

  final SignUpDataSources signUpDataSources;
  SignUpRepoImpl(this.signUpDataSources);
  @override
  Future<Either<Failures, AuthEntity>> signUp(String name, String email, String phone, String gender, String password, String confirmPassword) async{
    return await signUpDataSources.signUp(name, email, phone, gender, password, confirmPassword);
  }
}