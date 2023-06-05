import 'package:get_it/get_it.dart';
import 'package:test_task_movie/presentation/main_screen/bloc/main_screen_bloc.dart';
import 'package:test_task_movie/services%20/repository/repository.dart';

class DependencyInjection {
  final MainScreenBloc _mainScreenBloc = MainScreenBloc();
  final Repository _repository = Repository();

  void setupBlocs() {
    GetIt.instance.registerSingleton(_mainScreenBloc);
    GetIt.instance.registerSingleton(_repository);
  }
}
