import 'package:flutter/material.dart';

class cartPage extends StatelessWidget {
  final Widget child;

  cartPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('购物车'),),
    );
  }
}