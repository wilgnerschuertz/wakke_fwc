import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'src/src.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Text('This is initial page'),
      ),
    );
  }
}
