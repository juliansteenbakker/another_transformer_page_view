import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:another_transformer_page_view/another_transformer_page_view.dart';

void main() {
  testWidgets('TransformerPageView basic usage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
        home: TransformerPageView(
            itemBuilder: (context, index) {
              return const Text('0');
            },
            itemCount: 10)));

    expect(find.text('0', skipOffstage: false), findsOneWidget);
  });
  testWidgets('Zero item count ', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
        home: TransformerPageView(
            transformer: PageTransformerBuilder(
                builder: (Widget child, TransformInfo info) {
              return const Text('0');
            }),
            itemCount: 0)));

    expect(find.text('0', skipOffstage: false), findsNothing);
  });
  testWidgets('TransformerPageView transformer only',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
        home: TransformerPageView(
            transformer: PageTransformerBuilder(
                builder: (Widget child, TransformInfo info) {
              return const Text('0');
            }),
            itemCount: 10)));

    // expect(find.text("0", skipOffstage: false), findsOneWidget);
  });

//  testWidgets('TransformerPageView animations', (WidgetTester tester) async {
//    // Build our app and trigger a frame.
//    await tester.pumpWidget(MaterialApp(
//        home: TransformerPageView(
//            transformer: ScaleAndFadeTransformer(),
//            itemBuilder: (context, index) {
//              return Text("0");
//            },
//            itemCount: 10)));
//
//    expect(find.text("0", skipOffstage: false), findsOneWidget);
//  });
//
//  testWidgets('TransformerPageView animations', (WidgetTester tester) async {
//    // Build our app and trigger a frame.
//    await tester.pumpWidget(MaterialApp(
//        home: TransformerPageView(
//            transformer: AccordionTransformer(),
//            itemBuilder: (context, index) {
//              return Text("0");
//            },
//            itemCount: 10)));
//
//    expect(find.text("0", skipOffstage: false), findsOneWidget);
//  });
//
//  testWidgets('TransformerPageView animations', (WidgetTester tester) async {
//    // Build our app and trigger a frame.
//    await tester.pumpWidget(MaterialApp(
//        home: TransformerPageView(
//            transformer: ZoomInPageTransformer(),
//            itemBuilder: (context, index) {
//              return Text("0");
//            },
//            itemCount: 10)));
//
//    expect(find.text("0", skipOffstage: false), findsOneWidget);
//  });
//
//  testWidgets('TransformerPageView animations', (WidgetTester tester) async {
//    // Build our app and trigger a frame.
//    await tester.pumpWidget(MaterialApp(
//        home: TransformerPageView(
//            transformer: ZoomOutPageTransformer(),
//            itemBuilder: (context, index) {
//              return Text("0");
//            },
//            itemCount: 10)));
//
//    expect(find.text("0", skipOffstage: false), findsOneWidget);
//  });
//
//  testWidgets('TransformerPageView animations', (WidgetTester tester) async {
//    // Build our app and trigger a frame.
//    await tester.pumpWidget(MaterialApp(
//        home: TransformerPageView(
//            transformer: ThreeDTransformer(),
//            itemBuilder: (context, index) {
//              return Text("0");
//            },
//            itemCount: 10)));
//
//    expect(find.text("0", skipOffstage: false), findsOneWidget);
//  });
//
//  testWidgets('TransformerPageView animations', (WidgetTester tester) async {
//    // Build our app and trigger a frame.
//    await tester.pumpWidget(MaterialApp(
//        home: TransformerPageView(
//            transformer: DeepthPageTransformer(),
//            itemBuilder: (context, index) {
//              return Text("0");
//            },
//            itemCount: 10)));
//
//    expect(find.text("0", skipOffstage: false), findsOneWidget);
//  });
//
  testWidgets('TransformerPageView controller', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    var controller = IndexController();

    await tester.pumpWidget(MaterialApp(
        home: TransformerPageView(
            controller: controller,
            transformer: FackTransformer(),
            itemBuilder: (context, index) {
              debugPrint('===================build:$index');
              return Text('$index');
            },
            itemCount: 10)));

    expect(find.text('0'), findsOneWidget);
    await controller.next(animation: false);

    expect(find.text('0'), findsOneWidget);
    await controller.previous(animation: false);
    expect(find.text('0'), findsOneWidget);
    await controller.move(2, animation: false);
    expect(find.text('0'), findsOneWidget);
  });
}

class FackTransformer extends PageTransformer {
  @override
  Widget transform(Widget child, TransformInfo info) {
    return child;
  }
}
