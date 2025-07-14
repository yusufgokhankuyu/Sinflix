// ignore_for_file: unnecessary_type_check
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinflix/core/network/dio_client.dart';
import 'package:sinflix/core/services/token_service.dart';
import 'package:sinflix/core/theme/text_styles.dart';
import 'package:sinflix/features/home/data/home_repository.dart';
import 'package:sinflix/features/home/presentation/bloc/home_bloc.dart';
import 'package:sinflix/features/home/presentation/bloc/home_event.dart';
import 'package:sinflix/features/home/presentation/bloc/home_state.dart';
import 'package:sinflix/features/home/presentation/widgets/loading.dart';
import 'package:sinflix/features/movie/data/movie_repository.dart';
import 'package:sinflix/features/movie/presentation/bloc/favorite_bloc.dart';
import 'package:sinflix/features/movie/presentation/bloc/favorite_event.dart';
import 'package:sinflix/features/movie/presentation/bloc/favorite_state.dart';
import 'package:sinflix/features/movie/presentation/widgets/favorite_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tokenService = TokenService();
    final dioClient = DioClient(tokenService);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) =>
                  HomeBloc(HomeRepository(dioClient.dio))..add(FetchMovies()),
        ),
        BlocProvider(
          create:
              (_) =>
                  FavoriteBloc(MovieRepository(dioClient.dio))
                    ..add(LoadFavorites()),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeLoading) {
              return loading_indicator();
            }

            if (state is HomeLoaded) {
              return RefreshIndicator(
                onRefresh:
                    () async => context.read<HomeBloc>().add(RefreshMovies()),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    final bloc = context.read<HomeBloc>();
                    if (state is HomeLoaded &&
                        state.hasMore &&
                        scrollInfo.metrics.pixels >=
                            scrollInfo.metrics.maxScrollExtent - 200) {
                      bloc.add(FetchMovies());
                    }
                    return false;
                  },
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.movies.length + (state.hasMore ? 1 : 0),
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (index < state.movies.length) {
                        final movie = state.movies[index];
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                              imageUrl: movie.posterUrl.replaceFirst(
                                'http://',
                                'https://',
                              ),
                              fit: BoxFit.cover,
                              placeholder:
                                  (context, url) => Container(
                                    color: Colors.grey[900],
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.redAccent,
                                            ),
                                        strokeWidth: 3,
                                      ),
                                    ),
                                  ),
                              errorWidget:
                                  (context, url, error) => Container(
                                    color: Colors.grey[900],
                                    child: const Icon(
                                      Icons.broken_image,
                                      color: Colors.white,
                                    ),
                                  ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black87],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 220,
                              right: 24,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 12,
                                    sigmaY: 12,
                                  ),
                                  child: Container(
                                    width: 50,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.2),
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: BlocBuilder<
                                        FavoriteBloc,
                                        FavoriteState
                                      >(
                                        builder: (context, favState) {
                                          return FavoriteButton(
                                            movieId: movie.id,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      movie.title,
                                      style: AppTextStyles.homeMovieTitle,
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      movie.plot ?? 'No description available',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.homeMoviePlot,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                    },
                  ),
                ),
              );
            }
            if (state is HomeError) {
              return Center(
                child: Text(
                  'Hata: ${state.message}',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
