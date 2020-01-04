import 'package:flutter/material.dart';

class OcorrenciasPage extends StatefulWidget {
  final String title;
  const OcorrenciasPage({Key key, this.title = "Ocorrencias"})
      : super(key: key);

  @override
  _OcorrenciasPageState createState() => _OcorrenciasPageState();
}

class _OcorrenciasPageState extends State<OcorrenciasPage> {
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
