import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/sign_up/domain/entities/SignUpEntity.dart';

import '../../../../core/error/failure.dart';
import '../entities/UserData.dart';
import '../repositories/signup_domain_repository.dart';

class SignUpUseCase{
  SignUpDomainRepository signUpDomainRepository;
  SignUpUseCase(this.signUpDomainRepository);
  Future<Either<Failures,SignUpEntity>>call(UserData userData) => signUpDomainRepository.signUp(userData);
}