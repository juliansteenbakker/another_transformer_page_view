import 'package:flutter/material.dart';

import 'package:another_transformer_page_view/another_transformer_page_view.dart';

import 'package:flutter/cupertino.dart';

// 1111111 !!!!!!

void main() => runApp(MyApp());
List<Color> list = [Colors.yellow, Colors.green, Colors.blue];

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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<String> images = ['assets/1.jpg', 'assets/2.jpg', 'assets/3.jpg'];

List<String> text0 = ['春归何处。寂寞无行路', '春无踪迹谁知。除非问取黄鹂', '山色江声相与清，卷帘待得月华生'];
List<String> text1 = ['若有人知春去处。唤取归来同住', '百啭无人能解，因风飞过蔷薇', '可怜一曲并船笛，说尽故人离别情。'];

class ImageTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransformerPageView(
        loop: true,
        viewportFraction: 0.8,
        transformer: PageTransformerBuilder(
            builder: (Widget child, TransformInfo info) {
          return Padding(
            padding: EdgeInsets.all(10.0),
            child: Material(
              elevation: 4.0,
              textStyle: TextStyle(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  ParallaxImage.asset(
                    images[info.index],
                    position: info.position,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                        colors: [
                          const Color(0xFF000000),
                          const Color(0x33FFC0CB),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10.0,
                    right: 10.0,
                    bottom: 10.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ParallaxContainer(
                          position: info.position,
                          translationFactor: 300.0,
                          child: Text(
                            text0[info.index],
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        ParallaxContainer(
                          position: info.position,
                          translationFactor: 200.0,
                          child: Text(text1[info.index],
                              style: TextStyle(fontSize: 18.0)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
        itemCount: 3);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 30.0),
          child: ImageTest()),
    );
  }
}
