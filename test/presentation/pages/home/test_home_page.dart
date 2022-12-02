import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/presentation/presentation_imports.dart';

void main() {
  group('Home Page widget unit testing', () {
    testWidgets('Home Page contains a text saying "Home Page"', (tester) async {
      /// ----------------- Render ------------------ ///
      await tester.pumpWidget(const AddTimerPage());

      /// ----------------- Find ------------------ ///
      var textFinder = find.text('Home Page');

      /// ----------------- Assert ------------------ ///
      expect(textFinder, findsOneWidget);
    });
  });
}
