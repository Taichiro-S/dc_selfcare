import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String email,
    required String name,
    required DateTime selfcareUpdatedAt,
  }) = _User;

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      email: doc['email'] as String,
      name: doc['name'] as String,
      selfcareUpdatedAt: (doc['selfcare_updated_at'] as Timestamp).toDate(),
    );
  }
}
