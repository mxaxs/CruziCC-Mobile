import 'package:cruzicc_v2/app/models/score.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../router.dart';
import 'dashboard_bloc.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key key, this.title = "Dashboard"}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  goTabs(context, index) {
    switch (index) {
      case 0:
        //Navigator.pushReplacementNamed(context, '/dash');
        FRouter.router
            .navigateTo(context, '/dash', transition: TransitionType.material);
        break;
      case 1:
        //Navigator.pushReplacementNamed(context, '/leitos');
        FRouter.router.navigateTo(context, '/leitos',
            transition: TransitionType.material);
        break;
      case 2:
        //Navigator.pushReplacementNamed(context, '/paciente');
        FRouter.router
            .navigateTo(context, '/setup', transition: TransitionType.material);
        break;
      default:
        //Navigator.pushReplacementNamed(context, '/login');
        FRouter.router
            .navigateTo(context, '/login', transition: TransitionType.material);
    }
  }

  DashboardBloc bloc = DashboardBloc();
  @override
  void initState() {
    bloc.loadDash();
    super.initState();
  }

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

    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 50, 56, 1.0),
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.access_alarms),
            onPressed: bloc.loadDash,
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: null,
        ),
      ),
      body: StreamBuilder<ScoreModel>(
          stream: bloc.dashOutput,
          initialData: ScoreModel(
              ocupados: 0, protocolos: 0, internacoes: 0, remocoes: 0, perc: 0),
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: CircularPercentIndicator(
                            radius: 180.0,
                            lineWidth: 10.0,
                            percent: (snapshot.data.ocupados / 12),
                            header: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: const Text(
                                "Ocupação Atual",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blueGrey),
                              ),
                            ),
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                (bloc.level == 0)
                                    ? CircularProgressIndicator()
                                    : Container(),
                                AnimatedOpacity(
                                  duration: Duration(seconds: 1),
                                  opacity: bloc.level,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        snapshot.data.perc.toString() + '%',
                                        style: TextStyle(fontSize: 60),
                                      ),
                                      Text(
                                        '${snapshot.data.ocupados} de 12',
                                        style: TextStyle(fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            backgroundColor: Colors.blueGrey.shade700,
                            progressColor: Colors.orange,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18, top: 10),
                          child: Container(),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 70),
                          child: Chip(
                            labelPadding: EdgeInsets.all(8),
                            backgroundColor: Colors.blueGrey.shade900,
                            avatar: CircleAvatar(
                              backgroundColor: Colors.orange,
                              child: Text(
                                //appScore.getScores[0].protocolos.toString(),
                                snapshot.data.protocolos.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            label: Text(
                              'Protocolos Abertos',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 70),
                          child: Chip(
                            labelPadding: EdgeInsets.all(8),
                            backgroundColor: Colors.blueGrey.shade900,
                            avatar: CircleAvatar(
                              backgroundColor: Colors.blue.shade700,
                              child: Text(
                                snapshot.data.internacoes.toString(),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            label: Text(
                              'Internações Solicitadas',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 70),
                          child: Chip(
                            labelPadding: EdgeInsets.all(8),
                            backgroundColor: Colors.blueGrey.shade900,
                            avatar: CircleAvatar(
                              backgroundColor: Colors.redAccent,
                              child: Text(
                                snapshot.data.remocoes.toString(),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            label: Text(
                              'Remoções Solicitadas',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
      bottomNavigationBar: CurvedNavigationBar(
        //key: bottomNavigationKey,
        index: 0,
        height: 45.0,
        items: <Widget>[
          Icon(Icons.home, size: 35),
          Icon(Icons.local_hotel, size: 35),
          Icon(FontAwesomeIcons.ambulance, size: 30),
        ],
        color: Colors.blueGrey.shade800,
        buttonBackgroundColor: Colors.blueGrey.shade800,
        backgroundColor: Colors.blueGrey.shade900,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          goTabs(context, index);
        },
      ),
    );
  }
}
