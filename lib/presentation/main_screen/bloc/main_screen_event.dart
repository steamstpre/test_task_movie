part of '../../main_screen/bloc/main_screen_bloc.dart';

@immutable
abstract class MainScreenEvent {}

class GetDataEvent extends MainScreenEvent {}

class GetFavoriteEvent extends MainScreenEvent {}

class AddToFavoriteEvent extends MainScreenEvent {
  MovieResult model;

  AddToFavoriteEvent(this.model);
}

class RemoveFavoriteEvent extends MainScreenEvent {
  MovieResult model;

  RemoveFavoriteEvent(this.model);
}
