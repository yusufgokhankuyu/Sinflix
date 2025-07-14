// ignore_for_file: unused_element

import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../../data/home_repository.dart';
import '../../data/movie_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.repository) : super(HomeInitial()) {
    on<FetchMovies>(_onFetchMovies);
    on<RefreshMovies>(_onRefreshMovies);
  }

  final HomeRepository repository;

  int _page = 1;
  final List<Movie> allMovies = [];

  bool _isLoading(HomeState state) => state is HomeLoading;

  bool _isFetching = false;

  bool get isFetching => _isFetching;

  Future<void> _onFetchMovies(
    FetchMovies event,
    Emitter<HomeState> emit,
  ) async {
    if (_isFetching) return;
    _isFetching = true;
    emit(HomeLoading());

    try {
      final resp = await repository.fetchMovies(page: _page);
      allMovies.addAll(resp.movies);
      final hasMore = _page < resp.pagination.maxPage;
      _page++;
      emit(HomeLoaded(List<Movie>.from(allMovies), hasMore: hasMore));
    } catch (e) {
      emit(HomeError(e.toString()));
    } finally {
      _isFetching = false;
    }
  }

  Future<void> _onRefreshMovies(
    RefreshMovies event,
    Emitter<HomeState> emit,
  ) async {
    if (_isFetching) return;

    _isFetching = true;
    emit(HomeLoading());

    try {
      _page = 1;
      allMovies.clear();

      final resp = await repository.fetchMovies(page: _page);
      allMovies.addAll(resp.movies);

      final hasMore = _page < resp.pagination.maxPage;
      _page++;

      emit(HomeLoaded(List.from(allMovies), hasMore: hasMore));
    } catch (e) {
      emit(HomeError(e.toString()));
    } finally {
      _isFetching = false;
    }
  }
}
