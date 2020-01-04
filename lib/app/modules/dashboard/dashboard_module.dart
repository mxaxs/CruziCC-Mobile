import 'package:cruzicc_v2/app/modules/dashboard/dashboard_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'dashboard_page.dart';

class DashboardModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => DashboardBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => DashboardPage();

  static Inject get to => Inject<DashboardModule>.of();
}
