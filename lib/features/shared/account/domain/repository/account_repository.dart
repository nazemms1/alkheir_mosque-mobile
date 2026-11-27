import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'package:alkheir_mosque/app/core/function/function.dart';
import 'package:alkheir_mosque/app/core/http/dio_client.dart';
import 'package:alkheir_mosque/app/core/http/data/mapper/shared_mapper.dart';
import 'package:alkheir_mosque/app/core/http/domain/entities/base_api_entity.dart';

import '../../data/apis/account_apis.dart';
import '../../data/mapper/account_mapper.dart';
import '../../data/params/account_params.dart';
import '../entities/account_entity.dart';

abstract class AccountRepository {
  Future<BaseApiEntity<MobileUserEntity>> me();
  Future<BaseApiEntity<MobileUserEntity>> updateUsername(String username);
  Future<BaseApiEntity<MobileUserEntity>> uploadProfilePhoto({
    required String fileName,
    required Uint8List bytes,
  });

  /// يعيد عدد جلسات الأجهزة الأخرى التي أُلغيت.
  Future<BaseApiEntity<int>> changePassword({
    required String currentPassword,
    required String password,
  });
  Future<void> logoutEverywhere();
  Future<BaseApiEntity<BootstrapEntity>> bootstrap();
  Future<BaseApiEntity<DashboardEntity>> dashboard();
}

class AccountRepositoryImpl implements AccountRepository {
  final AccountApis api;

  AccountRepositoryImpl(this.api);

  @override
  Future<BaseApiEntity<MobileUserEntity>> me() async {
    final result = await handleRepoData(() => api.me());
    return result.toDomain((data) => data.toDomain());
  }

  @override
  Future<BaseApiEntity<MobileUserEntity>> updateUsername(
      String username) async {
    final result = await handleRepoData(
      () => api.updateUsername(UpdateUsernameParams(username: username)),
    );
    return result.toDomain((data) => data.toDomain());
  }

  @override
  Future<BaseApiEntity<MobileUserEntity>> uploadProfilePhoto({
    required String fileName,
    required Uint8List bytes,
  }) async {
    final result = await handleRepoData(
      () => api.uploadProfilePhoto(
        FormData.fromMap({
          'profile_photo': MultipartFile.fromBytes(bytes, filename: fileName),
        }),
        RequestOptions(
          sendTimeout: kUploadTimeout,
          receiveTimeout: kUploadTimeout,
        ),
      ),
    );
    return result.toDomain((data) => data.toDomain());
  }

  @override
  Future<BaseApiEntity<int>> changePassword({
    required String currentPassword,
    required String password,
  }) async {
    final result = await handleRepoData(
      () => api.changePassword(ChangePasswordParams(
        currentPassword: currentPassword,
        password: password,
        passwordConfirmation: password,
      )),
    );
    return result.toDomain((data) => data?.otherTokensRevoked ?? 0);
  }

  @override
  Future<void> logoutEverywhere() async {
    await handleRepoData(() => api.logoutEverywhere());
  }

  @override
  Future<BaseApiEntity<BootstrapEntity>> bootstrap() async {
    final result = await handleRepoData(() => api.bootstrap());
    return result.toDomain((data) => data.toDomain());
  }

  @override
  Future<BaseApiEntity<DashboardEntity>> dashboard() async {
    final result = await handleRepoData(() => api.dashboard());
    return result.toDomain((data) => data.toDomain());
  }
}
