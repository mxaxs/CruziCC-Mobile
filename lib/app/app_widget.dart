import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'router.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:
          Colors.blueGrey.shade800, // navigation bar color
      statusBarColor: Colors.blueGrey.shade900, // status bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.dark, //navigation bar icons' color
    ));

    return MaterialApp(
      title: 'CruziCC',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(38, 50, 56, 1.0),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Color.fromRGBO(38, 50, 56, 1.0),
        brightness: Brightness.dark,
      ),
      initialRoute: '/login',
      //home: LoginPage(),
      onGenerateRoute: FRouter.router.generator,
    );
  }
}
