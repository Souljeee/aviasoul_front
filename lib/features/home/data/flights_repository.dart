import 'package:aviasoul_front/features/home/data/models/flight_response.dart';
import 'package:dio/dio.dart';

class FlightsRepository {
  final String _basePath = 'http://127.0.0.1:8080';

  final Dio _client = Dio();

  Future<List<FlightResponse>> getFlights({
    String? departureCity,
    String? arrivedCity,
    String? departureDt,
    String? arrivedDt,
    int? minPrice,
    int? maxPrice,
  }) async {
    final response =  await _client.post(
        '$_basePath/flights',
        data: {
          'departureCity': departureCity,
          'arrivedCity': arrivedCity,
          'departureDt': departureDt,
          'arrivedDt': arrivedDt,
          'minPrice': minPrice,
          'maxPrice': maxPrice,
        }
    );

    return response.data.map<FlightResponse>((element) => FlightResponse.fromJson(element)).toList();
  }
}
