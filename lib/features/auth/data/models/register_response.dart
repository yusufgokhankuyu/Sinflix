import 'package:sinflix/core/network/api_response.dart';

class RegisterResponse {
  final ApiResponse response;
  final UserData data;

  RegisterResponse({required this.response, required this.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      response: ApiResponse.fromJson(json['response'] ?? {}),
      data: UserData.fromJson(json['data'] ?? {}),
    );
  }
}

class UserData {
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final String token;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['_id'] ?? json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
      token: json['token'] ?? '',
    );
  }
}
