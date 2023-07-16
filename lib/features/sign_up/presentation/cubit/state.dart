import 'package:ecommerce/core/error/failure.dart';

import '../../domain/entities/SignUpEntity.dart';

class SignUpState{}

class SignUpInitState extends SignUpState{}

class SignUpLoadingState extends SignUpState{}

class SignUpSuccessState extends SignUpState{
  SignUpEntity signUpEntity;
  SignUpSuccessState(this.signUpEntity);
}

class SignUpErrorState extends SignUpState{
  Failures failures;
  SignUpErrorState(this.failures);
}