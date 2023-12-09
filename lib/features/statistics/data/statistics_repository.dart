import 'package:aviasoul_front/features/statistics/data/model/statistics_response.dart';
import 'package:dio/dio.dart';

class StatisticsRepository {
  final String _basePath = 'http://127.0.0.1:8080';

  final Dio _client = Dio();

  Future<StatisticsResponse> getStatistics() async {
    final response = await _client.post(
      '$_basePath/statistics',
    );

    return StatisticsResponse.fromJson(response.data);
  }
}
