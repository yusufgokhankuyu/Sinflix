import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/register_request.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../data/auth_repository.dart';
import '../../data/models/login_request.dart';
import '../../../../core/services/token_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  final TokenService tokenService;

  AuthBloc(this.repository, this.tokenService) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final response = await repository.login(
        LoginRequest(email: event.email, password: event.password),
      );
      await tokenService.saveToken(response.data.token);
      await tokenService.saveUserId(response.data.id);
      await tokenService.saveUserName(response.data.name);
      await tokenService.saveUserPhoto(response.data.photoUrl);

      emit(AuthSuccess());
    } on DioException catch (e) {
      // e.response içindeki API cevabını kontrol et
      final errorMessage =
          e.response?.data?['response']?['message'] ?? 'Bilinmeyen hata';
      emit(AuthFailure("Giriş başarısız: $errorMessage"));
    } catch (e) {
      // Diğer hatalar için genel catch
      emit(AuthFailure("Giriş başarısız: ${e.toString()}"));
    }
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final response = await repository.register(
        RegisterRequest(
          email: event.email,
          name: event.name,
          password: event.password,
        ),
      );
      await tokenService.saveToken(response.data.token);

      // Print user info on successful registration
      print('Kayıt başarılı! Kullanıcı bilgileri:');
      print('ID: ${response.data.id}');
      print('Name: ${response.data.name}');
      print('Email: ${response.data.email}');
      print('Photo URL: ${response.data.photoUrl}');
      print('Token: ${response.data.token}');
      print('Token: ${response.response.code}');
      print('Message: ${response.response.message}');

      emit(AuthSuccess());
    } catch (e) {
      print('Kayıt başarısız: ${e.toString()}');
      emit(AuthFailure("Kayıt başarısız: ${e.toString()}"));
    }
  }
}
