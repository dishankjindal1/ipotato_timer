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

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  String get uuid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// storing computed timestamp based on duration selected
  int get exitTimeStamp => throw _privateConstructorUsedError;

  /// storing computed timestamp based on duration selected
  set exitTimeStamp(int value) => throw _privateConstructorUsedError;

  /// storing computed timestamp based duration selected
  int? get pausedTimeStamp => throw _privateConstructorUsedError;

  /// storing computed timestamp based duration selected
  set pausedTimeStamp(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {String uuid,
      String title,
      String? description,
      int exitTimeStamp,
      int? pausedTimeStamp});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? description = freezed,
    Object? exitTimeStamp = null,
    Object? pausedTimeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_TaskModelCopyWith<$Res> implements $TaskModelCopyWith<$Res> {
  factory _$$_TaskModelCopyWith(
          _$_TaskModel value, $Res Function(_$_TaskModel) then) =
      __$$_TaskModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String title,
      String? description,
      int exitTimeStamp,
      int? pausedTimeStamp});
}

/// @nodoc
class __$$_TaskModelCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$_TaskModel>
    implements _$$_TaskModelCopyWith<$Res> {
  __$$_TaskModelCopyWithImpl(
      _$_TaskModel _value, $Res Function(_$_TaskModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? description = freezed,
    Object? exitTimeStamp = null,
    Object? pausedTimeStamp = freezed,
  }) {
    return _then(_$_TaskModel(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
class _$_TaskModel implements _TaskModel {
  _$_TaskModel(
      {required this.uuid,
      required this.title,
      this.description,
      required this.exitTimeStamp,
      this.pausedTimeStamp});

  factory _$_TaskModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaskModelFromJson(json);

  @override
  final String uuid;
  @override
  final String title;
  @override
  final String? description;

  /// storing computed timestamp based on duration selected
  @override
  int exitTimeStamp;

  /// storing computed timestamp based duration selected
  @override
  int? pausedTimeStamp;

  @override
  String toString() {
    return 'TaskModel(uuid: $uuid, title: $title, description: $description, exitTimeStamp: $exitTimeStamp, pausedTimeStamp: $pausedTimeStamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskModelCopyWith<_$_TaskModel> get copyWith =>
      __$$_TaskModelCopyWithImpl<_$_TaskModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskModelToJson(
      this,
    );
  }
}

abstract class _TaskModel implements TaskModel {
  factory _TaskModel(
      {required final String uuid,
      required final String title,
      final String? description,
      required int exitTimeStamp,
      int? pausedTimeStamp}) = _$_TaskModel;

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$_TaskModel.fromJson;

  @override
  String get uuid;
  @override
  String get title;
  @override
  String? get description;
  @override

  /// storing computed timestamp based on duration selected
  int get exitTimeStamp;

  /// storing computed timestamp based on duration selected
  set exitTimeStamp(int value);
  @override

  /// storing computed timestamp based duration selected
  int? get pausedTimeStamp;

  /// storing computed timestamp based duration selected
  set pausedTimeStamp(int? value);
  @override
  @JsonKey(ignore: true)
  _$$_TaskModelCopyWith<_$_TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}
