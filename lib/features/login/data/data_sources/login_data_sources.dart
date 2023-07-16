import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/login/data/models/SignUpModel.dart';

abstract class LoginDataSources {
  Future<Either<Failures, LoginModel>> login(String email, String password);
}