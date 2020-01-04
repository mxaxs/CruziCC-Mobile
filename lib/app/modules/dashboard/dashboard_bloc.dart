import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cruzicc_v2/app/models/score.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class DashboardBloc extends BlocBase {
  ScoreModel score = ScoreModel();
  double level = 0;

  final BehaviorSubject _dashController$ = BehaviorSubject();
  Sink get dashInput => _dashController$.sink;
  Stream<ScoreModel> get dashOutput =>
      _dashController$.stream.asyncMap((_) => loadScore());

  void loadDash() {
    dashInput.add(true);
  }

  Future<ScoreModel> loadScore() async {
    var protocolos = 'https://api-rest.in/api/dashboard/protocolos';
    var internacoes = 'https://api-rest.in/api/dashboard/internacoes';
    var remocoes = 'https://api-rest.in/api/dashboard/remocoes';
    var ocupados = 'https://api-rest.in/api/leitos/dashboard-leitos-fl';

    var dio = Dio();
    level = 0;
    try {
      var response = await Future.wait([
        dio.get(protocolos),
        dio.get(internacoes),
        dio.get(remocoes),
        dio.get(ocupados)
      ]);

      var _count = response[3].data['count'];
      var _perc = ((_count / 12) * 100).round();

      ScoreModel ret = ScoreModel(
          protocolos: response[0].data['count'],
          internacoes: response[1].data['count'],
          remocoes: response[2].data['count'],
          ocupados: _count,
          perc: _perc);

      level = 1;
      print('api on dashboardBlock - ' + DateTime.now().toString());
      return ret;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        return null;
      } else {
        print(e.request);
        return null;
      }
    }
  }

  //dispose will be called automatically by closing its streams

  @override
  void dispose() {
    _dashController$.close();
    super.dispose();
  }
}
