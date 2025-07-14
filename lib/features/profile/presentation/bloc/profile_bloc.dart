import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinflix/features/home/data/movie_model.dart';
import 'package:sinflix/features/movie/data/movie_repository.dart';
import 'profile_event.dart';
import 'profile_state.dart';
import '../../data/user_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository repository;
  final MovieRepository movieRepository;

  ProfileBloc(this.repository, this.movieRepository) : super(ProfileInitial()) {
    on<LoadUserProfile>(_onLoad);
    on<UploadUserPhoto>(_onUpload);
  }

  Future<void> _onLoad(
    LoadUserProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final user = await repository.getProfile();
      final favorites = await movieRepository.getFavorites();
      emit(ProfileLoaded(user, favorites));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> _onUpload(
    UploadUserPhoto event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading()); // isteğe bağlı: loading göstergesi
    try {
      // 1️⃣ Fotoğraf yüklenir, backend yeni kullanıcı datası döner
      final updatedUser = await repository.uploadPhoto(event.file);

      // 2️⃣ Favoriler değişmedi, mevcut state’ten al veya yeniden çek
      List<Movie> favorites = [];
      if (state is ProfileLoaded) {
        favorites = (state as ProfileLoaded).favoriteMovies;
      } else {
        favorites = await movieRepository.getFavorites();
      }

      // 3️⃣ Güncellenmiş kullanıcıyla yeni state emit
      emit(ProfileLoaded(updatedUser, favorites));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
