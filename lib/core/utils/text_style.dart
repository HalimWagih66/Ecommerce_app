import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

TextStyle poppins20W600() => GoogleFonts.poppins(
    fontSize: 20.sp, fontWeight: FontWeight.w600, color: AppColors.primary);

TextStyle poppins18W500() => GoogleFonts.poppins(
    fontSize: 18.sp, fontWeight: FontWeight.w500, color: Color(0xffFFFFFF));

TextStyle poppins18W300() => GoogleFonts.poppins(
    fontSize: 18.sp, fontWeight: FontWeight.w300, color: Color(0xff000000));

TextStyle poppins24W600() => GoogleFonts.poppins(
    fontSize: 24.sp, fontWeight: FontWeight.w600, color: Color(0xffFFFFFF));

TextStyle poppins16W300() => GoogleFonts.poppins(
    fontSize: 16.sp, fontWeight: FontWeight.w300, color: Color(0xffFFFFFF));


