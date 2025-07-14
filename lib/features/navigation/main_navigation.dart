import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinflix/core/network/dio_client.dart';
import 'package:sinflix/core/services/token_service.dart';
import 'package:sinflix/core/theme/color_scheme.dart';
import 'package:sinflix/features/home/data/home_repository.dart';
import 'package:sinflix/features/home/presentation/bloc/home_bloc.dart';
import 'package:sinflix/features/home/presentation/bloc/home_event.dart';
import 'package:sinflix/features/home/presentation/pages/home_screen.dart';
import 'package:sinflix/features/movie/data/movie_repository.dart';
import 'package:sinflix/features/movie/presentation/bloc/favorite_bloc.dart';
import 'package:sinflix/features/movie/presentation/bloc/favorite_event.dart';
import 'package:sinflix/features/profile/data/user_repository.dart';
import 'package:sinflix/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:sinflix/features/profile/presentation/bloc/profile_event.dart';
import 'package:sinflix/features/profile/presentation/pages/profile_screen.dart';
import 'package:sinflix/generated/l10n.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final _screens = <Widget>[];

  @override
  void initState() {
    super.initState();

    _screens.addAll([
      const HomeScreen(),
      ProfileScreen(onBackToHome: () => _onTap(0)),
    ]);
  }

  void _onTap(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) =>
                  HomeBloc(HomeRepository(DioClient(TokenService()).dio))
                    ..add(FetchMovies()),
        ),
        BlocProvider(
          create:
              (_) =>
                  FavoriteBloc(MovieRepository(DioClient(TokenService()).dio))
                    ..add(LoadFavorites()),
        ),
        BlocProvider(
          create:
              (_) => ProfileBloc(
                UserRepository(DioClient(TokenService()).dio),
                MovieRepository(DioClient(TokenService()).dio),
              )..add(LoadUserProfile()),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _screens[_selectedIndex],
        bottomNavigationBar: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _CustomNavButton(
                icon: Icons.home,
                label: S.of(context).home,
                selected: _selectedIndex == 0,
                onTap: () => _onTap(0),
              ),
              const SizedBox(width: 16),

              _CustomNavButton(
                icon: Icons.person,
                label: S.of(context).profile,
                selected: _selectedIndex == 1,
                onTap: () => _onTap(1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomNavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _CustomNavButton({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white.withOpacity(0.1) : Colors.transparent,
          border: Border.all(color: AppColors.text20, width: 0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
