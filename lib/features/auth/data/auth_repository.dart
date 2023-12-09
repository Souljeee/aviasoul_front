import 'package:aviasoul_front/features/auth/data/models/auth_response.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final String _basePath = 'http://127.0.0.1:8080';

  final Dio _client = Dio();

  Future<AuthResponse> authUser({
    required String email,
    required String password,
  }) async {
    final response = await _client.post('$_basePath/login', data: {
      'email': email,
      'password': password,
    });

    return AuthResponse.fromJson(response.data);
  }

  Future<void> logout({required String token}) async {
    await _client.post(
      '$_basePath/logout',
      data: {
        'token': token,
      },
    );
  }
}
