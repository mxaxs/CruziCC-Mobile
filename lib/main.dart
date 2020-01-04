import 'package:flutter/material.dart';
import 'package:cruzicc_v2/app/app_module.dart';

import 'app/router.dart';

void main() {
  FRouter.setupRouter();
  runApp(AppModule());
}
