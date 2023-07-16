import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/sign_up/domain/entities/SignUpEntity.dart';
import '../../domain/entities/UserData.dart';
import '../../domain/repositories/signup_domain_repository.dart';
import '../data_sources/signup_data_source.dart';

class SignUpDataRepository extends SignUpDomainRepository{
  SignUpDataSource sources;
  SignUpDataRepository(this.sources);
  @override
  Future<Either<Failures, SignUpEntity>> signUp(UserData userData)=>sources.signUp(userData);
}