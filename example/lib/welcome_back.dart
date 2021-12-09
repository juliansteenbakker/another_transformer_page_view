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
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Welcome extends StatelessWidget {
  final List<String> images = [
    'assets/home.png',
    'assets/good.png',
    'assets/image.png',
    'assets/edit.png'
  ];

  final List<String> titles = [
    'Welcome',
    'Simple to use',
    'Easy parallax',
    'Customizable'
  ];
  final List<String> subtitles = [
    'Flutter TransformerPageView, for welcome screen, banner, image catalog and more',
    'Simple api,easy to understand,powerful adn strong',
    'Create parallax by a few lines of code',
    'Highly customizable, the only boundary is our mind. :)'
  ];

  final List<Color> backgroundColors = [
    Color(0xffF67904),
    Color(0xffD12D2E),
    Color(0xff7A1EA1),
    Color(0xff1773CF)
  ];

  final index;

  Welcome(this.index);

  @override
  Widget build(BuildContext context) {
    return TransformerPageView(
        index: index,
        loop: false,
        transformer:
            PageTransformerBuilder(builder: (Widget child, TransformInfo info) {
          //  print('==========');
          return ParallaxColor(
            colors: backgroundColors,
            info: info,
            child: Column(
              children: <Widget>[
                Expanded(
                    child: ParallaxContainer(
                  position: info.position!,
                  opacityFactor: 1.0,
                  translationFactor: 400.0,
                  child: Image.asset(images[info.index!]),
                )),
                ParallaxContainer(
                  position: info.position!,
                  translationFactor: 100.0,
                  child: Text(
                    titles[info.index!],
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                ParallaxContainer(
                  position: info.position!,
                  translationFactor: 50.0,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 50.0),
                      child: Text(subtitles[info.index!],
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 13.0, color: Colors.white))),
                ),
              ],
            ),
          );
        }),
        itemCount: 4);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Welcome(index),
          ),
//          new ElevatedButton(onPressed: () {
//            this.setState(() {
//              index++;
//              if (index > 3) {
//                index = 0;
//              }
//            });
//          })
        ],
      ),
    );
  }
}
