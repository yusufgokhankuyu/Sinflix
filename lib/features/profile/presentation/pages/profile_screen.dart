import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinflix/features/home/presentation/widgets/loading.dart';
import 'package:sinflix/features/profile/presentation/widgets/build_favorites_section.dart';
import 'package:sinflix/features/profile/presentation/widgets/build_header.dart';
import 'package:sinflix/features/profile/presentation/widgets/build_profile_section.dart';
import 'package:sinflix/generated/l10n.dart';

import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';

class ProfileScreen extends StatefulWidget {
  final VoidCallback onBackToHome;
  const ProfileScreen({super.key, required this.onBackToHome});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(LoadUserProfile());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return loading_indicator();
        } else if (state is ProfileLoaded) {
          final user = state.user;
          final favoriteMovies = state.favoriteMovies;

          return Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight - 20),
            child: Scaffold(
              backgroundColor: Colors.black,

              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeader(
                      context,
                      user.name,
                      user.id,
                      widget.onBackToHome,
                    ),
                    buildProfileSection(
                      context,
                      user.name,
                      user.email,
                      user.id,
                      user.photoUrl,
                    ),
                    buildFavoritesSection(context, favoriteMovies),
                  ],
                ),
              ),
            ),
          );
        } else if (state is ProfileError) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Text(
                "${S.of(context).error}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
        return const Scaffold(
          backgroundColor: Colors.black,
          body: SizedBox.shrink(),
        );
      },
    );
  }
}
