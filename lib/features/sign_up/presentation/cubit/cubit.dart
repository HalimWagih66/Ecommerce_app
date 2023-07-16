import 'package:ecommerce/features/sign_up/data/repositories/sign_up_repository.dart';
import 'package:ecommerce/features/sign_up/domain/entities/UserData.dart';
import 'package:ecommerce/features/sign_up/domain/repositories/signup_domain_repository.dart';
import 'package:ecommerce/features/sign_up/domain/use_cases/sign_up_signup.dart';
import 'package:ecommerce/features/sign_up/presentation/cubit/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_sources/signup_data_source.dart';

class SignUpCubit extends Cubit<SignUpState>{
  SignUpDataSource sources;
  SignUpCubit(this.sources):super(SignUpInitState());
  static SignUpCubit get(context)=>BlocProvider.of(context);
  var nameController = TextEditingController(text: "name Controller");
  var phoneController = TextEditingController(text: "01200128903");
  var emailController = TextEditingController(text: "nameController22@gmail.com");
  var passwordController = TextEditingController(text: "12345678");
  var rePasswordController = TextEditingController(text: "12345678");
  void signUp()async{
    emit(SignUpLoadingState());
    SignUpDomainRepository signUpDomainRepository = SignUpDataRepository(sources);
    SignUpUseCase signUpUseCase = SignUpUseCase(signUpDomainRepository);
    UserData userData = UserData(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      rePassword: rePasswordController.text,
    );
    var result = await signUpUseCase.call(userData);
    result.fold((l) => emit(SignUpErrorState(l)), (r) => emit(SignUpSuccessState(r)));
    }
}
