// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selfcare_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelfcareFormModel {
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get bedTime => throw _privateConstructorUsedError;
  String get wakeUpTime => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelfcareFormModelCopyWith<SelfcareFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelfcareFormModelCopyWith<$Res> {
  factory $SelfcareFormModelCopyWith(
          SelfcareFormModel value, $Res Function(SelfcareFormModel) then) =
      _$SelfcareFormModelCopyWithImpl<$Res, SelfcareFormModel>;
  @useResult
  $Res call(
      {DateTime createdAt,
      String bedTime,
      String wakeUpTime,
      int point,
      String message,
      String email});
}

/// @nodoc
class _$SelfcareFormModelCopyWithImpl<$Res, $Val extends SelfcareFormModel>
    implements $SelfcareFormModelCopyWith<$Res> {
  _$SelfcareFormModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? bedTime = null,
    Object? wakeUpTime = null,
    Object? point = null,
    Object? message = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bedTime: null == bedTime
          ? _value.bedTime
          : bedTime // ignore: cast_nullable_to_non_nullable
              as String,
      wakeUpTime: null == wakeUpTime
          ? _value.wakeUpTime
          : wakeUpTime // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelfcareFormModelImplCopyWith<$Res>
    implements $SelfcareFormModelCopyWith<$Res> {
  factory _$$SelfcareFormModelImplCopyWith(_$SelfcareFormModelImpl value,
          $Res Function(_$SelfcareFormModelImpl) then) =
      __$$SelfcareFormModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime createdAt,
      String bedTime,
      String wakeUpTime,
      int point,
      String message,
      String email});
}

/// @nodoc
class __$$SelfcareFormModelImplCopyWithImpl<$Res>
    extends _$SelfcareFormModelCopyWithImpl<$Res, _$SelfcareFormModelImpl>
    implements _$$SelfcareFormModelImplCopyWith<$Res> {
  __$$SelfcareFormModelImplCopyWithImpl(_$SelfcareFormModelImpl _value,
      $Res Function(_$SelfcareFormModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? bedTime = null,
    Object? wakeUpTime = null,
    Object? point = null,
    Object? message = null,
    Object? email = null,
  }) {
    return _then(_$SelfcareFormModelImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bedTime: null == bedTime
          ? _value.bedTime
          : bedTime // ignore: cast_nullable_to_non_nullable
              as String,
      wakeUpTime: null == wakeUpTime
          ? _value.wakeUpTime
          : wakeUpTime // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelfcareFormModelImpl
    with DiagnosticableTreeMixin
    implements _SelfcareFormModel {
  const _$SelfcareFormModelImpl(
      {required this.createdAt,
      required this.bedTime,
      required this.wakeUpTime,
      required this.point,
      required this.message,
      required this.email});

  @override
  final DateTime createdAt;
  @override
  final String bedTime;
  @override
  final String wakeUpTime;
  @override
  final int point;
  @override
  final String message;
  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelfcareFormModel(createdAt: $createdAt, bedTime: $bedTime, wakeUpTime: $wakeUpTime, point: $point, message: $message, email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelfcareFormModel'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('bedTime', bedTime))
      ..add(DiagnosticsProperty('wakeUpTime', wakeUpTime))
      ..add(DiagnosticsProperty('point', point))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelfcareFormModelImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.bedTime, bedTime) || other.bedTime == bedTime) &&
            (identical(other.wakeUpTime, wakeUpTime) ||
                other.wakeUpTime == wakeUpTime) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, createdAt, bedTime, wakeUpTime, point, message, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelfcareFormModelImplCopyWith<_$SelfcareFormModelImpl> get copyWith =>
      __$$SelfcareFormModelImplCopyWithImpl<_$SelfcareFormModelImpl>(
          this, _$identity);
}

abstract class _SelfcareFormModel implements SelfcareFormModel {
  const factory _SelfcareFormModel(
      {required final DateTime createdAt,
      required final String bedTime,
      required final String wakeUpTime,
      required final int point,
      required final String message,
      required final String email}) = _$SelfcareFormModelImpl;

  @override
  DateTime get createdAt;
  @override
  String get bedTime;
  @override
  String get wakeUpTime;
  @override
  int get point;
  @override
  String get message;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$SelfcareFormModelImplCopyWith<_$SelfcareFormModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
