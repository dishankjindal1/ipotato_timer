import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipotato_timer/data_layer/data_layer_imports.dart';

final taskControllerProvider =
    ChangeNotifierProvider<TaskController>((ref) => TaskController());

class TaskController extends ChangeNotifier {
  late final Timer timerPeriodic;

  DateTime currentDayTimeStamp = DateTime.now();

  List<TaskEntity> listOfTask = [];

  void setTaskEntity(
      {required String title,
      String? content,
      required int totalMilliseconds}) {
    var taskEnitity = TaskEntity(
      title: title,
      description: content,
      exitTimeStamp: _computedExitTimeStamp(totalMilliseconds),
    );

    listOfTask.add(taskEnitity);

    notifyListeners();
  }

  void setPauseTimeStamp(int index) {
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
      listOfTask[index] = entity;
    } else {
      var entity = listOfTask[index].copyWith(
        pausedTimeStamp: DateTime.now().millisecondsSinceEpoch,
      );
      listOfTask[index] = entity;
    }

    notifyListeners();
  }

  void remove(int index) {
    listOfTask.removeAt(index);

    notifyListeners();
  }

  int _computedExitTimeStamp(int milliseconds) {
    /// We safely Assume the time user press the add task button
    /// in the ui the logic will run at the same time
    var date = DateTime.now().add(Duration(milliseconds: milliseconds));
    return date.millisecondsSinceEpoch;
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
