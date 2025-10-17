import 'package:animals_task/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Fetch breeds flow test', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Check loading state
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for data to load
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Verify list of breeds loaded
    expect(find.textContaining('Breed'), findsWidgets);
  });
}
