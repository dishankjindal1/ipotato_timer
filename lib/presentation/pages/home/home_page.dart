import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipotato_timer/controller/controller_imports.dart';
import 'package:ipotato_timer/presentation/presentation_imports.dart';
import 'package:ipotato_timer/utility/utility_imports.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PixelScale.init(context);

    var tasks = ref.watch(taskControllerProvider).listOfTask;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(24.ws()),
          child: Container(
            width: double.maxFinite,
            color: MyPalette.secondaryLight,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(4.ws()),
                child: Text(
                  'iPotato Timer',
                  style: MyTextStyles.largeHeadlineTS.apply(
                    color: MyPalette.onSecondaryLight,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) => TimerInteractiveCard(
            task: tasks[index],
            taskIndex: index,
          ),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (tasks.isEmpty)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List<Widget>.generate(15, (index) => const AppSpacer()),
                  const Text(
                      'No timers active.\nPress here to start a new one'),
                  const Spacer(),
                  Image.asset(
                    MyAssets.arrowDown,
                  ),
                ],
              ),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRouter.addTimer);
              },
              child: const Icon(
                Icons.add_circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
