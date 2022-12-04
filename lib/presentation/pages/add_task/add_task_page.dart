import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipotato_timer/controller/controller_imports.dart';
import 'package:ipotato_timer/presentation/presentation_imports.dart';
import 'package:ipotato_timer/utility/utility_imports.dart';

class AddTaskPage extends ConsumerStatefulWidget {
  const AddTaskPage({super.key});

  @override
  ConsumerState<AddTaskPage> createState() => _AddTimerPageState();
}

class _AddTimerPageState extends ConsumerState<AddTaskPage> {
  late final TextEditingController _titleTextController;
  late final FocusNode _titleFocuNode;

  late final TextEditingController _descriptionTextController;
  late final FocusNode _descriptionFocuNode;

  late final List<TextEditingController> _timerTextController;

  late final List<FocusNode> _timerFocusNode;

  late bool isTitleInputActive = false;

  @override
  void initState() {
    _titleTextController = TextEditingController();
    _titleFocuNode = FocusNode();

    _descriptionTextController = TextEditingController();
    _descriptionFocuNode = FocusNode();

    _timerTextController = List.generate(3, (_) => TextEditingController());
    _timerFocusNode = List.generate(3, (_) => FocusNode());
    super.initState();
    // PixelScale.init(context);
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _titleFocuNode.dispose();

    _descriptionTextController.dispose();
    _descriptionFocuNode.dispose();

    for (var element in _timerTextController) {
      element.dispose();
    }

    for (var element in _timerFocusNode) {
      element.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Directionality(
        textDirection: TextDirection.ltr,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.ws(),
                  vertical: 2.5.hs(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (MediaQuery.of(context).viewInsets.bottom == 0)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Add Task',
                          style: MyTextStyles.largeHeadlineTS
                              .apply(color: MyPalette.onSurfaceVariantLight),
                        ),
                      ),
                    ...List<Widget>.generate(10, (index) => const AppSpacer()),
                    TextFormField(
                      key: const Key('title input'),
                      controller: _titleTextController,
                      focusNode: _titleFocuNode,
                      onTap: () {
                        isTitleInputActive = true;
                        _titleFocuNode.requestFocus();
                        if (mounted) {
                          setState(() {
                            isTitleInputActive = true;
                          });
                        }
                      },
                      scrollPadding: EdgeInsets.all(5.ws()),
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: MyTextStyles.smallLabelTS
                            .apply(color: MyPalette.primaryLight),
                        border: OutlineInputBorder(
                          gapPadding: 2.ws(),
                          borderRadius: BorderRadius.circular(4.ws()),
                          borderSide: const BorderSide(
                            color: MyPalette.outlineLight,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          gapPadding: 2.ws(),
                          borderRadius: BorderRadius.circular(4.ws()),
                          borderSide: const BorderSide(
                            color: MyPalette.outlineLight,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          gapPadding: 2.ws(),
                          borderRadius: BorderRadius.circular(4.ws()),
                          borderSide: BorderSide(
                            color: MyPalette.primaryLight,
                            width: 0.75.ws(),
                          ),
                        ),
                      ),
                    ),
                    if (isTitleInputActive) ...[
                      ...List<Widget>.generate(
                          10, (index) => const AppSpacer()),
                      TextFormField(
                        key: const Key('description input'),
                        controller: _descriptionTextController,
                        focusNode: _descriptionFocuNode,
                        maxLines: 5,
                        scrollPadding: EdgeInsets.all(5.ws()),
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: 'Description',
                          labelStyle: MyTextStyles.smallLabelTS
                              .apply(color: MyPalette.primaryLight),
                          hintText: 'e.g. john@gmail.com',
                          border: OutlineInputBorder(
                            gapPadding: 2.ws(),
                            borderRadius: BorderRadius.circular(4.ws()),
                            borderSide: const BorderSide(
                              color: MyPalette.outlineLight,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            gapPadding: 2.ws(),
                            borderRadius: BorderRadius.circular(4.ws()),
                            borderSide: const BorderSide(
                              color: MyPalette.outlineLight,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 2.ws(),
                            borderRadius: BorderRadius.circular(4.ws()),
                            borderSide: BorderSide(
                              color: MyPalette.primaryLight,
                              width: 0.75.ws(),
                            ),
                          ),
                        ),
                      ),
                      ...List<Widget>.generate(
                          10, (index) => const AppSpacer()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Duration',
                            style: MyTextStyles.mediumLabelTS,
                          ),
                          const AppSpacer(),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox.square(
                                    dimension: 14.ws(),
                                    child: ColoredBox(
                                      color: MyPalette.secondaryContainerLight,
                                      child: TextFormField(
                                        key: const Key('otp 1'),
                                        controller: _timerTextController[0],
                                        focusNode: _timerFocusNode[0],
                                        keyboardType: TextInputType.datetime,
                                        scrollPadding: EdgeInsets.all(5.ws()),
                                        style: MyTextStyles.smallBodyTS,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(2),
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^0*(?:[0-2][0-9]?|24)$'))
                                        ],
                                        decoration: const InputDecoration(
                                          hintText: 'HH',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        onChanged: (value) {
                                          if (value.length == 2) {
                                            _timerFocusNode[1].requestFocus();
                                          } else if (value.isEmpty) {
                                            _timerFocusNode[0].unfocus();
                                            _timerTextController[0].clear();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  const AppSpacer(),
                                  Text(
                                    'HH',
                                    style: MyTextStyles.smallLabelTS,
                                  ),
                                ],
                              ),
                              ...List<Widget>.generate(
                                  2, (index) => const AppSpacer()),
                              Column(
                                children: [
                                  Text(
                                    ':',
                                    style: MyTextStyles.smallLabelTS,
                                  ),
                                  ...List<Widget>.generate(
                                      7, (index) => const AppSpacer()),
                                ],
                              ),
                              ...List<Widget>.generate(
                                  2, (index) => const AppSpacer()),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox.square(
                                    dimension: 14.ws(),
                                    child: ColoredBox(
                                      color: MyPalette.secondaryContainerLight,
                                      child: TextFormField(
                                        key: const Key('otp 2'),
                                        controller: _timerTextController[1],
                                        focusNode: _timerFocusNode[1],
                                        keyboardType: TextInputType.datetime,
                                        scrollPadding: EdgeInsets.all(5.ws()),
                                        style: MyTextStyles.smallBodyTS,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(2),
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^0*(?:[0-6][0-6]?|60)$'))
                                        ],
                                        decoration: const InputDecoration(
                                          hintText: 'MM',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        onChanged: (value) {
                                          if (value.length == 2) {
                                            _timerFocusNode[2].requestFocus();
                                          } else if (value.isEmpty) {
                                            _timerFocusNode[1].unfocus();
                                            _timerFocusNode[0].requestFocus();
                                            _timerTextController[1].clear();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  const AppSpacer(),
                                  Text(
                                    'MM',
                                    style: MyTextStyles.smallLabelTS,
                                  ),
                                ],
                              ),
                              ...List<Widget>.generate(
                                  2, (index) => const AppSpacer()),
                              Column(
                                children: [
                                  Text(
                                    ':',
                                    style: MyTextStyles.smallLabelTS,
                                  ),
                                  ...List<Widget>.generate(
                                      7, (index) => const AppSpacer()),
                                ],
                              ),
                              ...List<Widget>.generate(
                                  2, (index) => const AppSpacer()),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox.square(
                                    dimension: 14.ws(),
                                    child: ColoredBox(
                                      color: MyPalette.secondaryContainerLight,
                                      child: TextFormField(
                                        key: const Key('otp 3'),
                                        controller: _timerTextController[2],
                                        focusNode: _timerFocusNode[2],
                                        keyboardType: TextInputType.datetime,
                                        style: MyTextStyles.smallBodyTS,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(2),
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^0*(?:[0-6][0-6]?|60)$'))
                                        ],
                                        scrollPadding: EdgeInsets.all(5.ws()),
                                        decoration: const InputDecoration(
                                          hintText: 'SS',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        onChanged: (value) {
                                          if (value.length == 2) {
                                            _timerFocusNode[2].unfocus();
                                          } else if (value.isEmpty) {
                                            _timerFocusNode[2].unfocus();
                                            _timerFocusNode[1].requestFocus();
                                            _timerTextController[2].clear();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  const AppSpacer(),
                                  Text(
                                    'SS',
                                    style: MyTextStyles.smallLabelTS,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
            bottomSheet: GestureDetector(
              onTap: () {
                var totalMilliseconds = 0;

                /// converting Hours to seconds, then adding
                totalMilliseconds +=
                    int.parse(_timerTextController[0].text) * 60 * 60;

                /// Converting Minutes to seconds, then adding
                totalMilliseconds +=
                    int.parse(_timerTextController[1].text) * 60;

                /// Adding becuase it is already in seconds
                totalMilliseconds += int.parse(_timerTextController[2].text);

                ref.read(taskControllerProvider.notifier).setTaskEntity(
                      title: _titleTextController.text,
                      content: _descriptionTextController.text,

                      /// Multi by 1000 to convert to milliseconds
                      totalMilliseconds: totalMilliseconds * 1000,
                    );

                Navigator.of(context).pop();
              },
              child: Container(
                height: 20.ws(),
                color: MyPalette.tertiaryContainerLight,
                child: Center(
                  child: Text(
                    'Add Task',
                    style: MyTextStyles.largeLabelTS,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
