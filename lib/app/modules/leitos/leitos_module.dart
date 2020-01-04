import 'package:cruzicc_v2/app/modules/leitos/leitos_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'leitos_page.dart';

class LeitosModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => LeitosBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => LeitosPage();

  static Inject get to => Inject<LeitosModule>.of();
}
