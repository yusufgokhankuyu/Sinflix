import 'package:flutter/material.dart';
import 'package:sinflix/core/services/token_service.dart';

class AuthNotifier extends ChangeNotifier {
  final TokenService _tokenService;
  bool _isLoggedIn = false;
  bool _isLoading = true;

  AuthNotifier(this._tokenService) {
    _checkAuthStatus();
  }

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  Future<void> _checkAuthStatus() async {
    _isLoggedIn = await _tokenService.hasToken();
    _isLoading = false;
    notifyListeners();
  }

  void logIn() {
    _isLoggedIn = true;
    _isLoading = false;
    notifyListeners();
  }

  void logOut() {
    _isLoggedIn = false;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    await _checkAuthStatus();
  }
}
