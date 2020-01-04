import 'package:cruzicc_v2/app/modules/perfil/perfil_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class PerfilModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PerfilBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Container();

  static Inject get to => Inject<PerfilModule>.of();
}
