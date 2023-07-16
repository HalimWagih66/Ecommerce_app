import 'package:ecommerce/features/login/domain/entities/LoginEntity.dart';

import '../../../../core/error/failure.dart';

abstract class LoginState{}

class LoginInitState extends LoginState{}

class LoginLoadingState extends LoginState{}

class LoginSuccessState extends LoginState{
  LoginEntity loginEntity;
  LoginSuccessState(this.loginEntity);
}

class LoginErrorState extends LoginState{
  Failures failure;
  LoginErrorState(this.failure);
}

