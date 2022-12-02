import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/presentation/presentation_imports.dart';

void main() {
  group('Splash page widget unit testing', () {
    testWidgets('Splash page contains a text saying "Splash Page"',
        (tester) async {
      /// ----------------- Render ------------------ ///
      await tester.pumpWidget(const AddTimerPage());

      /// ----------------- Find ------------------ ///
      var textFinder = find.text('Splash Page');

      /// ----------------- Assert ------------------ ///
      expect(textFinder, findsOneWidget);
    });
  });
}
