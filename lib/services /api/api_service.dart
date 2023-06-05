import 'package:http/http.dart' as http;
import 'package:test_task_movie/const/app_consts.dart';
import 'package:test_task_movie/model/movie_result.dart';

class ApiService {
  Future<MovieModel?> sentRequest() async {
    final client = http.Client();

    var uriResponse = await client.get(
      Uri.parse(AppStrings.apiUrl),
    );

    if (uriResponse.statusCode == 200) {
      String response = uriResponse.body;
      return movieFromJson(response);
    } else {
      throw Exception(uriResponse.statusCode);
    }
  }
}
