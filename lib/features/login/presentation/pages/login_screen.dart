import 'package:ecommerce/features/login/data/data_sources/login_remote_dto.dart';
import 'package:ecommerce/features/login/presentation/manager/cubit.dart';
import 'package:ecommerce/features/login/presentation/manager/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/route/routes.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_image.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/components/custom_form_field.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/utils/validate_utils.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
              )),
            ),
          );
        }
        else if (state is LoginErrorState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Error"),
              content: Text(state.failure.message),
            ),
          );
        }
        else if (state is LoginSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.home,
              arguments: state.loginEntity,
                  (route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 91.h,
                  ),
                  Image.asset(
                    AppImages.logo,
                    height: 71.h,
                    width: 237.w,
                  ),
                  SizedBox(
                    height: 86.h,
                  ),
                  Text(
                    AppStrings.welcome,
                    style: poppins24W600(),
                  ),
                  Text(
                    AppStrings.loginHint,
                    style: poppins16W300(),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  CustomFormField(
                    textInputAction: TextInputAction.next,
                    controller: LoginCubit.get(context).emailController,
                    label: 'Email Address',
                    hint: 'please enter Email Address',
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter email';
                      }
                      if (!ValidationUtils.isValidEmail(text)) {
                        return 'please enter a valid email';
                      }
                    },
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomFormField(
                    textInputAction: TextInputAction.next,
                    controller: LoginCubit.get(context).passwordController,
                    label: 'Password',
                    hint: 'please enter password',
                    keyboardType: TextInputType.text,
                    isPassword: true,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter password';
                      }
                      if (text.length < 6) {
                        return 'password should at least 6 chars';
                      }
                    },
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "Forget Password ?",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      )),
                  SizedBox(
                    height: 56.h,
                  ),
                  Container(
                    height: 64.h,
                    child: ElevatedButton(
                      onPressed: () {
                        LoginCubit.get(context).login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Text("Login", style: poppins20W600()),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have an account?",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signUp);
                        },
                        child: Text("Create Account",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: Colors.white)),
                      )
                    ],
                  )
                ]),
            ),
          ),
        );
      },
    );
  }
}
