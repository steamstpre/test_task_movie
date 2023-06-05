import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task_movie/model/movie_result.dart';
import 'package:test_task_movie/services%20/api/API.dart';
import 'package:test_task_movie/services%20/repository/repository.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MovieModel? _data;
  final List<String> _result = [];
  final API _api = API();
  final Repository _repository = Repository();

  MainScreenBloc() : super(MainScreenInitial()) {
    on<GetDataEvent>(_getDataFromApi);
    on<GetFavoriteEvent>(_getFavoriteMovie);
    on<AddToFavoriteEvent>(_addFavoriteMovie);
    on<RemoveFavoriteEvent>(_removeFavoriteMovie);
  }

  Future<void> _getDataFromApi(GetDataEvent event, emit) async {
    emit(LoadingDataState());
    _data = await _api.sentRequest();
    if (_data != null) {
      _repository.data = _data;
    }
    if (_data != null) {
      _data?.results.forEach(
        (element) {
          _result.add(element.title);
        },
      );
      emit(
        LoadedDataState(
          _result,
          _repository.data!.results,
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
