import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sinflix/core/services/token_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TokenService _tokenService = TokenService();

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    final hasToken = await _tokenService.hasToken();

    await Future.delayed(const Duration(seconds: 2));
    if (hasToken) {
      context.go('/home');
    } else {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset('assets/logo/SinFlixSplash.png', fit: BoxFit.cover),
      ),
    );
  }
}
