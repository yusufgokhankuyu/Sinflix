import 'package:sinflix/core/network/api_response.dart';

class Movie {
  final String id;
  final String title;
  final String posterUrl;
  final String? plot;
  final String? director;
  final bool isFavorite;

  Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    this.plot,
    this.director,
    required this.isFavorite,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json['_id'] ?? json['id'] ?? '',
    title: json['Title'] ?? '',
    posterUrl: json['Poster'] ?? '',
    plot: json['Plot'],
    director: json['Director'],
    isFavorite: json['isFavorite'] ?? false,
  );
}

class MovieListResponse {
  final ApiResponse response;
  final List<Movie> movies;
  final Pagination pagination;

  MovieListResponse({
    required this.response,
    required this.movies,
    required this.pagination,
  });

  factory MovieListResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return MovieListResponse(
      response: ApiResponse.fromJson(json['response'] ?? {}),
      movies:
          (data['movies'] as List<dynamic>? ?? [])
              .map((e) => Movie.fromJson(e))
              .toList(),
      pagination: Pagination.fromJson(data['pagination'] ?? {}),
    );
  }
}
