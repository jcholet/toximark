import 'package:flutter_test/flutter_test.dart';
import 'package:health_pitstop/src/app/view/app.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
    });
  });
}
