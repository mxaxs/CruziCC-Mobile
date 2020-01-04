import 'package:flutter/material.dart';

class PlantaoPage extends StatefulWidget {
  final String title;
  const PlantaoPage({Key key, this.title = "Plantao"}) : super(key: key);

  @override
  _PlantaoPageState createState() => _PlantaoPageState();
}

class _PlantaoPageState extends State<PlantaoPage> {
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
