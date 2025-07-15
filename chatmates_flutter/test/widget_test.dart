import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chatmates_flutter/main.dart';

void main() {
  testWidgets('Basic smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const ChatMatesApp());

    // NOTE: This is based on Flutter's default counter app.
    // If your app doesn't have '0', '1' text or an add icon, this test will fail.
    // So you may remove or rewrite this test later.

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
