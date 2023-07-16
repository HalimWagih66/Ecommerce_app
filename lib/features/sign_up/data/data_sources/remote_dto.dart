import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/api/end_point.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/sign_up/data/data_sources/signup_data_source.dart';
import 'package:ecommerce/features/sign_up/data/models/SignUpModel.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/constants.dart';
import '../../domain/entities/UserData.dart';

class SignUpRemote extends SignUpDataSource{
  var dio = Dio();
  @override
  Future<Either<Failures, SignUpModel>> signUp(UserData userData)async {
    try {
      var response = await dio.post("${Constants.baseUrl}${EndPoint.signUp}",
          data: {
            "name":userData.name,
            "email":userData.email,
            "password":userData.password,
            "rePassword":userData.rePassword,
            "phone":userData.phone
          });
      SignUpModel result = SignUpModel.fromJson(response.data);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

}