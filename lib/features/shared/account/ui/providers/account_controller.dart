import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/app/core/http/api_helper_mixin.dart';
import 'package:alkheir_mosque/features/shared/account/di/account_providers.dart';
import 'package:alkheir_mosque/features/shared/account/domain/entities/account_entity.dart';

part 'account_controller.g.dart';

class AccountState {
  const AccountState({
    this.user,
    this.isLoading = true,
    this.isBusy = false,
    this.errorMessage,
  });

  final MobileUserEntity? user;
  final bool isLoading;

  /// عملية جارية (حفظ/رفع/خروج) فوق بيانات معروضة.
  final bool isBusy;
  final String? errorMessage;

  AccountState copyWith({
    MobileUserEntity? user,
    bool? isLoading,
    bool? isBusy,
    String? errorMessage,
  }) {
    return AccountState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      isBusy: isBusy ?? this.isBusy,
      errorMessage: errorMessage,
    );
  }
}

@riverpod
class AccountController extends _$AccountController with ApiHelperMixin {
  @override
  AccountState build() {
    Future.microtask(load);
    return const AccountState();
  }

  Future<void> load() async {
    state = state.copyWith(isLoading: true);
    final result = await executeApi(
      action: () => ref.read(accountRepositoryProvider).me(),
      errorHandler: (e) =>
          state = state.copyWith(isLoading: false, errorMessage: '$e'),
    );
    if (result != null) {
      state = state.copyWith(user: result.data, isLoading: false);
    }
  }

  Future<String?> updateUsername(String username) =>
      _run(() => ref.read(accountRepositoryProvider).updateUsername(username));

  Future<String?> uploadProfilePhoto(String fileName, Uint8List bytes) =>
      _run(() => ref
          .read(accountRepositoryProvider)
          .uploadProfilePhoto(fileName: fileName, bytes: bytes));

  /// يعيد رسالة الخطأ أو `null` عند النجاح.
  Future<String?> changePassword({
    required String currentPassword,
    required String password,
  }) async {
    String? error;
    await executeApi(
      action: () => ref.read(accountRepositoryProvider).changePassword(
            currentPassword: currentPassword,
            password: password,
          ),
      errorHandler: (e) => error = '$e',
    );
    return error;
  }

  /// يُلغي كل الجلسات على الخادم؛ الخروج المحلي يكمل حتى لو فشل الطلب.
  Future<void> logoutEverywhere() async {
    state = state.copyWith(isBusy: true, errorMessage: state.errorMessage);
    await executeApi(
      action: () => ref.read(accountRepositoryProvider).logoutEverywhere(),
    );
  }

  /// تعديل ثم إعادة تحميل البيانات؛ يعيد رسالة الخطأ أو `null` عند النجاح.
  Future<String?> _run(Future<Object?> Function() action) async {
    state = state.copyWith(isBusy: true);
    String? error;
    await executeApi(action: action, errorHandler: (e) => error = '$e');
    state = state.copyWith(isBusy: false);
    if (error == null) await load();
    return error;
  }
}
