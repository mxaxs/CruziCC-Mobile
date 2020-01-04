import 'package:cruzicc_v2/app/modules/plano/plano_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class PlanoModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PlanoBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Container();

  static Inject get to => Inject<PlanoModule>.of();
}
