import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipotato_timer/controller/controller_imports.dart';
import 'package:ipotato_timer/presentation/presentation_imports.dart';
import 'package:ipotato_timer/utility/utility_imports.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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

  late final List<RegExp> _listOfRegExp;
  late final List<MaskTextInputFormatter> _maskTimerTextController;

  late final List<FocusNode> _timerFocusNode;

  late bool isTitleInputActive;

  @override
  void initState() {
    _titleTextController = TextEditingController();
    _titleFocuNode = FocusNode();

    _descriptionTextController = TextEditingController();
    _descriptionFocuNode = FocusNode();

    _listOfRegExp = [
      RegExp(r'^0*(?:[0-2][0-9]?|24)$'),
      RegExp(r'^0*(?:[0-6][0-9]?|60)$'),
    ];

    _maskTimerTextController = List.generate(
        3,
        (i) => MaskTextInputFormatter(
              mask: '00',
              filter:
                  i == 0 ? {'0': _listOfRegExp[0]} : {'0': _listOfRegExp[1]},
            ));

    _timerFocusNode = List.generate(3, (_) => FocusNode());

    isTitleInputActive = false;
    super.initState();
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _titleFocuNode.dispose();

    _descriptionTextController.dispose();
    _descriptionFocuNode.dispose();

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
                                        focusNode: _timerFocusNode[0],
                                        keyboardType: TextInputType.datetime,
                                        scrollPadding: EdgeInsets.all(5.ws()),
                                        style: MyTextStyles.mediumBodyTS,
                                        textAlign: TextAlign.right,
                                        inputFormatters: [
                                          _maskTimerTextController[0]
                                        ],
                                        decoration: InputDecoration(
                                          hintText: _maskTimerTextController[2]
                                              .getMask(),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        onChanged: (value) {
                                          if (value.length == 2) {
                                            _timerFocusNode[1].requestFocus();
                                          } else if (value.isEmpty) {
                                            _timerFocusNode[0].unfocus();
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
                                        focusNode: _timerFocusNode[1],
                                        keyboardType: TextInputType.datetime,
                                        scrollPadding: EdgeInsets.all(5.ws()),
                                        style: MyTextStyles.mediumBodyTS,
                                        textAlign: TextAlign.right,
                                        inputFormatters: [
                                          _maskTimerTextController[1]
                                        ],
                                        decoration: InputDecoration(
                                          hintText: _maskTimerTextController[2]
                                              .getMask(),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        onChanged: (value) {
                                          if (value.length == 2) {
                                            _timerFocusNode[2].requestFocus();
                                          } else if (value.isEmpty) {
                                            _timerFocusNode[1].unfocus();
                                            _timerFocusNode[0].requestFocus();
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
                                        focusNode: _timerFocusNode[2],
                                        keyboardType: TextInputType.datetime,
                                        style: MyTextStyles.mediumBodyTS,
                                        textAlign: TextAlign.right,
                                        inputFormatters: [
                                          _maskTimerTextController[2]
                                        ],
                                        scrollPadding: EdgeInsets.all(5.ws()),
                                        decoration: InputDecoration(
                                          hintText: _maskTimerTextController[2]
                                              .getMask(),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        onChanged: (value) {
                                          if (value.length == 2) {
                                            _timerFocusNode[2].unfocus();
                                          } else if (value.isEmpty) {
                                            _timerFocusNode[2].unfocus();
                                            _timerFocusNode[1].requestFocus();
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
                totalMilliseconds += int.parse(_maskTimerTextController[0]
                        .getUnmaskedText()
                        .padLeft(2, '0')) *
                    60 *
                    60;

                /// Converting Minutes to seconds, then adding
                totalMilliseconds += int.parse(_maskTimerTextController[1]
                        .getUnmaskedText()
                        .padLeft(2, '0')) *
                    60;

                /// Adding becuase it is already in seconds
                totalMilliseconds += int.parse(_maskTimerTextController[2]
                    .getUnmaskedText()
                    .padLeft(2, '0'));

                ref.read(taskControllerProvider.notifier).addTask(
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
