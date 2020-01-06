import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cruzicc_v2/app/models/leitos.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class LeitosBloc extends BlocBase {
  final BehaviorSubject _leitosController$ = BehaviorSubject();
  Sink get leitosInput => _leitosController$.sink;
  Stream get leitosOutput =>
      _leitosController$.stream.asyncMap((_) => loadLeitos());

  Future loadLeitos() async {
    var url = 'https://api-rest.in/api/leitos/ocupados';
    var dio = Dio();

    try {
      Response response = await dio.get(url);

      final _leitos = LeitosModel.fromJson(response.data);

      //_leitos = response.data["0"]["leitos"];
      print('api on leitosBlock - ' + DateTime.now().toString());
      return _leitos;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
  }

  void getLeitos() {
    leitosInput.add(true);
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _leitosController$.close();
    super.dispose();
  }
}
