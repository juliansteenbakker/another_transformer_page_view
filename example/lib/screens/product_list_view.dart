import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:example/screens/product_detail_view.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

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
        title: const Text('ProductList'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 100.0,
            child: TransformerPageView(
              viewportFraction: 0.8,
              itemCount: 10,
              transformer: PageTransformerBuilder(
                builder: (w, i) {
                  return w;
                },
              ),
              itemBuilder: (c, i) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) {
                          return const ProductDetailView();
                        },
                      ),
                    );
                  },
                  child: ColoredBox(
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
