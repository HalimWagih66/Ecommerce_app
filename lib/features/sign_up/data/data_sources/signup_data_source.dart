import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/sign_up/data/models/SignUpModel.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/UserData.dart';

abstract class SignUpDataSource{
  Future<Either<Failures,SignUpModel>>signUp(UserData userData);
}