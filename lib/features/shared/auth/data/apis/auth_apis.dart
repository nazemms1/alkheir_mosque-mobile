import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:alkheir_mosque/app/core/http/end_points.dart';

import '../models/auth_token_model.dart';
import '../params/login_params.dart';

part 'auth_apis.g.dart';

@RestApi()
abstract class AuthApis {
  factory AuthApis(Dio dio) = _AuthApis;

  @POST(EndPoints.authToken)
  Future<AuthTokenModel> login(
    @Body() LoginParams params,
    @DioOptions() RequestOptions options,
  );

  @DELETE(EndPoints.authToken)
  Future<void> logout(@DioOptions() RequestOptions options);
}
