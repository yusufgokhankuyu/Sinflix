import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sinflix/core/theme/color_scheme.dart';
import 'package:sinflix/core/theme/text_styles.dart';
import 'package:sinflix/features/home/data/movie_model.dart';
import 'package:sinflix/generated/l10n.dart';

Widget buildFavoritesSection(BuildContext context, List<Movie> favoriteMovies) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).likedMovies,
          style: AppTextStyles.title.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 4),
        favoriteMovies.isEmpty
            ? Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 180,
                    height: 180,
                    child: Lottie.asset('assets/lottie/empty_favorites.json'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    S.of(context).noResultsFound,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
            : GridView.builder(
              padding: EdgeInsets.only(top: 16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: favoriteMovies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 153 / 240,
              ),
              itemBuilder: (context, index) {
                final movie = favoriteMovies[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        movie.posterUrl.replaceFirst('http://', 'https://'),

                        width: 153,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (_, __, ___) => Container(
                              width: 153,
                              height: 200,
                              color: Colors.grey[800],
                              child: const Icon(
                                Icons.movie,
                                color: Colors.white54,
                                size: 40,
                              ),
                            ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 153,
                      child: Text(
                        movie.title,
                        style: AppTextStyles.title.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: 153,
                      child: Text(
                        movie.director ?? '',
                        style: AppTextStyles.profileID.copyWith(
                          color: AppColors.text50,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                );
              },
            ),
      ],
    ),
  );
}
