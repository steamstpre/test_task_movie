import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_movie/const/app_consts.dart';
import 'package:test_task_movie/presentation/main_screen/bloc/main_screen_bloc.dart';
import 'package:test_task_movie/presentation/main_screen/screen/main_view.dart';

enum MainScreens {
  mainScreen,
  favoriteScreen,
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreens _currentScreen = MainScreens.mainScreen;

  bool _handlePop() {
    if (_currentScreen == MainScreens.mainScreen) {
      return true;
    } else {
      setState(() {
        _currentScreen = MainScreens.mainScreen;
        GetIt.instance<MainScreenBloc>().add(GetDataEvent());
      });
      return false;
    }
  }

  void _navigateToFavoriteScreen() {
    setState(() {
      if (_currentScreen == MainScreens.mainScreen) {
        _currentScreen = MainScreens.favoriteScreen;
        GetIt.instance<MainScreenBloc>().add(GetFavoriteEvent());
      } else {
        _currentScreen = MainScreens.mainScreen;
        GetIt.instance<MainScreenBloc>().add(GetDataEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance<MainScreenBloc>()..add(GetDataEvent()),
      child: WillPopScope(
        onWillPop: () async => _handlePop(),
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                _currentScreen == MainScreens.mainScreen
                    ? AppStrings.mainScreen
                    : AppStrings.favoriteScreen,
              ),
              leading: GestureDetector(
                onTap: () => _navigateToFavoriteScreen(),
                child: const Icon(
                  Icons.star_border,
                ),
              ),
            ),
            body: const MainScreenView()),
      ),
    );
  }
}
