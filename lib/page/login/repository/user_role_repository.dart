import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dc_selfcare/enum/enum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_role_repository.g.dart';

class UserRoleRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserRoleTypes> checkUser({required User user}) async {
    try {
      DocumentSnapshot adminDoc =
          await _firestore.collection('admin').doc(user.email).get();
      if (adminDoc.exists) {
        return UserRoleTypes.admin;
      }

      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.email).get();
      if (userDoc.exists) {
        return UserRoleTypes.user;
      }

      return UserRoleTypes.none;
    } catch (e) {
      throw Exception(e);
    }
  }
}

@riverpod
UserRoleRepository userRoleRepository(UserRoleRepositoryRef ref) {
  return UserRoleRepository();
}
