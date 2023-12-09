import 'package:aviasoul_front/common/widgets/custom_elevated_button.dart';
import 'package:aviasoul_front/common/widgets/custom_text_field.dart';
import 'package:aviasoul_front/features/basket/credit_cards/bloc/add_new_credit_card/add_new_credit_card_bloc.dart';
import 'package:aviasoul_front/features/basket/credit_cards/bloc/credit_cards_bloc/credit_card_bloc.dart';
import 'package:aviasoul_front/features/basket/get_booked_tickets/bloc/get_booked_tickets_bloc.dart';
import 'package:aviasoul_front/features/basket/get_booked_tickets/data/booked_tickets_response.dart';
import 'package:aviasoul_front/features/basket/get_booked_tickets/data/ticket_respones.dart';
import 'package:aviasoul_front/features/basket/pay_for_ticket/bloc/pay_for_ticket_bloc.dart';
import 'package:aviasoul_front/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class PayedTicketsPage extends StatelessWidget {
  const PayedTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => GetBookedTicketsBloc(
          profileRepository: profileRepository,
          basketRepository: basketRepository,
        )..add(const GetBookedTicketsEvent.getPayedTickets()),
        child: SafeArea(
          child: Row(
            children: [
              Spacer(),
              Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Мои билеты',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 50),
                  BlocBuilder<GetBookedTicketsBloc, GetBookedTicketsState>(
                    builder: (context, state) {
                      return state.maybeMap(
                        orElse: () => Container(),
                        success: (state) {
                          if (state.bookedTickets.isEmpty) {
                            return const Center(
                              child: Text(
                                'Нет купленных билетов',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 20,
                                ),
                              ),
                            );
                          }

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ...state.bookedTickets.map(
                                          (e) => PayedTicket(bookedTickets: e),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class PayedTicket extends StatelessWidget {
  final BookedTicketsResponse bookedTickets;

  const PayedTicket({
    required this.bookedTickets,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookedTickets.flightInfo.departureTime,
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        bookedTickets.flightInfo.departureAirport.location,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        bookedTickets.flightInfo.departureDate,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 32),
                  SizedBox(
                    width: 350,
                    child: Divider(
                      thickness: 3,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 32),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookedTickets.flightInfo.arrivalTime,
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        bookedTickets.flightInfo.arrivalAirport.location,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        bookedTickets.flightInfo.arrivalDate,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 32),
                  CustomElevatedButton(
                    height: 40,
                    onTap: () {
                      _showTicketsBottomSheet(
                        context: context,
                        tickets: bookedTickets.tickets,
                      );
                    },
                    text: 'Билеты',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showTicketsBottomSheet({
    required BuildContext context,
    required List<TicketResponse> tickets,
  }) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Column(
              children: [
                ...tickets.map(
                      (e) =>
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${localizeType(type: e.type)}: место ${e
                                  .seatNumber}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Цена: ${e.price} руб.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  String localizeType({required String type}) {
    if (type == 'default') {
      return 'Эконом';
    }

    return 'Бизнес';
  }

  String _getResultSunForConcreteFlight({
    required List<TicketResponse> tickets,
  }) {
    int sum = 0;

    tickets.forEach(
          (element) {
        sum += element.price;
      },
    );

    return sum.toString();
  }
}
