import 'package:flutter/material.dart';
import 'package:another_transformer_page_view/another_transformer_page_view.dart';

class Zero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Zero'),
        ),
        body: TransformerPageView(
          itemCount: 0,
          itemBuilder: (c, i) {
            return Text('$i');
          },
        ));
  }
}
