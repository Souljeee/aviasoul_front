import 'package:aviasoul_front/features/registration/data/models/registration_response.dart';
import 'package:dio/dio.dart';

class RegistrationRepository{
  final String _basePath = 'http://127.0.0.1:8080';

  final Dio _client = Dio();

  Future<RegistrationResponse> createUser({
    required String firstName,
    required String lastName,
    required String dtBirth,
    required String passportDetails,
    required String email,
    required String password,
  }) async {
    final response =  await _client.post(
        '$_basePath/registration',
        data: {
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
          'dtBirth': dtBirth,
          'passportDetails': passportDetails,
        }
    );

    return RegistrationResponse.fromJson(response.data);
  }
}