import 'package:flutter/material.dart';
import 'package:test_task_movie/model/movie_result.dart';
import 'package:test_task_movie/presentation/about_screen/screen/about_screen.dart';
import 'package:test_task_movie/presentation/main_screen/screen/main_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => MainScreen());
      case '/detail_screen':
        return MaterialPageRoute(
          builder: (context) => AboutScreen(
            model: args as MovieResult,
          ),
        );
      case '/favorite_screen':
        return MaterialPageRoute(
          builder: (context) => AboutScreen(
            model: args as MovieResult,
          ),
        );
      default:
        return _defaultRoute();
    }
  }

  static Route<dynamic> _defaultRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text('Error'),
          ),
        );
      },
    );
  }
}
