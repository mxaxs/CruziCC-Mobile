
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../router.dart';
import 'paciente_bloc.dart';

class PacientePage extends StatefulWidget {
  final String title;
  final String id;
  final String leito;
  const PacientePage(this.leito, this.id, {Key key, this.title = "Paciente"})
      : super(key: key);

  @override
  _PacientePageState createState() => _PacientePageState();
}

class _PacientePageState extends State<PacientePage> {
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
        FRouter.router.navigateTo(context, '/paciente',
            transition: TransitionType.material);
        break;
      default:
        //Navigator.pushReplacementNamed(context, '/login');
        FRouter.router
            .navigateTo(context, '/login', transition: TransitionType.material);
    }
  }

  imageB64(String base64String) {
    final UriData data = Uri.parse(base64String).data;
    print(data.isBase64); // Should print true
    return data.contentAsBytes();
  }

  liberarLeito() {
    print('Liberar Leito');
  }

  bool _lights = false;

  PacienteBloc bloc = PacienteBloc();

  @override
  void initState() {
    final id = widget.id;
    final leito = widget.leito;
    bloc.getPaciente(leito, id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder(
            initialData: 0,
            stream: bloc.pacienteOutput,
            builder: (context, snapshot) {
              return
              (snapshot.connectionState != ConnectionState.done)?
               Center(child: CircularProgressIndicator()):
               Column(
                children: [
                  Card(child: Image.asset('assets/place-holder5.jpg')),
                  Expanded(
                    child: Container(
                      color: Colors.blueGrey.shade900,
                      child: DefaultTabController(
                        length: 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: TabBar(
                                isScrollable: true,
                                tabs: [
                                  Tab(text: "Geral"),
                                  Tab(text: "Pendencias"),
                                  Tab(text: "Liberação"),
                                  Tab(text: "Notas"),
                                ],
                                labelStyle: TextStyle(fontSize: 19),
                                labelColor: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: TabBarView(children: [
                                  SingleChildScrollView(
                                    //add to Scroll whole screen
                                    child: Column(
                                      children: <Widget>[
                                        //Outras especialidades
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 2, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'Outra especialidade',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.orange),
                                            ),
                                            trailing: Switch(
                                              activeColor: Colors.orange,
                                              value: snapshot
                                                  .data.doc.outraEspecialidade,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        //CID
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 2, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'CID',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Text(
                                                snapshot.data.doc.cid.codigo),
                                            onTap: () {},
                                          ),
                                        ),
                                        //Plano
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 2, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'Plano',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing:
                                                Text(snapshot.data.doc.plano),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        //Interconsulta
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 2, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'Interconsulta',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value: snapshot
                                                  .data.doc.interconsulta,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        //Isolamento
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 2, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'Isolamento',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value:
                                                  snapshot.data.doc.isolamento,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        //HCR-ARE
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 2, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'HCE | ARE',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        //AVC
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 0, right: 2),
                                          child: ListTile(
                                            leading: Text(
                                              'PROTOCOLOS',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            title: Text(
                                              'AVC',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value: snapshot
                                                  .data.doc.protocolosAvc,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        // SEPSE
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 0, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'Sepse',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value: snapshot
                                                  .data.doc.protocolosSepse,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        // DOR TORACICA
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 2, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'Dor Torácia',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value: snapshot.data.doc
                                                  .protocolosDorToracica,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    //PENDENCIAS
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          color: Colors.blueGrey.shade900,
                                          padding: EdgeInsets.only(
                                              bottom: 8, top: 8),
                                          child: Text(
                                            'Alocação',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        //UCC
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 2, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'UCC',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            trailing: Switch(
                                              value: snapshot.data.doc.ucc,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        //INTERNACOES
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 0, right: 2),
                                          child: ListTile(
                                            leading: Text(
                                              'INTERNAÇÃO',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            title: Text(
                                              'Solicitada',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value: snapshot.data.doc
                                                  .internacaoSolicitada,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        // SEPSE
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 0, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'Prescrita',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value: snapshot
                                                  .data.doc.internacaoPrescrita,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        // DOR TORACICA
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 2, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'Aguarda Leito',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value: snapshot
                                                  .data.doc.aguardaLeito,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        //Leito Térreo
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 2, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'Leito Térreo',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value:
                                                  snapshot.data.doc.leitoTerreo,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        Container(
                                          color: Colors.blueGrey.shade900,
                                          padding: EdgeInsets.only(
                                              bottom: 8, top: 3),
                                          child: Text(
                                            'Exames / Procedimentos',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        //ECG
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 2, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'ECG',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value: snapshot.data.doc.ecg,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        //TC
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 2, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'TC',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value: snapshot.data.doc.tc,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        //RX
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 2, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'RX',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value: snapshot.data.doc.rx,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 2, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'Laboratorial',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value: snapshot
                                                  .data.doc.laboratorial,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 2, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'Liquor',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value: snapshot.data.doc.liquor,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 2, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'USG',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value: snapshot.data.doc.usg,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        Container(
                                          color: Colors.blueGrey.shade900,
                                          padding: EdgeInsets.only(
                                              bottom: 8, top: 3),
                                          child: Text(
                                            'Remoção',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 0, right: 2),
                                          child: ListTile(
                                            leading: Text(
                                              'REMOÇÃO',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            title: Text(
                                              'Solicitada',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value: snapshot
                                                  .data.doc.remocaoSolicitada,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                        // SEPSE
                                        Card(
                                          elevation: 3,
                                          color: Colors.blueGrey.shade800,
                                          margin: EdgeInsets.only(
                                              left: 2, bottom: 0, right: 2),
                                          child: ListTile(
                                            title: Text(
                                              'Encaminhada',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            trailing: Switch(
                                              value: snapshot
                                                  .data.doc.remocaoEncaminhada,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _lights = !_lights;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    //PENDENCIAS
                                    child: Column(children: <Widget>[
                                      Card(
                                        elevation: 3,
                                        color: Colors.blueGrey.shade800,
                                        margin: EdgeInsets.only(
                                            left: 2, bottom: 0, right: 2),
                                        child: ListTile(
                                          leading: Text(
                                            'ENCAMINHADO',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          title: Text(
                                            'Enfermaria',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          trailing: Switch(
                                            value: snapshot
                                                .data.doc.encaminhadoEnfermaria,
                                            onChanged: (bool value) {
                                              setState(() {
                                                _lights = value;
                                              });
                                            },
                                          ),
                                          onTap: () {
                                            setState(() {
                                              _lights = !_lights;
                                            });
                                          },
                                        ),
                                      ),
                                      Card(
                                        elevation: 3,
                                        color: Colors.blueGrey.shade800,
                                        margin: EdgeInsets.only(
                                            left: 2, bottom: 0, right: 2),
                                        child: ListTile(
                                          title: Text(
                                            'UTI',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          trailing: Switch(
                                            value: snapshot
                                                .data.doc.encaminhadoUti,
                                            onChanged: (bool value) {
                                              setState(() {
                                                _lights = value;
                                              });
                                            },
                                          ),
                                          onTap: () {
                                            setState(() {
                                              _lights = !_lights;
                                            });
                                          },
                                        ),
                                      ),
                                      Card(
                                        elevation: 3,
                                        color: Colors.blueGrey.shade800,
                                        margin: EdgeInsets.only(
                                            left: 2, bottom: 2, right: 2),
                                        child: ListTile(
                                          title: Text(
                                            'Centro Cirúrgico',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          trailing: Switch(
                                            value: snapshot.data.doc
                                                .encaminhadoCentroCirurgico,
                                            onChanged: (bool value) {
                                              setState(() {
                                                _lights = value;
                                              });
                                            },
                                          ),
                                          onTap: () {
                                            setState(() {
                                              _lights = !_lights;
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        color: Colors.blueGrey.shade900,
                                        padding:
                                            EdgeInsets.only(bottom: 2, top: 2),
                                        child: Text(
                                          '',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Card(
                                        elevation: 3,
                                        color: Colors.blueGrey.shade800,
                                        margin: EdgeInsets.only(
                                            left: 2, bottom: 0, right: 2),
                                        child: ListTile(
                                          leading: Text(
                                            'ALTA HOSPITALAR',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          title: Text(
                                            'Médica',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          trailing: Switch(
                                            value: snapshot.data.doc.altaMedica,
                                            onChanged: (bool value) {
                                              setState(() {
                                                _lights = value;
                                              });
                                            },
                                          ),
                                          onTap: () {
                                            setState(() {
                                              _lights = !_lights;
                                            });
                                          },
                                        ),
                                      ),
                                      Card(
                                        elevation: 3,
                                        color: Colors.blueGrey.shade800,
                                        margin: EdgeInsets.only(
                                            left: 2, bottom: 0, right: 2),
                                        child: ListTile(
                                          title: Text(
                                            'Revelia',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          trailing: Switch(
                                            value: snapshot.data.doc.revelia,
                                            onChanged: (bool value) {
                                              setState(() {
                                                _lights = value;
                                              });
                                            },
                                          ),
                                          onTap: () {
                                            setState(() {
                                              _lights = !_lights;
                                            });
                                          },
                                        ),
                                      ),
                                      Card(
                                        elevation: 3,
                                        color: Colors.blueGrey.shade800,
                                        margin: EdgeInsets.only(
                                            left: 2, bottom: 2, right: 2),
                                        child: ListTile(
                                          title: Text(
                                            'Óbito',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          trailing: Switch(
                                            value: snapshot.data.doc.obito,
                                            onChanged: (bool value) {
                                              setState(() {
                                                _lights = value;
                                              });
                                            },
                                          ),
                                          onTap: () {
                                            setState(() {
                                              _lights = !_lights;
                                            });
                                          },
                                        ),
                                      ),
                                      Card(
                                        elevation: 3,
                                        color: Colors.blueGrey.shade800,
                                        margin: EdgeInsets.only(
                                            left: 2, bottom: 2, right: 2),
                                        child: ListTile(
                                          title: Text(
                                            'Evasão',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          trailing: Switch(
                                            value: snapshot.data.doc.evasao,
                                            onChanged: (bool value) {
                                              setState(() {
                                                _lights = value;
                                              });
                                            },
                                          ),
                                          onTap: () {
                                            setState(() {
                                              _lights = !_lights;
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                              top: 20,
                                              bottom: 20,
                                              left: 50,
                                              right: 50),
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      18.0),
                                              side:
                                                  BorderSide(color: Colors.red),
                                            ),
                                            child: Text(
                                              'LIBERAR LEITO',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            color: Colors.deepOrange,
                                            onPressed: () => liberarLeito(),
                                          ))
                                    ]),
                                  ),
                                  Container(
                                    color: Colors.yellow.shade100,
                                    margin: EdgeInsets.all(25),
                                    child: new TextField(
                                      maxLines: null,
                                      decoration: InputDecoration(
                                          hintText: "Digite seu texto aqui",
                                          labelText: "Digite seu texto aqui",
                                          labelStyle: TextStyle(
                                              color: Colors.blueGrey)),
                                      keyboardType: TextInputType.multiline,
                                    ),
                                  ),
                                ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }));
  }
}
