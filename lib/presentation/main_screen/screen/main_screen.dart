import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_movie/presentation/main_screen/bloc/main_screen_bloc.dart';
import 'package:test_task_movie/presentation/main_screen/screen/main_view.dart';

enum MainScreens {
  mainScreen,
  favoriteScreen,
}

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreens _currentScreen = MainScreens.mainScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _currentScreen == MainScreens.mainScreen
                ? 'Main Screen'
                : 'Favorite films',
          ),
          leading: GestureDetector(
            onTap: () {
              setState(() {
                if (_currentScreen == MainScreens.mainScreen) {
                  _currentScreen = MainScreens.favoriteScreen;
                  GetIt.instance<MainScreenBloc>().add(GetFavoriteEvent());
                } else {
                  _currentScreen = MainScreens.mainScreen;
                  GetIt.instance<MainScreenBloc>().add(GetDataEvent());
                }
              });
            },
            child: const Icon(
              Icons.star_border,
            ),
          ),
        ),
        body: const MainScreenView());
  }
}
