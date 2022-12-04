import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/presentation/presentation_imports.dart';
import 'package:ipotato_timer/utility/utility_imports.dart';

void main() {
  group('Splash page widget unit testing', () {
    var child = MaterialApp(builder: (context, child) {
      PixelScale.init(context);
      return const SplashPage();
    });
    testWidgets('Splash page contains 2 images', (tester) async {
      /// ----------------- Render ------------------ ///
      await tester.pumpWidget(child);

      /// ----------------- Find ------------------ ///
      var logoFinder = find.image(const AssetImage(MyAssets.potato));
      var logoTextFinder = find.image(const AssetImage(MyAssets.logoText));

      /// ----------------- Assert ------------------ ///
      expect(logoFinder, findsOneWidget);
      expect(logoTextFinder, findsOneWidget);
    });

    tearDown(() async {
      Future.delayed(const Duration(milliseconds: 100), () => exit(0));
    });
  });
}
