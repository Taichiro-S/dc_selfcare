import 'package:dc_selfcare/enum/enum.dart';
import 'package:dc_selfcare/page/login/repository/user_role_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_role_provider.freezed.dart';
part 'user_role_provider.g.dart';

@freezed
class UserRoleState with _$UserRoleState {
  const factory UserRoleState({
    required AsyncValue<UserRoleTypes> userRoleState,
  }) = _UserRoleState;
}

@riverpod
class UserRole extends _$UserRole {
  @override
  UserRoleState build() {
    return const UserRoleState(
        userRoleState: AsyncValue.data(UserRoleTypes.none));
  }

  Future<void> checkUserRole({required User user}) async {
    final userRoleRepository = ref.read(userRoleRepositoryProvider);
    state = state.copyWith(userRoleState: const AsyncValue.loading());
    try {
      final userRole = await userRoleRepository.checkUser(user: user);
      state = state.copyWith(userRoleState: AsyncValue.data(userRole));
    } catch (e, s) {
      state = state.copyWith(userRoleState: AsyncValue.error(e, s));
    }
  }
}
