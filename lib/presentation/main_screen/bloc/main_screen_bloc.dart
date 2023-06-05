import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:test_task_movie/model/movie_result.dart';
import 'package:test_task_movie/services%20/api/API.dart';
import 'package:test_task_movie/services%20/repository/repository.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

final _repository = GetIt.instance<Repository>();
MovieModel? _data;

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenInitial()) {
    on<GetDataEvent>(_getDataFromApi);
    on<GetFavoriteEvent>(_getFavoriteMovie);
    on<AddToFavoriteEvent>(_addFavoriteMovie);
    on<RemoveFavoriteEvent>(_removeFavoriteMovie);
  }

  Future<void> _getDataFromApi(GetDataEvent event, emit) async {
    final API api = API();
    if (_data == null) {
      emit(LoadingDataState());
      _data = await api.sentRequest();
    }
    await _repository.getFavoriteMovie();
    if (_data != null) {
      _repository.data = _data;
      emit(
        LoadedDataState(
          _repository.data!.results,
          _repository.favoriteMovie.toList(),
        ),
      );
    }
  }

  Future<void> _getFavoriteMovie(event, emit) async {
    await _repository.getFavoriteMovie();
    emit(LoadingDataState());
    emit(LoadedFavoriteState(
      _repository.favoriteMovie.toList(),
    ));
  }

  Future<void> _addFavoriteMovie(AddToFavoriteEvent event, emit) async {
    _repository.favoriteMovie.add(event.model);
    await _repository.saveFavoriteMovie();
  }

  Future<void> _removeFavoriteMovie(RemoveFavoriteEvent event, emit) async {
    _repository.favoriteMovie.remove(event.model);
    await _repository.saveFavoriteMovie();
  }
}
