import 'package:sinflix/core/network/api_response.dart';
import 'package:sinflix/features/auth/data/models/register_response.dart';

class LoginResponse {
  final ApiResponse response;
  final UserData data;

  LoginResponse({required this.response, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      response: ApiResponse.fromJson(json['response'] ?? {}),
      data: UserData.fromJson(json['data'] ?? {}),
    );
  }
}
