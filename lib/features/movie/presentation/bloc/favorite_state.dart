import 'package:sinflix/features/home/data/movie_model.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  FavoriteLoaded(this.favoriteIds, {required this.movies});
  final Set<String> favoriteIds;
  final List<Movie> movies;
}

class FavoriteError extends FavoriteState {
  final String error;

  FavoriteError(this.error);
}
