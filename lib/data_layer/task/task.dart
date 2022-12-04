import 'package:freezed_annotation/freezed_annotation.dart';

// part 'task.g.dart';
part 'task.freezed.dart';

@freezed
class TaskEntity with _$TaskEntity {
  factory TaskEntity({
    required final String title,
    final String? description,

    /// storing computed timestamp based on duration selected
    required int exitTimeStamp,

    /// storing computed timestamp based duration selected
    int? pausedTimeStamp,
  }) = _TaskEntity;
}
