import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/login/domain/entities/LoginEntity.dart';

import '../repositories/login_domain_repo.dart';

class LoginUseCase{
  LoginDomainRepo loginDomainRepo;
  LoginUseCase(this.loginDomainRepo);
  Future<Either<Failures,LoginEntity>>call(String email,String password)=>loginDomainRepo.login(email,password);
}