abstract class FavoriteEvent {}

class ToggleFavorite extends FavoriteEvent {
  final String movieId;

  ToggleFavorite(this.movieId);
}

class LoadFavorites extends FavoriteEvent {}
