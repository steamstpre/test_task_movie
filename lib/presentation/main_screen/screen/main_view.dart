import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_movie/model/movie_result.dart';
import 'package:test_task_movie/presentation/main_screen/bloc/main_screen_bloc.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (context, state) {
        if (state is LoadedDataState) {
          return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final item = state.data[index];
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    MovieResult item = state.results[index];
                    Navigator.of(context)
                        .pushNamed('/detail_screen', arguments: item);
                  },
                );
              });
        }
        if (state is LoadedFavoriteState) {
          return ListView.builder(
              itemCount: state.favoriteMovies.length,
              itemBuilder: (context, index) {
                final item = state.favoriteMovies[index];
                return ListTile(
                  title: Row(
                    children: [
                      Text(item.title),
                      const Spacer(),
                      GestureDetector(
                          onTap: () => GetIt.instance<MainScreenBloc>()
                            ..add(
                              RemoveFavoriteEvent(
                                state.favoriteMovies[index],
                              ),
                            )
                            ..add(GetFavoriteEvent()),
                          child: const Icon(Icons.cancel_outlined)),
                    ],
                  ),
                  onTap: () {
                    MovieResult item = state.favoriteMovies[index];
                    Navigator.of(context)
                        .pushNamed('/detail_screen', arguments: item);
                  },
                );
              });
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
