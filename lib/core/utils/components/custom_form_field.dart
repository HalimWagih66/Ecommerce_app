import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef MyValidator = String? Function(String?);

class CustomFormField extends StatelessWidget {
  String label;
  String hint;
  bool isPassword;
  TextInputType keyboardType ;
  MyValidator validator;
  TextInputAction textInputAction;
  TextEditingController controller;
  CustomFormField({
    required this.label,
    required this.hint,
    required this.validator,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    required this.textInputAction
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
            style: TextStyle(
                color: Colors.white
            ),),
          SizedBox(height: 8.h,),
          TextFormField(
            textInputAction: textInputAction,
            controller: controller,
            validator:validator,
            keyboardType: keyboardType,
            obscureText: isPassword,
            decoration: InputDecoration(
              fillColor: Colors.white,
                filled: true,
                hintText: hint,
                hintStyle: TextStyle(
                    color: Theme.of(context).primaryColor
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor,width: 2.w)
                ),
                enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor,width: 2.w)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor,width: 2.w)
                ),
            ),
          ),
        ],
      ),
    );
  }
}