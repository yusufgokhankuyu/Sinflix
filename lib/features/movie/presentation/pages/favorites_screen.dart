import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinflix/features/movie/presentation/bloc/favorite_bloc.dart';
import 'package:sinflix/features/movie/presentation/bloc/favorite_event.dart';
import 'package:sinflix/features/movie/presentation/bloc/favorite_state.dart';
import 'package:sinflix/features/movie/presentation/widgets/favorite_button.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(LoadFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favori Filmler')),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoriteLoaded) {
            if (state.movies.isEmpty) {
              return const Center(child: Text('Henüz favoriniz yok.'));
            }

            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return ListTile(
                  leading: Image.network(
                    movie.posterUrl.replaceFirst('http://', 'https://'),
                    width: 50,
                  ),
                  title: Text(movie.title),
                  trailing: FavoriteButton(movieId: movie.id),
                );
              },
            );
          } else if (state is FavoriteError) {
            return Center(child: Text("Hata: ${state.error}"));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
