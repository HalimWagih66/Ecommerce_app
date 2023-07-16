import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/login/domain/entities/LoginEntity.dart';

abstract class LoginDomainRepo{
  Future<Either<Failures,LoginEntity>>login(String email,String password);
}