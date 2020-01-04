import 'package:cruzicc_v2/app/modules/plantao/plantao_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class PlantaoModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PlantaoBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Container();

  static Inject get to => Inject<PlantaoModule>.of();
}
