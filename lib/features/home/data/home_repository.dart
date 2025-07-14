import 'package:dio/dio.dart';
import 'movie_model.dart';

class HomeRepository {
  HomeRepository(this._dio);

  final Dio _dio;

  Future<MovieListResponse> fetchMovies({int page = 1, int limit = 5}) async {
    final res = await _dio.get(
      '/movie/list',
      queryParameters: {'page': page, 'limit': limit},
    );

    if (res.statusCode != 200) {
      throw Exception(
        res.data['response']?['message'] ?? 'Film listesi alınamadı',
      );
    }
    return MovieListResponse.fromJson(res.data);
  }
}
