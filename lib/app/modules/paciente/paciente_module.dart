import 'package:cruzicc_v2/app/modules/paciente/paciente_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cruzicc_v2/app/modules/paciente/paciente_page.dart';
import 'package:flutter/material.dart';

class PacienteModule extends ModuleWidget {
  final String id;
  final String leito;
  PacienteModule(this.leito, this.id);

  @override
  List<Bloc> get blocs => [
        Bloc((i) => PacienteBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => PacientePage(this.leito, this.id);

  static Inject get to => Inject<PacienteModule>.of();
}
