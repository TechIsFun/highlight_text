import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_text_highlight/flutter_text_highlight.dart';

void main() {
  group("Widget test", () {
    testWidgets("test widget", (WidgetTester tester) async {
      Map<String, HighlightedWord> words = {
        "just": HighlightedWord(
          onTap: () {
            print("just");
          },
          textStyle: TextStyle(color: Colors.blue),
        ),
        "simple": HighlightedWord(
          onTap: () {
            print("simple");
          },
          textStyle: TextStyle(color: Colors.red),
        ),
      };

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: Container(
        child: Center(
          child:
              TextHighlight(text: "This is just a simple test", words: words),
        ),
      ))));

      await tester.pumpAndSettle(
          Duration(seconds: 10), EnginePhase.layout, Duration(minutes: 1));

      //var widget = tester.widget(find.byElementType(RichText));
      //expect(widget, isNotNull);
    });

    testWidgets("test empty words", (WidgetTester tester) async {
      Map<String, HighlightedWord> words = {};

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: Container(
        child: Center(
          child:
              TextHighlight(text: "This is just a simple test", words: words),
        ),
      ))));

      await tester.pumpAndSettle(
          Duration(seconds: 10), EnginePhase.layout, Duration(minutes: 1));

      //var widget = tester.widget(find.byElementType(RichText));
      //expect(widget, isNotNull);
    });

    testWidgets("test multiple spaces in text", (WidgetTester tester) async {
      Map<String, HighlightedWord> words = {};

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: Container(
        child: Center(
          child: TextHighlight(
              text: "This is    just a simple test", words: words),
        ),
      ))));

      await tester.pumpAndSettle(
          Duration(seconds: 10), EnginePhase.layout, Duration(minutes: 1));

      //var widget = tester.widget(find.byElementType(RichText));
      //expect(widget, isNotNull);
    });
  });
}
