import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dc_selfcare/page/selfcare/repository/selfcare_form_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selfcare_form.freezed.dart';

@freezed
class SelfcareFormModel with _$SelfcareFormModel {
  const factory SelfcareFormModel({
    required DateTime createdAt,
    required String bedTime,
    required String wakeUpTime,
    required int point,
    required String message,
    required String email,
  }) = _SelfcareFormModel;

  factory SelfcareFormModel.fromDocument(DocumentSnapshot doc) {
    return SelfcareFormModel(
      createdAt: (doc['created_at'] as Timestamp).toDate(),
      bedTime: doc['bed_time'] as String,
      wakeUpTime: doc['wakeup_time'] as String,
      point: doc['point'] as int,
      message: doc['message'] as String,
      email: doc['email'] as String,
    );
  }
}
