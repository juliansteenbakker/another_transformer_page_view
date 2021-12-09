import 'package:flutter/material.dart';
import 'package:another_transformer_page_view/another_transformer_page_view.dart';

class Zero extends StatelessWidget {
  const Zero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Zero'),
        ),
        body: TransformerPageView(
          itemCount: 0,
          itemBuilder: (c, i) {
            return Text('$i');
          },
        ));
  }
}
