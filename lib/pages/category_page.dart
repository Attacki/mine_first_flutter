import 'package:flutter/material.dart';

class categoryPage extends StatelessWidget {
  final Widget child;

  categoryPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('分类'),),
    );
  }
}