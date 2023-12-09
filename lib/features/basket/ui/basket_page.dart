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

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

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
      body: SafeArea(
        child: Row(
          children: [
            Spacer(),
            Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Корзина',
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
                              'Добавьте подходящие вам билеты',
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
                                    (e) => BasketItem(bookedTickets: e),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 32),
                            SizedBox(
                              width: 300,
                              child: CustomElevatedButton(
                                text: 'Купить\n ${_getResultSumAsString(
                                  bookedTickets: state.bookedTickets,
                                )} руб.',
                                height: 60,
                                onTap: () {
                                  _showPayBottomSheet(
                                    parentContext: context,
                                    tickets: state.bookedTickets,
                                    resultSum: int.parse(
                                      _getResultSumAsString(
                                        bookedTickets: state.bookedTickets,
                                      ),
                                    ),
                                  );
                                },
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
    );
  }

  Future<void> _showPayBottomSheet({
    required BuildContext parentContext,
    required List<BookedTicketsResponse> tickets,
    required int resultSum,
  }) async {
    await showModalBottomSheet(
      context: parentContext,
      builder: (context) {
        return BlocProvider.value(
          value: BlocProvider.of<GetBookedTicketsBloc>(parentContext),
          child: _PayBottomSheet(
            tickets: tickets,
            resultSum: resultSum,
          ),
        );
      },
    );
  }

  String _getResultSumAsString({
    required List<BookedTicketsResponse> bookedTickets,
  }) {
    int sum = 0;

    bookedTickets.forEach((tiketsInfo) {
      tiketsInfo.tickets.forEach((ticket) {
        sum += ticket.price;
      });
    });

    return sum.toString();
  }
}

class _PayBottomSheet extends StatefulWidget {
  final List<BookedTicketsResponse> tickets;
  final int resultSum;

  const _PayBottomSheet({
    required this.tickets,
    required this.resultSum,
    super.key,
  });

  @override
  State<_PayBottomSheet> createState() => _PayBottomSheetState();
}

class _PayBottomSheetState extends State<_PayBottomSheet> {
  final FormControl<String> typeRadio = FormControl();
  final FormControl<String> numberField = FormControl();
  final FormControl<String> dateField = FormControl();
  final FormControl<String> cvvField = FormControl();

  late final FormGroup payForm = FormGroup({
    'type': typeRadio,
  });

  bool showAddCardFields = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreditCardBloc(
            profileRepository: profileRepository,
          )..add(const CreditCardEvent.getCreditCardList()),
        ),
        BlocProvider(
          create: (context) => AddNewCreditCardBloc(
            profileRepository: profileRepository,
          ),
        ),
        BlocProvider(
          create: (context) => PayForTicketBloc(
            basketRepository: basketRepository,
          ),
        ),
      ],
      child: Wrap(
        children: [
          ReactiveForm(
            formGroup: payForm,
            child: BlocBuilder<CreditCardBloc, CreditCardState>(
              builder: (context, state) {
                return state.map(
                  idle: (_) => Container(),
                  loading: (_) => const Column(
                    children: [
                      SizedBox(height: 100),
                      CircularProgressIndicator(),
                      SizedBox(height: 100),
                    ],
                  ),
                  success: (state) {
                    return BlocListener<AddNewCreditCardBloc,
                        AddNewCreditCardState>(
                      listener: (context, state) {
                        state.mapOrNull(
                          success: (state) {
                            showAddCardFields = false;

                            BlocProvider.of<CreditCardBloc>(context).add(
                              const CreditCardEvent.getCreditCardList(),
                            );
                          },
                        );
                      },
                      child: BlocListener<PayForTicketBloc, PayForTicketState>(
                        listener: (context, state) {
                          state.mapOrNull(
                            success: (_) {
                              BlocProvider.of<GetBookedTicketsBloc>(context)
                                  .add(
                                const GetBookedTicketsEvent.getBookedTickets(),
                              );

                              Navigator.pop(context);

                              showTopSnackBar(
                                Overlay.of(context),
                                const CustomSnackBar.success(
                                  message: "Оплата прошла успешно",
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Выберите карту',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            ...state.creditCards
                                .map<Widget>(
                                  (e) => ReactiveRadioListTile(
                                    formControl: typeRadio,
                                    value: e.id,
                                    title: Text(
                                      _getCardTitle(
                                        number: e.number,
                                      ),
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    subtitle: Text(
                                      e.date,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  showAddCardFields = true;
                                });
                              },
                              child: const Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.blueAccent,
                                      size: 24,
                                    ),
                                    SizedBox(width: 32),
                                    Text(
                                      'Добавить карту',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            if (showAddCardFields) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: CustomTextField(
                                  controller: numberField,
                                  label: 'Номер карты',
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: CustomTextField(
                                  controller: dateField,
                                  label: 'Дата',
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: CustomTextField(
                                  controller: cvvField,
                                  label: 'CVV/CVC',
                                ),
                              ),
                              const SizedBox(height: 8),
                              Center(
                                child: SizedBox(
                                  width: 150,
                                  child: CustomElevatedButton(
                                    text: 'Добавить',
                                    onTap: () {
                                      final number = numberField.value!;
                                      final date = dateField.value!;
                                      final cvv = cvvField.value!;

                                      BlocProvider.of<AddNewCreditCardBloc>(
                                              context)
                                          .add(
                                        AddNewCreditCardEvent.addNewCreditCard(
                                          number: number,
                                          date: date,
                                          cvv: cvv,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: CustomElevatedButton(
                                text: 'Оплатить',
                                onTap: () {
                                  BlocProvider.of<PayForTicketBloc>(context)
                                      .add(
                                    PayForTicketEvent.pay(
                                      ticketsId: getPayingIdList(
                                        bookedTickets: widget.tickets,
                                      ),
                                      amount: widget.resultSum,
                                      transactionTime:
                                          DateTime.now().toIso8601String(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  error: (_) => Container(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getCardTitle({required String number}) {
    final cutNumber = number.substring(15);
    final formattedNumber = '****-$cutNumber';

    return formattedNumber;
  }

  List<String> getPayingIdList({
    required List<BookedTicketsResponse> bookedTickets,
  }) {
    final List<String> idList = [];

    bookedTickets.forEach((bookedTicket) {
      bookedTicket.tickets.forEach((ticket) {
        idList.add(ticket.id);
      });
    });

    return idList;
  }
}

class BasketItem extends StatelessWidget {
  final BookedTicketsResponse bookedTickets;

  const BasketItem({
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
                  Column(
                    children: [
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
                      const SizedBox(height: 16),
                      Center(
                        child: Text(
                          '${_getResultSunForConcreteFlight(
                            tickets: bookedTickets.tickets,
                          )} руб.',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
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
                  (e) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${localizeType(type: e.type)}: место ${e.seatNumber}',
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
