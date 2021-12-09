import 'package:example/buildin_transformers.dart';
import 'package:example/images.dart';
import 'package:example/screens/ProductListView.dart';
import 'package:example/welcome.dart';
import 'package:example/zero.dart';
import 'package:flutter/material.dart';

import 'package:another_transformer_page_view/another_transformer_page_view.dart';

import 'package:flutter/cupertino.dart';
import 'dart:math' as math;
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

class _MyHomePageState extends State<MyHomePage> {
  IndexController? _controller;
  final List<String> _types = [
    'AccordionTransformer',
    'ThreeDTransformer',
    'ScaleAndFadeTransformer',
    'ZoomInPageTransformer',
    'ZoomOutPageTransformer',
    'DeepthPageTransformer'
  ];

  String? _type;
  FixedExtentScrollController? controller;
  int? _index = 0;
  double _viewportFraction = 1.0;

  @override
  void initState() {
    _controller = IndexController();
    _type = 'AccordionTransformer';
    controller = FixedExtentScrollController();
    super.initState();
  }

  PageTransformer getTransformer() {
    switch (_type) {
      case 'AccordionTransformer':
        return AccordionTransformer();
      case 'ThreeDTransformer':
        return ThreeDTransformer();
      case 'ScaleAndFadeTransformer':
        return ScaleAndFadeTransformer();
      case 'ZoomInPageTransformer':
        return ZoomInPageTransformer();
      case 'ZoomOutPageTransformer':
        return ZoomOutPageTransformer();
      case 'DeepthPageTransformer':
        return DeepthPageTransformer();
    }

    throw Exception('Not a type');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return ProductListView();
              }));
            },
            child: Text('route'),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _controller!.move(math.Random().nextInt(5));
                },
                child: Text('Random'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (b) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text('images'),
                      ),
                      body: ImageTest(),
                    );
                  }));
                },
                child: Text('Image'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (b) {
                    return Scaffold(
                        appBar: AppBar(
                          title: Text('welcome'),
                        ),
                        body: Welcome(0));
                  }));
                },
                child: Text('Welcome'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (b) {
                    return Zero();
                  }));
                },
                child: Text('Zero'),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _controller!.previous();
                },
                child: Text('Preious'),
              ),
              SizedBox(
                width: 8.0,
              ),
              ElevatedButton(
                onPressed: () {
                  _controller!.next();
                },
                child: Text('Next'),
              ),
              SizedBox(
                width: 8.0,
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return CupertinoPicker(
                            scrollController: controller,
                            itemExtent: 30.0,
                            onSelectedItemChanged: (int index) {
                              setState(() {
                                controller = FixedExtentScrollController(
                                    initialItem: index);
                                _type = _types[index];
                                if (_type == 'ScaleAndFadeTransformer') {
                                  _viewportFraction = 0.8;
                                } else {
                                  _viewportFraction = 1.0;
                                }
                              });
                            },
                            children: _types.map((t) => Text(t)).toList());
                      });
                },
                child: Text('Animation'),
              ),
            ],
          ),
          Expanded(
              child: SizedBox(
            child: TransformerPageView(
                loop: false,
                index: _index,
                viewportFraction: _viewportFraction,
                controller: _controller,
                transformer: getTransformer(),
                onPageChanged: (int? index) {
                  setState(() {
                    _index = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: 3),
          ))
        ],
      ),
    );
  }
}
