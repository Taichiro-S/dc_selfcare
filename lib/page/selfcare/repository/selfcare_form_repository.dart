import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dc_selfcare/page/selfcare/provider/selfcare_form_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selfcare_form_repository.g.dart';

class SelfcareFormRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createSelfcareForm(
      {required SelfcareFormState form, required String email}) async {
    final now = DateTime.now();
    try {
      DocumentReference selfcareRef =
          _firestore.collection('selfcare').doc(now.toIso8601String());
      await selfcareRef.set({
        'email': email,
        'created_at': now,
        'bed_time': form.bedTime,
        'wakeup_time': form.wakeUpTime,
        'point': form.point,
        'message': form.message,
      });
      print(email);
      DocumentReference userRef = _firestore.collection('users').doc(email);
      await userRef.update({
        'selfcare_updated_at': now,
      });
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}

@riverpod
SelfcareFormRepository selfcareFormRepository(SelfcareFormRepositoryRef ref) {
  return SelfcareFormRepository();
}
