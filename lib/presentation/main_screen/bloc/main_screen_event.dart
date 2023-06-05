part of '../../main_screen/bloc/main_screen_bloc.dart';

abstract class MainScreenEvent {}

class GetDataEvent extends MainScreenEvent {}

class GetFavoriteEvent extends MainScreenEvent {}

class AddToFavoriteEvent extends MainScreenEvent {
  final MovieResult model;

  AddToFavoriteEvent(this.model);
}

class RemoveFavoriteEvent extends MainScreenEvent {
  final MovieResult model;

  RemoveFavoriteEvent(this.model);
}
