import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:sinflix/core/services/locale_service.dart';
import 'package:sinflix/core/services/token_service.dart';
import 'package:sinflix/core/theme/app_theme.dart';
import 'package:sinflix/features/auth/presentation/pages/login_screen.dart';
import 'package:sinflix/features/auth/presentation/pages/register_screen.dart';
import 'package:sinflix/features/navigation/main_navigation.dart';
import 'package:sinflix/features/splash/splash_screen.dart';
import 'package:sinflix/generated/l10n.dart';

final _router = GoRouter(
  initialLocation: '/splash',
  redirect: (context, state) async {
    final isLoggedIn = await TokenService().hasToken();

    if (!isLoggedIn &&
        state.uri.toString() != '/splash' &&
        state.uri.toString() != '/login' &&
        state.uri.toString() != '/register') {
      return '/splash';
    }

    if (isLoggedIn &&
        (state.uri.toString() == '/splash' ||
            state.uri.toString() == '/login' ||
            state.uri.toString() == '/register')) {
      return '/home';
    }

    return null;
  },
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(path: '/home', builder: (context, state) => const MainNavigation()),
  ],
);

class SinflixApp extends StatelessWidget {
  const SinflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return MaterialApp.router(
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: state.locale,
          routerConfig: _router,
          title: 'SINFLIX',

          theme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
