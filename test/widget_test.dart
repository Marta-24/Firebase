import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:MusicApp/app/music_app.dart';

void main() {
  testWidgets('MusicApp widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MusicApp());

    // Example: Verify that a widget with a specific key exists
    expect(find.byKey(const Key('your_widget_key')), findsOneWidget);

    // Example: Tap on a widget and trigger a frame
    await tester.tap(find.byKey(const Key('your_tapable_widget_key')));
    await tester.pump();

    // Example: Verify the expected changes after the interaction
    expect(find.text('Expected Text'), findsOneWidget);
  });
}
