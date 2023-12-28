// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_role_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserRoleState {
  AsyncValue<UserRoleTypes> get userRoleState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserRoleStateCopyWith<UserRoleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleStateCopyWith<$Res> {
  factory $UserRoleStateCopyWith(
          UserRoleState value, $Res Function(UserRoleState) then) =
      _$UserRoleStateCopyWithImpl<$Res, UserRoleState>;
  @useResult
  $Res call({AsyncValue<UserRoleTypes> userRoleState});
}

/// @nodoc
class _$UserRoleStateCopyWithImpl<$Res, $Val extends UserRoleState>
    implements $UserRoleStateCopyWith<$Res> {
  _$UserRoleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRoleState = null,
  }) {
    return _then(_value.copyWith(
      userRoleState: null == userRoleState
          ? _value.userRoleState
          : userRoleState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<UserRoleTypes>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRoleStateImplCopyWith<$Res>
    implements $UserRoleStateCopyWith<$Res> {
  factory _$$UserRoleStateImplCopyWith(
          _$UserRoleStateImpl value, $Res Function(_$UserRoleStateImpl) then) =
      __$$UserRoleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<UserRoleTypes> userRoleState});
}

/// @nodoc
class __$$UserRoleStateImplCopyWithImpl<$Res>
    extends _$UserRoleStateCopyWithImpl<$Res, _$UserRoleStateImpl>
    implements _$$UserRoleStateImplCopyWith<$Res> {
  __$$UserRoleStateImplCopyWithImpl(
      _$UserRoleStateImpl _value, $Res Function(_$UserRoleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRoleState = null,
  }) {
    return _then(_$UserRoleStateImpl(
      userRoleState: null == userRoleState
          ? _value.userRoleState
          : userRoleState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<UserRoleTypes>,
    ));
  }
}

/// @nodoc

class _$UserRoleStateImpl implements _UserRoleState {
  const _$UserRoleStateImpl({required this.userRoleState});

  @override
  final AsyncValue<UserRoleTypes> userRoleState;

  @override
  String toString() {
    return 'UserRoleState(userRoleState: $userRoleState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRoleStateImpl &&
            (identical(other.userRoleState, userRoleState) ||
                other.userRoleState == userRoleState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userRoleState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRoleStateImplCopyWith<_$UserRoleStateImpl> get copyWith =>
      __$$UserRoleStateImplCopyWithImpl<_$UserRoleStateImpl>(this, _$identity);
}

abstract class _UserRoleState implements UserRoleState {
  const factory _UserRoleState(
          {required final AsyncValue<UserRoleTypes> userRoleState}) =
      _$UserRoleStateImpl;

  @override
  AsyncValue<UserRoleTypes> get userRoleState;
  @override
  @JsonKey(ignore: true)
  _$$UserRoleStateImplCopyWith<_$UserRoleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
