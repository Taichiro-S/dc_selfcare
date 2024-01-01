// import 'package:dc_selfcare/page/selfcare/repository/selfcare_form_repository.dart';
// import 'package:dc_selfcare/page/users_list/model/user.dart';
// import 'package:dc_selfcare/page/users_list/repository/users_list_repository.dart';
// import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'users_list_provider.g.dart';
// part 'users_list_provider.freezed.dart';

// @freezed
// class UsersState with _$UsersState {
//   const factory UsersState({
//     required AsyncValue<List<User>> users,
//   }) = _UsersState;
// }

// @riverpod
// class UsersList extends _$UsersList {
//   @override
//   UsersState build() {
//     return const UsersState(users: AsyncValue.data(<User>[]));
//   }

//   Future<void> fetchAllUsers() async {
//     final usersListRepository = ref.read(usersListRepositoryProvider);
//     state = state.copyWith(users: const AsyncValue.loading());
//     try {
//       final users = await usersListRepository.fetchAllUsers();
//       state = state.copyWith(users: AsyncValue.data(users));
//     } catch (e, s) {
//       state = state.copyWith(users: AsyncValue.error(e, s));
//     }
//   }
// }
