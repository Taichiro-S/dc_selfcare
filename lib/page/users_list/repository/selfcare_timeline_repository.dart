import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dc_selfcare/page/selfcare/model/selfcare_form.dart';
import 'package:dc_selfcare/page/selfcare/provider/selfcare_form_provider.dart';
import 'package:dc_selfcare/page/users_list/model/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selfcare_timeline_repository.g.dart';

@riverpod
Stream<List<SelfcareFormModel>> selfcareTimeline(SelfcareTimelineRef ref) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    // 24時間以内に投稿されたデータを取得
    final selfcareCollection = firestore
        .collection('selfcare')
        .where('created_at',
            isGreaterThanOrEqualTo:
                DateTime.now().subtract(const Duration(hours: 24)))
        .orderBy('created_at', descending: true)
        .snapshots();

    return selfcareCollection.map((event) =>
        event.docs.map((e) => SelfcareFormModel.fromDocument(e)).toList());
  } catch (e) {
    throw Exception(e);
  }
}
