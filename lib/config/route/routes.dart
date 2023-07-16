import 'package:ecommerce/features/login/data/data_sources/login_remote_dto.dart';
import 'package:ecommerce/features/login/presentation/manager/cubit.dart';
import 'package:ecommerce/features/sign_up/presentation/pages/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/login/presentation/pages/login_screen.dart';

class Routes{
  static const String login = "/";
  static const String signUp = "signUp";
  static const String home = "home";

}
class GenerateRoutes{
  static Route onGenerate(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.login:
        return MaterialPageRoute(builder: (context) => BlocProvider(
            create: (context) => LoginCubit(RemoteDto()),
        child: LoginScreen()));
      case Routes.signUp:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => unDefinedScreen());
    }
  }
}
Widget unDefinedScreen(){
  return const Scaffold(
    body: Center(
      child: Text("unDefined Screen"),
    ),
  );
}