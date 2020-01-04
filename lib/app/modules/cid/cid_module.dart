import 'package:cruzicc_v2/app/modules/cid/cid_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class CidModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => CidBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Container();

  static Inject get to => Inject<CidModule>.of();
}
