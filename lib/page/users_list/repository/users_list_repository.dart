import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dc_selfcare/page/users_list/model/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_list_repository.g.dart';

// class UsersListRepository {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<List<User>> fetchAllUsers() async {
//     try {
//       QuerySnapshot usersSnap = await _firestore.collection('users').get();
//       if (usersSnap.docs.isNotEmpty) {
//         return usersSnap.docs.map((doc) => User.fromDocument(doc)).toList();
//       }
//       return [];
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }

// @riverpod
// UsersListRepository usersListRepository(UsersListRepositoryRef ref) {
//   return UsersListRepository();
// }

@riverpod
Stream<List<User>> usersList(UsersListRef ref) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    final usersCollection = firestore
        .collection('users')
        .orderBy('selfcare_updated_at', descending: true)
        .snapshots();
    return usersCollection
        .map((event) => event.docs.map((e) => User.fromDocument(e)).toList());
  } catch (e) {
    throw Exception(e);
  }
}
