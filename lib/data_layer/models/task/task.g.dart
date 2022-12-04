// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskModel _$$_TaskModelFromJson(Map<String, dynamic> json) => _$_TaskModel(
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      exitTimeStamp: json['exitTimeStamp'] as int,
      pausedTimeStamp: json['pausedTimeStamp'] as int?,
    );

Map<String, dynamic> _$$_TaskModelToJson(_$_TaskModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'description': instance.description,
      'exitTimeStamp': instance.exitTimeStamp,
      'pausedTimeStamp': instance.pausedTimeStamp,
    };
