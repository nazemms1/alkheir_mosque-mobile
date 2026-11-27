import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:alkheir_mosque/app/core/http/data/models/base_api_model.dart';
import 'package:alkheir_mosque/app/core/http/end_points.dart';

import '../models/account_model.dart';
import '../params/account_params.dart';

part 'account_apis.g.dart';

@RestApi()
abstract class AccountApis {
  factory AccountApis(Dio dio) = _AccountApis;

  @GET(EndPoints.me)
  Future<BaseApiModel<MobileUserModel>> me();

  /// يعمل فقط إذا كان اسم المستخدم قابلاً للتعديل (ليس ولي أمر أو طالباً).
  @PATCH(EndPoints.me)
  Future<BaseApiModel<MobileUserModel>> updateUsername(
    @Body() UpdateUsernameParams params,
  );

  /// [data] يحمل الملف في الحقل `profile_photo`.
  @POST(EndPoints.meProfilePhoto)
  Future<BaseApiModel<MobileUserModel>> uploadProfilePhoto(
    @Body() FormData data,
    @DioOptions() RequestOptions options,
  );

  /// يُبقي الرمز الحالي ويُلغي رموز الأجهزة الأخرى.
  @PATCH(EndPoints.mePassword)
  Future<BaseApiModel<PasswordChangeModel>> changePassword(
    @Body() ChangePasswordParams params,
  );

  /// يُلغي كل رموز الحساب بما فيها الرمز الحالي.
  @DELETE(EndPoints.authTokens)
  Future<void> logoutEverywhere();

  @GET(EndPoints.bootstrap)
  Future<BaseApiModel<BootstrapModel>> bootstrap();

  @GET(EndPoints.dashboard)
  Future<BaseApiModel<DashboardModel>> dashboard();
}
