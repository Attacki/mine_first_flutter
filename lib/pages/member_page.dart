import 'package:flutter/material.dart';

class memberPage extends StatelessWidget {
  final Widget child;

  memberPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('会员页面'),),
    );
  }
}