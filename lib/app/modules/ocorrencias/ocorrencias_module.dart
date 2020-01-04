import 'package:cruzicc_v2/app/modules/ocorrencias/ocorrencias_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class OcorrenciasModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => OcorrenciasBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Container();

  static Inject get to => Inject<OcorrenciasModule>.of();
}
