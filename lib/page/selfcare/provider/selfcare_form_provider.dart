import 'package:dc_selfcare/page/selfcare/repository/selfcare_form_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selfcare_form_provider.g.dart';
part 'selfcare_form_provider.freezed.dart';

@freezed
class SelfcareFormState with _$SelfcareFormState {
  const factory SelfcareFormState({
    required DateTime createdAt,
    required String bedTime,
    required String wakeUpTime,
    required int point,
    required String message,
  }) = _SelfcareFormState;
}

@riverpod
class SelfcareForm extends _$SelfcareForm {
  @override
  SelfcareFormState build() {
    return SelfcareFormState(
      createdAt: DateTime.now(),
      bedTime: '',
      wakeUpTime: '',
      point: 3,
      message: '',
    );
  }

  void setBedTime({required String bedTime}) {
    state = state.copyWith(bedTime: bedTime);
  }

  void setWakeUpTime({required String wakeUpTime}) {
    state = state.copyWith(wakeUpTime: wakeUpTime);
  }

  void setPoint({required int point}) {
    state = state.copyWith(point: point);
  }

  void setMessage({required String message}) {
    state = state.copyWith(message: message);
  }

  void resetSelfcareForm() {
    state = SelfcareFormState(
      createdAt: DateTime.now(),
      bedTime: '',
      wakeUpTime: '',
      point: 0,
      message: '',
    );
  }

  bool isFormValidated() {
    if (state.bedTime.isEmpty || state.wakeUpTime.isEmpty) {
      return false;
    }
    return true;
  }

  Future<bool> submitSelfcareForm({required String email}) async {
    final selfcareFormRepository = ref.read(selfcareFormRepositoryProvider);
    try {
      if (await selfcareFormRepository.createSelfcareForm(
        email: email,
        form: state,
      )) {
        resetSelfcareForm();
        return true;
      }
      return false;
    } catch (e, s) {
      resetSelfcareForm();
      throw Exception(e);
    }
  }
}
