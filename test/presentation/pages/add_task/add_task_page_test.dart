import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/presentation/presentation_imports.dart';
import 'package:ipotato_timer/utility/utility_imports.dart';

void main() {
  group('Add task page widget unit testing', () {
    var child = MaterialApp(builder: (context, child) {
      PixelScale.init(context);
      return Scaffold(
          body: Overlay(initialEntries: [
        OverlayEntry(builder: (context) => const AddTaskPage())
      ]));
    });

    testWidgets('Should be able to locate 1 TextFormFields on page load',
        (tester) async {
      /// ----------------- Render ------------------ ///
      await tester.pumpWidget(child);

      /// ----------------- Find ------------------ ///
      var findTextFormFields = find.byType(TextFormField);

      /// ----------------- Assert ------------------ ///
      expect(findTextFormFields, findsNWidgets(1));
    });

    testWidgets(
        'Should be able to locate 5 TextFormFields when tap on title input box',
        (tester) async {
      /// ----------------- Render ------------------ ///
      await tester.pumpWidget(child);

      /// ----------------- Find ------------------ ///
      var findTitleTextFormFields = find.byKey(const Key('title input'));

      await tester.tap(findTitleTextFormFields);
      await tester.pump();

      var findTextFormFields = find.byType(TextFormField);

      /// ----------------- Assert ------------------ ///
      expect(findTextFormFields, findsNWidgets(5));
    });

    tearDown(() async {
      Future.delayed(const Duration(milliseconds: 100), () => exit(0));
    });
  });
}
