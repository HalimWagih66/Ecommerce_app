import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/login/domain/entities/LoginEntity.dart';
import 'package:ecommerce/features/login/domain/repositories/login_domain_repo.dart';

import '../data_sources/login_data_sources.dart';

class LoginDataRepo implements LoginDomainRepo{
  LoginDataSources loginDataSources;
  LoginDataRepo(this.loginDataSources);
  @override
  Future<Either<Failures, LoginEntity>> login(String email,String password)=>loginDataSources.login(email,password);
}