// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskEntity {
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// storing computed timestamp based on duration selected
  int get exitTimeStamp => throw _privateConstructorUsedError;

  /// storing computed timestamp based duration selected
  int? get pausedTimeStamp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskEntityCopyWith<TaskEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEntityCopyWith<$Res> {
  factory $TaskEntityCopyWith(
          TaskEntity value, $Res Function(TaskEntity) then) =
      _$TaskEntityCopyWithImpl<$Res, TaskEntity>;
  @useResult
  $Res call(
      {String title,
      String? description,
      int exitTimeStamp,
      int? pausedTimeStamp});
}

/// @nodoc
class _$TaskEntityCopyWithImpl<$Res, $Val extends TaskEntity>
    implements $TaskEntityCopyWith<$Res> {
  _$TaskEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? exitTimeStamp = null,
    Object? pausedTimeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      exitTimeStamp: null == exitTimeStamp
          ? _value.exitTimeStamp
          : exitTimeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      pausedTimeStamp: freezed == pausedTimeStamp
          ? _value.pausedTimeStamp
          : pausedTimeStamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskEntityCopyWith<$Res>
    implements $TaskEntityCopyWith<$Res> {
  factory _$$_TaskEntityCopyWith(
          _$_TaskEntity value, $Res Function(_$_TaskEntity) then) =
      __$$_TaskEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String? description,
      int exitTimeStamp,
      int? pausedTimeStamp});
}

/// @nodoc
class __$$_TaskEntityCopyWithImpl<$Res>
    extends _$TaskEntityCopyWithImpl<$Res, _$_TaskEntity>
    implements _$$_TaskEntityCopyWith<$Res> {
  __$$_TaskEntityCopyWithImpl(
      _$_TaskEntity _value, $Res Function(_$_TaskEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? exitTimeStamp = null,
    Object? pausedTimeStamp = freezed,
  }) {
    return _then(_$_TaskEntity(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      exitTimeStamp: null == exitTimeStamp
          ? _value.exitTimeStamp
          : exitTimeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      pausedTimeStamp: freezed == pausedTimeStamp
          ? _value.pausedTimeStamp
          : pausedTimeStamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_TaskEntity implements _TaskEntity {
  _$_TaskEntity(
      {required this.title,
      this.description,
      required this.exitTimeStamp,
      this.pausedTimeStamp});

  @override
  final String title;
  @override
  final String? description;

  /// storing computed timestamp based on duration selected
  @override
  final int exitTimeStamp;

  /// storing computed timestamp based duration selected
  @override
  final int? pausedTimeStamp;

  @override
  String toString() {
    return 'TaskEntity(title: $title, description: $description, exitTimeStamp: $exitTimeStamp, pausedTimeStamp: $pausedTimeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.exitTimeStamp, exitTimeStamp) ||
                other.exitTimeStamp == exitTimeStamp) &&
            (identical(other.pausedTimeStamp, pausedTimeStamp) ||
                other.pausedTimeStamp == pausedTimeStamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, description, exitTimeStamp, pausedTimeStamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskEntityCopyWith<_$_TaskEntity> get copyWith =>
      __$$_TaskEntityCopyWithImpl<_$_TaskEntity>(this, _$identity);
}

abstract class _TaskEntity implements TaskEntity {
  factory _TaskEntity(
      {required final String title,
      final String? description,
      required final int exitTimeStamp,
      final int? pausedTimeStamp}) = _$_TaskEntity;

  @override
  String get title;
  @override
  String? get description;
  @override

  /// storing computed timestamp based on duration selected
  int get exitTimeStamp;
  @override

  /// storing computed timestamp based duration selected
  int? get pausedTimeStamp;
  @override
  @JsonKey(ignore: true)
  _$$_TaskEntityCopyWith<_$_TaskEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
