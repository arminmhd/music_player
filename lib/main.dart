import 'package:flutter/material.dart';
import 'package:my_player/app/app.dart';
import 'package:my_player/app/di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const App());
}
