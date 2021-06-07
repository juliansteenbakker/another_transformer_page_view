import 'package:example/screens/ProductDetailView.dart';
import 'package:flutter/material.dart';

import 'package:another_transformer_page_view/another_transformer_page_view.dart';

class ProductListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductListViewState();
  }
}

class ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductList'),
      ),
      body: ListView(
        children: <Widget>[
//          new SizedBox(
//            height: 1000.0,
//            child: new Container(
//              color: Colors.greenAccent,
//            ),
//          ),
          SizedBox(
            height: 100.0,
            child: TransformerPageView(
              viewportFraction: 0.8,
              itemCount: 10,
              transformer: PageTransformerBuilder(builder: (w, i) {
                return w;
              }),
              itemBuilder: (c, i) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c) {
                      return ProductDetailView();
                    }));
                  },
                  child: Container(
                    color: Colors.black26,
                    child: Text('$i'),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
