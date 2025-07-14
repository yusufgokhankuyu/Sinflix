import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinflix/features/home/data/movie_model.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';
import '../../data/movie_repository.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(this.repository) : super(FavoriteInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  final MovieRepository repository;

  // Hem id set’i hem film listesi
  Set<String> _favoriteIds = {};
  List<Movie> _favoriteMovies = [];

  void _onLoadFavorites(_, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {
      _favoriteMovies = await repository.getFavorites();
      _favoriteIds = _favoriteMovies.map((e) => e.id).toSet();
      emit(FavoriteLoaded(_favoriteIds, movies: _favoriteMovies));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  void _onToggleFavorite(ToggleFavorite e, Emitter<FavoriteState> emit) async {
    try {
      await repository.toggleFavorite(e.movieId);
      if (_favoriteIds.remove(e.movieId) == false) {
        _favoriteIds.add(e.movieId);
      }
      emit(FavoriteLoaded(_favoriteIds, movies: _favoriteMovies));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
}
