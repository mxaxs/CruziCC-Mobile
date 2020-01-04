import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'modules/login/login_page.dart';
import 'modules/ocorrencias/ocorrencias_module.dart';
import 'modules/dashboard/dashboard_module.dart';
import 'modules/leitos/leitos_module.dart';
import 'modules/paciente/paciente_module.dart';
import 'modules/perfil/perfil_module.dart';

class FRouter {
  static Router router = Router();

  static Handler _loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
        LoginPage(),
  );

  static Handler _leitosHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
        LeitosModule(),
  );
  static Handler _pacienteHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    var id = params['id'][0];
    var leito = params['leito'][0];
    return PacienteModule(leito, id);
  });

  static Handler _dashHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
        DashboardModule(),
  );
  static Handler _setupHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
        PerfilModule(),
  );
  static Handler _ocorrenciasHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
        OcorrenciasModule(),
  );

  static void setupRouter() {
    router.define(
      '/login',
      handler: _loginHandler,
    );
    router.define(
      '/dash',
      handler: _dashHandler,
    );
    router.define(
      '/leitos',
      handler: _leitosHandler,
    );
    router.define(
      'paciente/:leito/:id',
      handler: _pacienteHandler,
    );
    router.define(
      '/setup',
      handler: _setupHandler,
    );
    router.define(
      '/ocorrencias',
      handler: _ocorrenciasHandler,
    );
  }
}
