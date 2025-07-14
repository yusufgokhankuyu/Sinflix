import 'package:sinflix/features/home/data/movie_model.dart';

import '../../data/user_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserModel user;
  final List<Movie> favoriteMovies;

  ProfileLoaded(this.user, this.favoriteMovies);
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
