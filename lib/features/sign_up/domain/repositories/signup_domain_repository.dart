import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/sign_up/domain/entities/SignUpEntity.dart';

import '../../../../core/error/failure.dart';
import '../entities/UserData.dart';

abstract class SignUpDomainRepository{

  Future<Either<Failures,SignUpEntity>>signUp(UserData userData);
}