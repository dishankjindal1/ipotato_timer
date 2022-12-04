import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipotato_timer/controller/controller_imports.dart';
import 'package:ipotato_timer/data_layer/data_layer_imports.dart';
import 'package:ipotato_timer/presentation/presentation_imports.dart';
import 'package:ipotato_timer/utility/utility_imports.dart';

class TimerInteractiveCard extends ConsumerWidget {
  const TimerInteractiveCard({
    super.key,
    required this.task,
    required this.taskIndex,
  });

  final TaskEntity task;
  final int taskIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var exitTimeStamp = task.exitTimeStamp;
    var pausedTimeStamp = task.pausedTimeStamp;
    var currentTimeStamp = ref.read(taskControllerProvider).currentDayTimeStamp;
    var isPaused = task.pausedTimeStamp != null;
    var isFinished =
        task.exitTimeStamp <= currentTimeStamp.millisecondsSinceEpoch;

    if (isPaused) {
      var a = DateTime.fromMillisecondsSinceEpoch(exitTimeStamp);
      var b =
          a.difference(DateTime.fromMillisecondsSinceEpoch(pausedTimeStamp!));
      
      /// Storing the values in seconds because in parser we are 
      exitTimeStamp = b.inSeconds;
    } else {
      var a = DateTime.fromMillisecondsSinceEpoch(exitTimeStamp);
      var b = a.difference(currentTimeStamp);
      exitTimeStamp = b.inSeconds;
    }

    return Card(
      elevation: 2.ws(),
      margin: EdgeInsets.symmetric(horizontal: 4.ws(), vertical: 2.ws()),
      surfaceTintColor: const Color(0xFF006782).withOpacity(0.05),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.ws())),
      color: const Color(0xFFFBFCFE),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.ws()),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(4.ws()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isFinished)
                    Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.graphic_eq,
                            color: MyPalette.primaryLight,
                            size: 6.ws(),
                          ),
                          Text(
                            'FINISHED',
                            style: MyTextStyles.largeHeadlineTS
                                .apply(color: MyPalette.primaryLight),
                          ),
                          Icon(
                            Icons.graphic_eq,
                            color: MyPalette.primaryLight,
                            size: 6.ws(),
                          )
                        ],
                      ),
                    )
                  else
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            exitTimeStamp.toTime(),
                            style: MyTextStyles.largeHeadlineTS
                                .apply(color: MyPalette.primaryLight),
                          ),
                          IconButton(
                            onPressed: () => ref
                                .read(taskControllerProvider)
                                .setPauseTimeStamp(taskIndex),
                            icon: Card(
                              color: const Color(0xFF5B5B7D),
                              child: Padding(
                                padding: EdgeInsets.all(0.ws()),
                                child: Center(
                                  child: Icon(
                                    isPaused ? Icons.play_arrow : Icons.pause,
                                    color: Colors.white,
                                    size: 4.ws(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => ref
                                .read(taskControllerProvider)
                                .remove(taskIndex),
                            icon: Card(
                              color: const Color(0xFF5B5B7D),
                              child: Padding(
                                padding: EdgeInsets.all(0.ws()),
                                child: Center(
                                  child: Icon(
                                    Icons.stop,
                                    color: Colors.white,
                                    size: 4.ws(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ...List<Widget>.generate(2, (index) => const AppSpacer()),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.ws(),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          style: MyTextStyles.largeTitleTS.apply(
                            color: MyPalette.secondaryLight,
                          ),
                        ),
                        if (task.description != null)
                          Text(
                            task.description!,
                            style: MyTextStyles.mediumBodyTS.apply(
                              color: MyPalette.primaryLight,
                            ),
                          ),
                      ],
                    ),
                  ),
                  ...List<Widget>.generate(2, (index) => const AppSpacer()),
                  if (isFinished)
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                MyPalette.tertiaryContainerLight)),
                        onPressed: () {
                          ref
                              .read(taskControllerProvider.notifier)
                              .remove(taskIndex);
                        },
                        child: Text(
                          'Mark Complete',
                          style: MyTextStyles.mediumLabelTS
                              .apply(color: MyPalette.onTertiaryContainerLight),
                        ),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
