import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipotato_timer/data_layer/data_layer_imports.dart';
import 'package:uuid/uuid.dart';

final taskControllerProvider = ChangeNotifierProvider<TaskController>(
  (ref) => TaskController(
    database: MyDatabase(),
  ),
);

class TaskController extends ChangeNotifier {
  TaskController({required MyDatabase database}) {
    _database = database;
    _database.select(_database.tasks).get().then((values) {
      for (var a in values) {
        var entity = TaskEntity(
          uuidE: a.uuid,
          titleE: a.title,
          descriptionE: a.description,
          exitTimeStampE: a.exitTimeStamp,
          pausedTimeStampE: a.pausedTimeStamp,
        );

        listOfTask.add(entity);
        notifyListeners();
      }
    });
  }

  late MyDatabase _database;
  late final Timer timerPeriodic;

  DateTime currentDayTimeStamp = DateTime.now();

  List<TaskEntity> listOfTask = [];
  void _addToListOfTask(TaskEntity e) {
    listOfTask.add(e);
    notifyListeners();
  }

  void addTask(
      {required String title,
      String? content,
      required int totalMilliseconds}) {
    var taskEnitity = TaskEntity(
      uuidE: Uuid().v4(),
      titleE: title,
      descriptionE: content,
      exitTimeStampE: _computedExitTimeStamp(totalMilliseconds),
    );

    _insertTaskDB(taskEnitity);
  }

  int _computedExitTimeStamp(int milliseconds) {
    /// We safely Assume the time user press the add task button
    /// in the ui the logic will run at the same time
    var date = DateTime.now().add(Duration(milliseconds: milliseconds));
    return date.millisecondsSinceEpoch;
  }

  void togglePause(int index) async {
    if (listOfTask.isEmpty) return;

    if (listOfTask[index].pausedTimeStamp != null) {
      var exitTimeStamp =
          DateTime.fromMillisecondsSinceEpoch(listOfTask[index].exitTimeStamp);
      var pausedTimeStamp = DateTime.fromMillisecondsSinceEpoch(
          listOfTask[index].pausedTimeStamp!);
      var currentTimeStamp = DateTime.now();

      var differenceInTime = currentTimeStamp.difference(pausedTimeStamp);

      var addDifferenceToExitTimeStamp = exitTimeStamp.add(differenceInTime);

      var entity = listOfTask[index].copyWith(
        exitTimeStamp: addDifferenceToExitTimeStamp.millisecondsSinceEpoch,
        pausedTimeStamp: null,
      );

      listOfTask[index] = TaskEntity(
        uuidE: entity.uuid,
        titleE: entity.title,
        descriptionE: entity.description,
        exitTimeStampE: entity.exitTimeStamp,
        pausedTimeStampE: entity.pausedTimeStamp,
      );

      await _insertTaskDB(listOfTask[index], update: true);
    } else {
      var entity = listOfTask[index].copyWith(
        pausedTimeStamp: DateTime.now().millisecondsSinceEpoch,
      );
      listOfTask[index] = TaskEntity(
        uuidE: entity.uuid,
        titleE: entity.title,
        descriptionE: entity.description,
        exitTimeStampE: entity.exitTimeStamp,
        pausedTimeStampE: entity.pausedTimeStamp,
      );

      await _insertTaskDB(listOfTask[index], update: true);
    }

    notifyListeners();
  }

  Future<void> _insertTaskDB(TaskEntity task, {bool update = false}) async {
    if (update) {
      var a = _database.update(_database.tasks)
        ..where((tbl) => tbl.uuid.equals(task.uuidE));
      await a.write(
        TasksCompanion(
          exitTimeStamp: Value(task.exitTimeStampE),
          pausedTimeStamp: task.pausedTimeStampE != null
              ? Value(task.pausedTimeStampE!)
              : const Value.absent(),
        ),
      );
    } else {
      await _database.into(_database.tasks).insert(
            Task(
              uuid: task.uuidE,
              title: task.titleE,
              description: task.descriptionE,
              exitTimeStamp: task.exitTimeStampE,
              pausedTimeStamp: task.pausedTimeStampE,
            ),
          );
      _addToListOfTask(task);
    }
  }

  void removeTask(int index) {
    var a = listOfTask.removeAt(index);

    _deleteTaskDB(a.uuidE);

    notifyListeners();
  }

  Future<void> _deleteTaskDB(String uuid) async {
    var a = _database.delete(_database.tasks);
    a.where((tbl) => tbl.uuid.equals(uuid));
    await a.go();
  }

  @override
  void addListener(VoidCallback listener) {
    timerPeriodic = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentDayTimeStamp = DateTime.now();
      notifyListeners();
    });
    super.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    timerPeriodic.cancel();
    super.removeListener(listener);
  }
}
