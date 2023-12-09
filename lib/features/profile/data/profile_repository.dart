import 'package:aviasoul_front/features/profile/data/models/credit_card_response.dart';
import 'package:aviasoul_front/features/profile/data/models/profile_response.dart';
import 'package:dio/dio.dart';

class ProfileRepository {
  final String _basePath = 'http://127.0.0.1:8080';

  final Dio _client = Dio();

  Future<ProfileResponse> getProfileByToken({required String token}) async {
    final response = await _client.post(
      '$_basePath/get_user_by_token',
      data: {
        'token': token,
      },
    );

    return ProfileResponse.fromJson(response.data);
  }

  Future<List<CreditCardResponse>> getCreditCardsByPassengerId({
    required String passengerId,
  }) async {
    final response = await _client.post(
      '$_basePath/get_credit_cards',
      data: {
        "passengerId": passengerId,
      },
    );

    return response.data
        .map<CreditCardResponse>((e) => CreditCardResponse.fromJson(e))
        .toList();
  }

  Future<void> addNewCreditCard({
    required String number,
    required String date,
    required String cvv,
    required String passengerId,
  }) async {
    await _client.post(
      '$_basePath/add_credit_card',
      data: {
        "number": number,
        "date": date,
        "cvv": cvv,
        "passengerId": passengerId,
      },
    );
  }

  Future<void> updateProfileInfo({
    required String passengerId,
    required String firstName,
    required String lastName,
    required String dtBirth,
    required String email,
    required String passportDetails,
  }) async {
    await _client.post(
      '$_basePath/edit_profile_info',
      data: {
        'passengerId': passengerId,
        'firstName': firstName,
        'lastName': lastName,
        'dtBirth': dtBirth,
        'email': email,
        'passportDetails': passportDetails,
      },
    );
  }

  Future<void> deleteCard({required String cardId}) async {
    await _client.post(
      '$_basePath/delete_card',
      data: {
        'cardId': cardId,
      },
    );
  }
}
