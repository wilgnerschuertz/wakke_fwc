import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'src/src.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
