import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/end_point.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/features/login/data/models/SignUpModel.dart';
import 'login_data_sources.dart';

class RemoteDto implements LoginDataSources {
  Dio dio = Dio();

  @override
  Future<Either<Failures, LoginModel>> login(
      String email, String password) async {
    try {
      var response =
      await dio.post("${Constants.baseUrl}${EndPoint.login}", data: {
        "email": email,
        "password": password,
      });

      LoginModel loginModel = LoginModel.fromJson(response.data);
      return Right(loginModel);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}