import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart';  // Use relative path to the app's main.dart so tests run regardless of package name

void main() {
  testWidgets('Bottom Navigation Bar renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify the demo text is visible (center body).
    expect(find.textContaining('Bottom Nav Demo'), findsOneWidget);

    // Verify bottom nav icons are present (smoke test for UI).
    expect(find.byIcon(Icons.home_outlined), findsOneWidget);  // Home icon
    expect(find.byIcon(Icons.map_outlined), findsOneWidget);   // Map icon (highlighted)

    // Optional: Verify background color (light gray scaffold).
    final scaffold = tester.firstWidget<Scaffold>(find.byType(Scaffold));
    expect(scaffold.backgroundColor, const Color(0xFFF5F5F5));

    // No interactions needed for Day 1 UI—it's static.
    debugPrint('Day 1 Test Passed: Bottom Nav UI replicates mockup!');
  });
}