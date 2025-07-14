import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinflix/features/movie/presentation/bloc/favorite_bloc.dart';
import 'package:sinflix/features/movie/presentation/bloc/favorite_event.dart';
import 'package:sinflix/features/movie/presentation/bloc/favorite_state.dart';

class FavoriteButton extends StatelessWidget {
  final String movieId;

  const FavoriteButton({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        bool isFavorite = false;
        if (state is FavoriteLoaded) {
          isFavorite = state.favoriteIds.contains(movieId);
        }

        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
            size: 24,
          ),
          onPressed: () {
            context.read<FavoriteBloc>().add(ToggleFavorite(movieId));
          },
        );
      },
    );
  }
}
