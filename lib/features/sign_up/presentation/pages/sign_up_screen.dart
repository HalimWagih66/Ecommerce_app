import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/features/sign_up/data/data_sources/remote_dto.dart';
import 'package:ecommerce/features/sign_up/presentation/cubit/cubit.dart';
import 'package:ecommerce/features/sign_up/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/route/routes.dart';
import '../../../../core/utils/components/custom_form_field.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/utils/validate_utils.dart';
class SignUpScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>SignUpCubit(SignUpRemote()),
      child: BlocConsumer<SignUpCubit,SignUpState>(
        listener: (context, state){
          if(state is SignUpLoadingState){
             showDialog(
                context: context, builder: (context) => const AlertDialog(
               elevation: 0,
               backgroundColor: Colors.transparent,
               title: Center(child: CircularProgressIndicator()),
             ),
             );
          }
          else if (state is SignUpErrorState) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(state.failures.message ?? ""),
              ),
            );
          }
          else if(state is SignUpSuccessState){
            Navigator.pushReplacementNamed(context, Routes.login);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xff004182),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 85.h),
                    Image.asset("assets/image/logo_app.png"),
                    SizedBox(height: 46.5.h),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomFormField(
                            controller: SignUpCubit.get(context).nameController,
                            label: 'Full Name',
                            hint: 'please enter Full Name',
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'please enter full name';
                              }
                            }, textInputAction: TextInputAction.next,
                          ),
                          CustomFormField(
                            textInputAction: TextInputAction.next,
                            controller: SignUpCubit.get(context).phoneController,
                            label: 'Mobile Number',
                            hint: 'please enter mobile no.',
                            keyboardType: TextInputType.phone,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'please enter mobile no.';
                              }
                            },
                          ),
                          CustomFormField(
                            textInputAction: TextInputAction.next,
                            controller: SignUpCubit.get(context).emailController,
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
                          CustomFormField(
                            textInputAction: TextInputAction.next,
                            controller: SignUpCubit.get(context).passwordController,
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
                          CustomFormField(
                              textInputAction: TextInputAction.done,
                              controller: SignUpCubit.get(context).rePasswordController,
                              label: 'Password Confirmation',
                              hint: 'Re-Type password',
                              keyboardType: TextInputType.text,
                              isPassword: true,
                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return 'please enter password-confirmation';
                                }
                                if (SignUpCubit.get(context).passwordController.text != text) {
                                  return "password doesn't match";
                                }
                              }),
                          SizedBox(height: 24.h),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 12)),
                            onPressed: () {
                              if (formKey.currentState?.validate() == true) {
                                SignUpCubit.get(context).signUp();
                              }
                            },
                            child: Text(
                              'Sign up',
                              style: poppins20W600(),
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.pushReplacementNamed(context,Routes.login);
                            },child: Text('Already have account ? login',
                            style: poppins18W500(),
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
