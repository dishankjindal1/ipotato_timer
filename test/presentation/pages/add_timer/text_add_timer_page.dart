import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/presentation/presentation_imports.dart';

void main() {
  group('Add timer page widget unit testing', () {
    testWidgets('Add timer page contains a text saying "Add Timer Page"',
        (tester) async {
      /// ----------------- Render ------------------ ///
      await tester.pumpWidget(const AddTimerPage());

      /// ----------------- Find ------------------ ///
      var textFinder = find.text('Add Timer Page');

      /// ----------------- Assert ------------------ ///
      expect(textFinder, findsOneWidget);
    });
  });
}
