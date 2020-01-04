import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';

class AppBloc extends BlocBase {
  String id;
  String leito;

  //dispose will be called automatically by closing its streams
  BehaviorSubject _appController$ = BehaviorSubject();
  Sink get appInput => _appController$.sink;
  Stream get appOutput => _appController$.stream;

  String get getId => this.id;
  String get getLeito => this.leito;

  void setPacienteAtivo(leito, id) {
    this.id = id;
    this.leito = leito;
    //appInput.add(true);
  }

  @override
  void dispose() {
    _appController$.close();
    super.dispose();
  }
}
