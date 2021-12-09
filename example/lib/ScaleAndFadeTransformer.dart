import 'package:example/buildin_transformers.dart';
import 'package:flutter/material.dart';

import 'package:another_transformer_page_view/another_transformer_page_view.dart';

import 'package:flutter/cupertino.dart';

// 1111111 !!!!!!

void main() => runApp(MyApp());
List<Color> list = [Colors.yellow, Colors.green, Colors.blue];

List<String> images = [
  'assets/Hepburn2.jpg',
  'assets/Hepburn5.jpg',
  'assets/Hepburn4.jpg',
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = <Color>[Colors.redAccent, Colors.blueAccent, Colors.greenAccent];
    return TransformerPageView(
        loop: true,
        transformer: ScaleAndFadeTransformer(),
        viewportFraction: 0.8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: list[index % list.length],
            child: Center(
              child: Text(
                '$index',
                style: TextStyle(fontSize: 80.0, color: Colors.white),
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
    return Scaffold(
      body: TestWidget(),
    );
  }
}
