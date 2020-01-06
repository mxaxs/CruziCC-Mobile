import 'package:bloc_pattern/bloc_pattern.dart';
import '../../models/paciente.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class PacienteBloc extends BlocBase {
  PacienteModel _paciente;

  final BehaviorSubject _pacienteController$ = BehaviorSubject();
  Sink get pacienteInput => _pacienteController$.sink;
  Stream get pacienteOutput =>
      _pacienteController$.stream.asyncMap((data) => _paciente);

  void getPaciente(xleito, xid) {
    var data = {'leito': xleito, 'id': xid};
    pacienteInput.add(data);
  }

  PacienteModel get gPaciente => _paciente;

  Future loadPaciente(data) async {
    final leito = data["leito"]; //'02';
    final id = data["id"]; //'5ded72080b6d1c046eb9d7a7';
    var url = 'https://api-rest.in/api/paciente/$leito/$id';
    var dio = Dio();

    try {
      Response response = await dio.get(url);
      _paciente = PacienteModel.fromJson(response.data);
      //_leitos = response.data["0"]["leitos"];
      print('api on pacienteBlock - ' + DateTime.now().toString());
      return _paciente;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        return e.response.data;
        //print(e.response.headers);
        //print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        //print(e.request);
        return e.message;
      }
    }
  }

  void updatePaciente(paciente) {
    _paciente = paciente;
    pacienteInput.add(true);
  }

  @override
  void dispose() {
    _pacienteController$.close();
    super.dispose();
  }
}
