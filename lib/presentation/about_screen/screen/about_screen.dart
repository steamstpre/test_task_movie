import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_movie/const/app_consts.dart';
import 'package:test_task_movie/model/movie_result.dart';
import 'package:test_task_movie/presentation/main_screen/bloc/main_screen_bloc.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key, required this.model}) : super(key: key);

  final MovieResult model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.aboutScreen),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              model.title,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              model.overview,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoButton.filled(
            onPressed: () => GetIt.instance<MainScreenBloc>()
              ..add(AddToFavoriteEvent(model))
              ..add(
                GetDataEvent(),
              ),
            child: const Text(AppStrings.addToFavorite),
          ),
        ),
      ),
    );
  }
}
