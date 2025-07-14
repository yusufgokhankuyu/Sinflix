import 'package:dio/dio.dart';
import '../../home/data/movie_model.dart';

class MovieRepository {
  final Dio dio;

  MovieRepository(this.dio);

  Future<void> toggleFavorite(String movieId) async {
    await dio.post('/movie/favorite/$movieId');
  }

  Future<List<Movie>> getFavorites() async {
    final res = await dio.get('/movie/favorites');

    if (res.statusCode != 200) {
      throw Exception(
        res.data['response']?['message'] ?? 'Favoriler alınamadı',
      );
    }

    // JSON'da liste `data` anahtarında
    final list = res.data['data'] as List<dynamic>? ?? [];

    return list.map((e) => Movie.fromJson(e as Map<String, dynamic>)).toList();
  }
}
