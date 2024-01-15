import 'package:animehub/app.dart';
import 'package:animehub/initializer.dart';
import 'package:flutter/material.dart';

import 'routes/app_pages.dart';

Future<void> main() async {
  await Initializer.init();

  final String initialRoute = await Routes.INITIAL;

  runApp(App(initialRoute: initialRoute));
}
