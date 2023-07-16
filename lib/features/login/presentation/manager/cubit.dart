import 'package:ecommerce/features/login/data/repositories/login_data_repo.dart';
import 'package:ecommerce/features/login/domain/repositories/login_domain_repo.dart';
import 'package:ecommerce/features/login/domain/use_cases/login_use_cases.dart';
import 'package:ecommerce/features/login/presentation/manager/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_sources/login_data_sources.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginDataSources sources;
  LoginCubit(this.sources):super(LoginInitState());
  var passwordController = TextEditingController(text: "123@Hesham");
  var emailController = TextEditingController(text: "hesham88@gmail.com");
  static LoginCubit get(context) => BlocProvider.of(context);
  void login()async{
    emit(LoginLoadingState());
    LoginDomainRepo loginDomainRepo = LoginDataRepo(sources);
    LoginUseCase loginUseCase = LoginUseCase(loginDomainRepo);
    var result = await loginUseCase.call("hesham88@gmail.com", "123@Hesham");
    result.fold((l) {
      emit(LoginErrorState(l));
    }, (r) {
      emit(LoginSuccessState(r));
    });
  }
}