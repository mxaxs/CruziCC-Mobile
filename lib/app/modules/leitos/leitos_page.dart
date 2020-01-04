import 'package:cruzicc_v2/app/app_bloc.dart';
import 'package:cruzicc_v2/app/models/leitos.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../router.dart';
import 'leitos_bloc.dart';

class LeitosPage extends StatefulWidget {
  final String title;
  const LeitosPage({Key key, this.title = "Leitos"}) : super(key: key);

  @override
  _LeitosPageState createState() => _LeitosPageState();
}

class _LeitosPageState extends State<LeitosPage> {
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

  imageB64(String base64String) {
    final UriData data = Uri.parse(base64String).data;
    print('leitos_page:' + data.isBase64.toString()); // Should print true
    return data.contentAsBytes();
  }

  LeitosBloc bloc = LeitosBloc();
  AppBloc appBloc = AppBloc();

  @override
  void initState() {
    bloc.getLeitos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: LeitosModel(),
        stream: bloc.leitosOutput,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(38, 50, 56, 1.0),
            body: (snapshot.data.leitos == null || snapshot.hasError)
                ? Center(child: CircularProgressIndicator())
                : Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.leitos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 12.0,
                          margin: new EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: InkWell(
                            onTap: () {
                              // Function is executed on tap.
                              var leito = snapshot.data.leitos[index].leito;
                              var id = snapshot.data.leitos[index].id;

                              FRouter.router.navigateTo(
                                  context, '/paciente/$leito/$id',
                                  transition: TransitionType.material);
                            },
                            child: Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.memory(imageB64(
                                      snapshot.data.leitos[index].pulseira)),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(26, 32, 38, 0.7),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15))),
                                  width: double.infinity,
                                  //margin: EdgeInsets.only(left: 10, right: 10),
                                  padding: EdgeInsets.all(2),
                                  child: ListTile(
                                    leading:
                                        Icon(Icons.access_alarms, size: 30),
                                    trailing: Icon(
                                      Icons.sync,
                                      size: 30,
                                    ),
                                    title: Text(
                                      'LEITO ' +
                                          snapshot.data.leitos[index].leito,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    subtitle:
                                        Text(snapshot.data.leitos[index].plano),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            bottomNavigationBar: CurvedNavigationBar(
              //key: bottomNavigationKey,
              index: 1,
              height: 50.0,
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
        });
  }
}
