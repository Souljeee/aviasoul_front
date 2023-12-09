import 'package:aviasoul_front/features/basket/get_booked_tickets/data/booked_tickets_response.dart';
import 'package:dio/dio.dart';

class BasketRepository {
  final String _basePath = 'http://127.0.0.1:8080';

  final Dio _client = Dio();

  Future<void> addToBasket({
    required String flightId,
    required String passengerId,
    required int count,
    required String type,
  }) async {
    await _client.post(
      '$_basePath/book_ticket',
      data: {
        'flightId': flightId,
        'passengerId': passengerId,
        'count': count,
        'type': type,
      },
    );
  }

  Future<List<BookedTicketsResponse>> getBookedTickets({
    required String passengerId,
  }) async {
    final response = await _client.post(
      '$_basePath/get_booked_tickets',
      data: {
        'passengerId': passengerId,
      },
    );

    return response.data
        .map<BookedTicketsResponse>((e) => BookedTicketsResponse.fromJson(e))
        .toList();
  }

  Future<List<BookedTicketsResponse>> getPayedTickets({
    required String passengerId,
  }) async {
    final response = await _client.post(
      '$_basePath/get_payed_tickets',
      data: {
        'passengerId': passengerId,
      },
    );

    return response.data
        .map<BookedTicketsResponse>((e) => BookedTicketsResponse.fromJson(e))
        .toList();
  }

  Future<void> payForTicket({
    required List<String> ticketsId,
    required int amount,
    required String transactionTime,
  }) async {
    await _client.post(
      '$_basePath/pay_for_ticket',
      data: {
        'ticketsId': ticketsId,
        'amount': amount,
        'transactionTime': transactionTime,
      },
    );
  }
}
