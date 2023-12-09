import 'package:aviasoul_front/common/widgets/custom_elevated_button.dart';
import 'package:aviasoul_front/common/widgets/custom_text_field.dart';
import 'package:aviasoul_front/features/basket/add_to_basket/bloc/add_to_basket_bloc.dart';
import 'package:aviasoul_front/features/basket/common/data/basket_repository.dart';
import 'package:aviasoul_front/features/basket/get_booked_tickets/bloc/get_booked_tickets_bloc.dart';
import 'package:aviasoul_front/features/basket/ui/basket_page.dart';
import 'package:aviasoul_front/features/home/bloc/home_bloc.dart';
import 'package:aviasoul_front/features/home/data/flights_repository.dart';
import 'package:aviasoul_front/features/home/data/models/flight_response.dart';
import 'package:aviasoul_front/features/profile/data/profile_repository.dart';
import 'package:aviasoul_front/features/profile/ui/profile_page.dart';
import 'package:aviasoul_front/features/statistics/ui/statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

final profileRepository = ProfileRepository();
final basketRepository = BasketRepository();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FormControl<String> fromController = FormControl();
  final FormControl<String> whereController = FormControl();
  final FormControl<String> fromDateController = FormControl();
  final FormControl<String> whereDateController = FormControl();
  final FormControl<int> minPriceController = FormControl();
  final FormControl<int> maxPriceController = FormControl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
              flightsRepository: FlightsRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => AddToBasketBloc(
              basketRepository: basketRepository,
              profileRepository: profileRepository,
            ),
          ),
          BlocProvider(
            create: (context) => GetBookedTicketsBloc(
              basketRepository: basketRepository,
              profileRepository: profileRepository,
            )..add(const GetBookedTicketsEvent.getBookedTickets()),
          ),
        ],
        child: SafeArea(
          child: Row(
            children: [
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 70),
                  Row(
                    children: [
                      SizedBox(width: 550),
                      IconButton(
                        alignment: Alignment.center,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => StatisticsPage(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.analytics,
                          color: Colors.black54,
                          size: 35,
                        ),
                      ),
                      SizedBox(width: 32),
                      IconButton(
                        alignment: Alignment.center,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProfilePage(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.person,
                          color: Colors.black54,
                          size: 35,
                        ),
                      ),
                      SizedBox(width: 32),
                      BlocBuilder<GetBookedTicketsBloc, GetBookedTicketsState>(
                        builder: (context, state) {
                          return IconButton(
                            alignment: Alignment.center,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                    value:
                                    BlocProvider.of<HomeBloc>(
                                        context),
                                    child: BlocProvider.value(
                                      value:
                                          BlocProvider.of<GetBookedTicketsBloc>(
                                              context),
                                      child: BasketPage(),
                                    ),
                                  ),
                                ),
                              );
                            },
                            icon: Badge(
                              textColor: Colors.white,
                              backgroundColor: Colors.red,
                              label: state.basketTicketsCount != null
                                  ? Text(state.basketTicketsCount.toString())
                                  : null,
                              child: Icon(
                                Icons.shopping_basket_outlined,
                                color: Colors.black54,
                                size: 35,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _SearchParamsFields(
                    fromController: fromController,
                    whereController: whereController,
                    fromDateTimeController: fromDateController,
                    whereDateTimeController: whereDateController,
                    minPriceController: minPriceController,
                    maxPriceController: maxPriceController,
                  ),
                  const SizedBox(height: 32),
                  Expanded(
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return state.map(
                          idle: (_) => const Center(
                            child: Text(
                              'Введите информацию об интересующих вас рейсах',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          loading: (_) => const Center(
                            child: Text(
                              'Подождите, идет загрузка...',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          success: (state) {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                  ...state.flights
                                      .map((e) => FlightItem(flight: e))
                                      .toList(),
                                ],
                              ),
                            );
                          },
                          error: (_) => const Center(
                            child: Text(
                              'Извините, произошла непредвиденная ошибка',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class FlightItem extends StatelessWidget {
  final FlightResponse flight;

  const FlightItem({
    required this.flight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          flight.departureTime,
                          style: TextStyle(fontSize: 25),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          flight.departureAirport.location,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          flight.departureDate,
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
                        Icon(
                          Icons.airplane_ticket_outlined,
                          color: Colors.grey,
                          size: 40,
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: 350,
                          child: Divider(
                            thickness: 3,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          flight.arrivalTime,
                          style: TextStyle(fontSize: 25),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          flight.arrivalAirport.location,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          flight.arrivalDate,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(width: 50),
            Column(
              children: [
                const Center(
                  child: Text(
                    '2000 руб.',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 16),
                IconButton(
                  onPressed: () {
                    _showBookDialog(parentContext: context);
                  },
                  splashRadius: 32,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showBookDialog({required BuildContext parentContext}) async {
    await showModalBottomSheet(
      context: parentContext,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AddToBasketBloc>.value(
              value: BlocProvider.of<AddToBasketBloc>(parentContext),
            ),
            BlocProvider<GetBookedTicketsBloc>.value(
              value: BlocProvider.of<GetBookedTicketsBloc>(parentContext),
            ),
          ],
          child: _BookTicketsBottomSheet(
            flight: flight,
          ),
        );
      },
    );
  }
}

class _BookTicketsBottomSheet extends StatefulWidget {
  final FlightResponse flight;

  const _BookTicketsBottomSheet({
    required this.flight,
    super.key,
  });

  @override
  State<_BookTicketsBottomSheet> createState() =>
      _BookTicketsBottomSheetState();
}

class _BookTicketsBottomSheetState extends State<_BookTicketsBottomSheet> {
  final FormControl<String> typeRadio = FormControl(
    validators: [Validators.required],
  );
  final FormControl<int> countController = FormControl(
    validators: [Validators.required],
  );

  late final FormGroup bookDialogForm = FormGroup({
    'type': typeRadio,
    'count': countController,
  });

  bool showResultPrice = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddToBasketBloc, AddToBasketState>(
      listener: (context, state) {
        state.mapOrNull(
          success: (_) {
            BlocProvider.of<GetBookedTicketsBloc>(context).add(
              const GetBookedTicketsEvent.getBookedTickets(),
            );

            Navigator.pop(context);
          },
        );
      },
      child: Wrap(
        children: [
          ReactiveForm(
            formGroup: bookDialogForm,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30),
                ReactiveRadioListTile(
                  formControl: typeRadio,
                  value: 'default',
                  title: Text(
                    'Эконом',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.flight.defaultPrice} руб.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Осталось ${widget.flight.defaultTicketsCount} шт.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ReactiveRadioListTile(
                  formControl: typeRadio,
                  value: 'business',
                  title: Text(
                    'Бизнес класс',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.flight.businessPrice} руб.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Осталось ${widget.flight.businessTicketsCount} шт.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomTextField<int>(
                    onChanged: (control) {
                      if (control.value != null) {
                        setState(() {
                          showResultPrice = true;
                        });
                      }
                    },
                    controller: countController,
                    label: 'Введите количество Билетов',
                  ),
                ),
                const SizedBox(height: 16),
                if (showResultPrice) ...[
                  Center(
                    child: Text(
                      'Итоговая сумма: ${getResultPrice(
                        defaultTicketsCount: typeRadio.value == 'default'
                            ? countController.value!
                            : 0,
                        defaultTicketsPrice: widget.flight.defaultPrice,
                        businessTicketsCount: typeRadio.value == 'business'
                            ? countController.value!
                            : 0,
                        businessTicketsPrice: widget.flight.businessPrice,
                      )} руб.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomElevatedButton(
                    text: 'Забронировать',
                    onTap: () {
                      if (countController.value == null) {
                        return;
                      }

                      if (typeRadio.value == null) {
                        return;
                      }

                      if (typeRadio.value == 'default' &&
                          countController.value! >
                              widget.flight.defaultTicketsCount) {
                        return;
                      }

                      if (typeRadio.value == 'business' &&
                          countController.value! >
                              widget.flight.businessTicketsCount) {
                        return;
                      }

                      BlocProvider.of<AddToBasketBloc>(context).add(
                        AddToBasketEvent.addToBasket(
                          flightId: widget.flight.id,
                          count: countController.value!,
                          type: typeRadio.value!,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getResultPrice({
    required int defaultTicketsCount,
    required int defaultTicketsPrice,
    required int businessTicketsCount,
    required int businessTicketsPrice,
  }) {
    return ((defaultTicketsCount * defaultTicketsPrice) +
            (businessTicketsCount * businessTicketsPrice))
        .toString();
  }
}

class _SearchParamsFields extends StatefulWidget {
  final FormControl<String> fromController;
  final FormControl<String> whereController;
  final FormControl<String> fromDateTimeController;
  final FormControl<String> whereDateTimeController;
  final FormControl<int> minPriceController;
  final FormControl<int> maxPriceController;

  const _SearchParamsFields({
    required this.fromController,
    required this.whereController,
    required this.fromDateTimeController,
    required this.whereDateTimeController,
    required this.minPriceController,
    required this.maxPriceController,
    super.key,
  });

  @override
  State<_SearchParamsFields> createState() => _SearchParamsFieldsState();
}

class _SearchParamsFieldsState extends State<_SearchParamsFields> {
  bool showSpecialParams = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: widget.fromController,
                  label: 'Откуда',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  controller: widget.whereController,
                  label: 'Куда',
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () {
                  setState(() {
                    showSpecialParams = !showSpecialParams;
                  });
                },
                icon: const Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          if (showSpecialParams) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextField<String>(
                    onTap: (control) => _showDatePicker(control: control),
                    controller: widget.fromDateTimeController,
                    label: 'Время отправления',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField<String>(
                    onTap: (control) => _showDatePicker(control: control),
                    controller: widget.whereDateTimeController,
                    label: 'Время прибытия',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: widget.minPriceController,
                    label: 'Минимальная цена',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    controller: widget.maxPriceController,
                    label: 'Максимальная цена',
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 16),
          SizedBox(
            width: 200,
            child: CustomElevatedButton(
              text: 'Найти',
              onTap: () {
                final String? departureCity = widget.fromController.value;
                final String? arrivedCity = widget.whereController.value;
                final String? departureDt = widget.fromDateTimeController.value;
                final String? arrivedDt = widget.whereDateTimeController.value;
                final int? minPrice = widget.minPriceController.value;
                final int? maxPrice = widget.maxPriceController.value;

                BlocProvider.of<HomeBloc>(context).add(
                  HomeEvent.fetchFlights(
                    departureCity: departureCity,
                    arrivedCity: arrivedCity,
                    departureDt: departureDt,
                    arrivedDt: arrivedDt,
                    minPrice: minPrice,
                    maxPrice: maxPrice,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDatePicker({required FormControl<String> control}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked == null) {
      return;
    }

    final String formattedDate = DateFormat('dd.MM.yyyy').format(picked);

    control.value = formattedDate;
  }
}
