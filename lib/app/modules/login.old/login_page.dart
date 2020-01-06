import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../router.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[400], // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.dark, //navigation bar icons' color
    ));

    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 50, 56, 1.0),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage('assets/bg-login.jpg'),
                    fit: BoxFit.cover)),
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.only(left: 30, right: 30),
                  color: Color.fromRGBO(255, 255, 255, .4),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 60.0, right: 60.0),
                        child: Image.asset('assets/secure.png'),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: const TextField(
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            enabledBorder: InputBorder.none,
                            hasFloatingPlaceholder: true,
                            //border: OutlineInputBorder(),
                            labelText: 'Usuário',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          style: TextStyle(fontSize: 22, color: Colors.black),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 30, right: 30, bottom: 30),
                        child: const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            isDense: true,
                            enabledBorder: InputBorder.none,
                            hasFloatingPlaceholder: true,
                            //border: OutlineInputBorder(),
                            labelText: 'Senha',
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: RaisedButton(
                            color: Colors.blueGrey[900],
                            child: const Text('ENTRAR',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                            onPressed: () {
                              FRouter.router.navigateTo(context, "/dash",
                                  transition: TransitionType.material);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
