import 'package:flutter/material.dart';

class CidPage extends StatefulWidget {
  final String title;
  const CidPage({Key key, this.title = "Cid"}) : super(key: key);

  @override
  _CidPageState createState() => _CidPageState();
}

class _CidPageState extends State<CidPage> {
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
