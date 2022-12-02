import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/presentation/presentation_imports.dart';
import 'package:ipotato_timer/utility/utility_imports.dart';

void main() {
  group('Splash page widget unit testing', () {
    var widget = MaterialApp(builder: (context, child) => const SplashPage());
    testWidgets('Splash page contains 2 images', (tester) async {
      /// ----------------- Render ------------------ ///
      await tester.pumpWidget(widget);

      /// ----------------- Find ------------------ ///
      var logoFinder = find.image(const AssetImage(MyAssets.potato));
      var logoTextFinder = find.image(const AssetImage(MyAssets.logoText));

      /// ----------------- Assert ------------------ ///
      expect(logoFinder, findsOneWidget);
      expect(logoTextFinder, findsOneWidget);
    });
  });
}
