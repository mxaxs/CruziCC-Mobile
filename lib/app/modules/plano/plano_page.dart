import 'package:flutter/material.dart';

class PlanoPage extends StatefulWidget {
  final String title;
  const PlanoPage({Key key, this.title = "Plano"}) : super(key: key);

  @override
  _PlanoPageState createState() => _PlanoPageState();
}

class _PlanoPageState extends State<PlanoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
