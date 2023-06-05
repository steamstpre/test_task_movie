import 'package:flutter/material.dart';
import 'package:test_task_movie/services%20/dependency_injection/dependency_injection.dart';

import 'services /navigation/route_generator.dart';

void main() {
  DependencyInjection dependencyInjection = DependencyInjection();
  dependencyInjection.setupBlocs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
