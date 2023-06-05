part of '../../main_screen/bloc/main_screen_bloc.dart';

abstract class MainScreenState {}

class MainScreenInitial extends MainScreenState {}

class LoadingDataState extends MainScreenState {}

class LoadedDataState extends MainScreenState {
  final List<MovieResult> results;
  final List<MovieResult> favoriteMovies;

  LoadedDataState(
    this.results,
    this.favoriteMovies,
  );

  bool checkFavoriteStatus(int index) {
    if (favoriteMovies.contains(results[index])) {
      return true;
    }

    return false;
  }
}

class LoadedFavoriteState extends MainScreenState {
  final List<MovieResult> favoriteMovies;

  LoadedFavoriteState(this.favoriteMovies);
}
