import 'package:dio/dio.dart';
import 'package:sinflix/features/auth/data/models/register_request.dart';
import 'package:sinflix/features/auth/data/models/register_response.dart';
import '../data/models/login_request.dart';
import '../data/models/login_response.dart';

class AuthRepository {
  final Dio dio;

  AuthRepository(this.dio);

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await dio.post('/user/login', data: request.toJson());

    if (response.statusCode != 200) {
      throw Exception(
        response.data['response']?['message'] ?? 'Bilinmeyen hata',
      );
    }

    return LoginResponse.fromJson(response.data);
  }

  Future<RegisterResponse> register(RegisterRequest request) async {
    final response = await dio.post('/user/register', data: request.toJson());
    return RegisterResponse.fromJson(response.data);
  }
}
