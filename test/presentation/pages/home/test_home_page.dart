import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/presentation/presentation_imports.dart';
import 'package:ipotato_timer/utility/utility_imports.dart';

void main() {
  group('Home Page widget unit testing', () {
    var child = ProviderScope(
      child: MaterialApp(builder: (context, child) {
        PixelScale.init(context);
        return const HomePage();
      }),
    );

    testWidgets('Find arrow asset and message, if there is no timer task added',
        (tester) async {
      /// ----------------- Render ------------------ ///
      await tester.pumpWidget(child);

      /// ----------------- Find ------------------ ///
      // var tasks = find.
      var floatingActionButtonFinder = find.byType(FloatingActionButton);
      var textFinder = find.textContaining('Press here to start a new one');

      /// ----------------- Assert ------------------ ///
      expect(floatingActionButtonFinder, findsOneWidget);
      expect(textFinder, findsOneWidget);
    });
    
    tearDown(() async {
      Future.delayed(const Duration(milliseconds: 100), () => exit(0));
    });
  });
}
