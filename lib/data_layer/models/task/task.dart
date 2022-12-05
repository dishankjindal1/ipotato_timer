// ignore_for_file: sort_constructors_first

import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

/// ----------------- UI Entity ------------------ ///
class TaskEntity extends _$_TaskModel {
  final String uuidE;
  final String titleE;
  final String? descriptionE;
  int exitTimeStampE;
  int? pausedTimeStampE;
  TaskEntity({
    required this.uuidE,
    required this.titleE,
    this.descriptionE,
    required this.exitTimeStampE,
    this.pausedTimeStampE,
  }) : super(
          uuid: uuidE,
          title: titleE,
          description: descriptionE,
          exitTimeStamp: exitTimeStampE,
          pausedTimeStamp: pausedTimeStampE,
        );

  @override
  String toString() =>
      'TaskEntity(uuidE: $uuidE, titleE: $titleE, descriptionE: $descriptionE, exitTimeStampE: $exitTimeStampE, pausedTimeStampE: $pausedTimeStampE)';
}

/// ----------------- SQL DataBase Table ------------------ ///
class Tasks extends drift.Table {
  drift.TextColumn get uuid => text().unique()();
  drift.TextColumn get title => text()();
  drift.TextColumn get description => text().nullable()();
  drift.IntColumn get exitTimeStamp => integer()();
  drift.IntColumn get pausedTimeStamp => integer().nullable()();
  drift.IntColumn get createdAt => integer()
      .withDefault(drift.Constant(DateTime.now().millisecondsSinceEpoch))
      .nullable()();

  Set<drift.Column> get primarKey => {uuid};
}

/// ----------------- Model (Talks with Local/Remote databases) ------------------ ///
@unfreezed
class TaskModel with _$TaskModel {
  factory TaskModel({
    required final String uuid,
    required final String title,
    final String? description,

    /// storing computed timestamp based on duration selected
    required int exitTimeStamp,

    /// storing computed timestamp based duration selected
    int? pausedTimeStamp,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, Object?> json) =>
      _$TaskModelFromJson(json);
}
