// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selfcare_form_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelfcareFormState {
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get bedTime => throw _privateConstructorUsedError;
  String get wakeUpTime => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelfcareFormStateCopyWith<SelfcareFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelfcareFormStateCopyWith<$Res> {
  factory $SelfcareFormStateCopyWith(
          SelfcareFormState value, $Res Function(SelfcareFormState) then) =
      _$SelfcareFormStateCopyWithImpl<$Res, SelfcareFormState>;
  @useResult
  $Res call(
      {DateTime createdAt,
      String bedTime,
      String wakeUpTime,
      int point,
      String message});
}

/// @nodoc
class _$SelfcareFormStateCopyWithImpl<$Res, $Val extends SelfcareFormState>
    implements $SelfcareFormStateCopyWith<$Res> {
  _$SelfcareFormStateCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelfcareFormStateImplCopyWith<$Res>
    implements $SelfcareFormStateCopyWith<$Res> {
  factory _$$SelfcareFormStateImplCopyWith(_$SelfcareFormStateImpl value,
          $Res Function(_$SelfcareFormStateImpl) then) =
      __$$SelfcareFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime createdAt,
      String bedTime,
      String wakeUpTime,
      int point,
      String message});
}

/// @nodoc
class __$$SelfcareFormStateImplCopyWithImpl<$Res>
    extends _$SelfcareFormStateCopyWithImpl<$Res, _$SelfcareFormStateImpl>
    implements _$$SelfcareFormStateImplCopyWith<$Res> {
  __$$SelfcareFormStateImplCopyWithImpl(_$SelfcareFormStateImpl _value,
      $Res Function(_$SelfcareFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? bedTime = null,
    Object? wakeUpTime = null,
    Object? point = null,
    Object? message = null,
  }) {
    return _then(_$SelfcareFormStateImpl(
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
    ));
  }
}

/// @nodoc

class _$SelfcareFormStateImpl
    with DiagnosticableTreeMixin
    implements _SelfcareFormState {
  const _$SelfcareFormStateImpl(
      {required this.createdAt,
      required this.bedTime,
      required this.wakeUpTime,
      required this.point,
      required this.message});

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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelfcareFormState(createdAt: $createdAt, bedTime: $bedTime, wakeUpTime: $wakeUpTime, point: $point, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelfcareFormState'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('bedTime', bedTime))
      ..add(DiagnosticsProperty('wakeUpTime', wakeUpTime))
      ..add(DiagnosticsProperty('point', point))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelfcareFormStateImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.bedTime, bedTime) || other.bedTime == bedTime) &&
            (identical(other.wakeUpTime, wakeUpTime) ||
                other.wakeUpTime == wakeUpTime) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, createdAt, bedTime, wakeUpTime, point, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelfcareFormStateImplCopyWith<_$SelfcareFormStateImpl> get copyWith =>
      __$$SelfcareFormStateImplCopyWithImpl<_$SelfcareFormStateImpl>(
          this, _$identity);
}

abstract class _SelfcareFormState implements SelfcareFormState {
  const factory _SelfcareFormState(
      {required final DateTime createdAt,
      required final String bedTime,
      required final String wakeUpTime,
      required final int point,
      required final String message}) = _$SelfcareFormStateImpl;

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
  @JsonKey(ignore: true)
  _$$SelfcareFormStateImplCopyWith<_$SelfcareFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
