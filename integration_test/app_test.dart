import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:animals_task/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App launches and shows home screen', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // تأكدي من إن الشاشة الرئيسية ظهرت
    expect(find.text('Home'), findsOneWidget);
  });
}
