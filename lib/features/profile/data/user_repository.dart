import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:sinflix/core/services/token_service.dart';
import 'user_model.dart';
import 'dart:io';

class UserRepository {
  UserRepository(this.dio);

  final Dio dio;

  Future<UserModel> uploadPhoto(File file) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.uri.pathSegments.last,
        contentType: MediaType('image', 'jpeg'),
      ),
    });

    final res = await dio.post('/user/upload_photo', data: formData);

    if (res.statusCode != 200) {
      throw Exception(
        res.data['response']?['message'] ?? 'Fotoğraf yüklenemedi',
      );
    }

    final user = UserModel.fromJson(res.data['data']);
    // Foto URL’sini güvenli depoya kaydet
    await TokenService().saveUserPhoto(user.photoUrl ?? '');

    return user;
  }

  Future<UserModel> getProfile() async {
    final res = await dio.get('/user/profile');
    return UserModel.fromJson(res.data['data']);
  }
}
