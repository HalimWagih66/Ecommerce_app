import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/route/routes.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.login,
        onGenerateRoute:(settings) => GenerateRoutes.onGenerate(settings),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0
          ),
          primaryColor:  Color(0xFF004182),
          textTheme: const TextTheme(
              labelLarge: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color:  Color(0xFF004182)),
              labelMedium: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color:  Color(0xFF004182)),
              labelSmall: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color:  Color(0xFF004182)),
              bodyMedium : TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color:  Color(0xFF004182)
              )
          ),
        ),
      ),
    );
  }
}
