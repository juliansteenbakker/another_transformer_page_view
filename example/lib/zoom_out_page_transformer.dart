import 'package:example/buildin_transformers.dart';
import 'package:flutter/material.dart';

import 'package:another_transformer_page_view/another_transformer_page_view.dart';

import 'package:flutter/cupertino.dart';

void main() => runApp(const MyApp());
List<Color> list = [Colors.yellow, Colors.green, Colors.blue];

List<String> images = [
  'assets/Hepburn2.jpg',
  'assets/Hepburn5.jpg',
  'assets/Hepburn4.jpg',
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = <Color>[Colors.redAccent, Colors.blueAccent, Colors.greenAccent];
    return TransformerPageView(
        loop: true,
        transformer: ZoomOutPageTransformer(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: list[index % list.length],
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(fontSize: 80.0, color: Colors.white),
              ),
            ),
          );
        },
        itemCount: 3);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TestWidget(),
    );
  }
}
