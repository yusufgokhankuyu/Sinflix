import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sinflix/core/services/token_service.dart';

class DioClient {
  DioClient(this._tokenService) {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://caseapi.servicelabs.tech',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
      ),
    );

    // token’ı her isteğe ekleyen interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _tokenService.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers[HttpHeaders.authorizationHeader] =
                'Bearer $token'; // <-- BEARER!
          }
          return handler.next(options);
        },
      ),
    );
  }

  late final Dio _dio;
  final TokenService _tokenService;

  Dio get dio => _dio;
}
