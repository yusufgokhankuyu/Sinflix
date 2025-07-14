import '../../data/movie_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  HomeLoaded(this.movies, {required this.hasMore});
  final List<Movie> movies;
  final bool hasMore;
}

class HomeError extends HomeState {
  HomeError(this.message);
  final String message;
}
