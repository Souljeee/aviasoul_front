import 'package:aviasoul_front/common/widgets/custom_elevated_button.dart';
import 'package:aviasoul_front/common/widgets/custom_text_field.dart';
import 'package:aviasoul_front/features/basket/credit_cards/bloc/add_new_credit_card/add_new_credit_card_bloc.dart';
import 'package:aviasoul_front/features/basket/credit_cards/bloc/credit_cards_bloc/credit_card_bloc.dart';
import 'package:aviasoul_front/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MyCardsPage extends StatefulWidget {
  const MyCardsPage({super.key});

  @override
  State<MyCardsPage> createState() => _MyCardsPageState();
}

class _MyCardsPageState extends State<MyCardsPage> {
  final FormControl<String> numberField = FormControl();
  final FormControl<String> dateField = FormControl();
  final FormControl<String> cvvField = FormControl();

  bool showAddCardFields = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNewCreditCardBloc(
        profileRepository: profileRepository,
      ),
      child: BlocProvider(
        create: (context) => CreditCardBloc(
          profileRepository: profileRepository,
        )..add(const CreditCardEvent.getCreditCardList()),
        child: Scaffold(
          body: SafeArea(
            child: Row(
              children: [
                Spacer(),
                BlocListener<AddNewCreditCardBloc, AddNewCreditCardState>(
                  listener: (context, state) {
                    state.mapOrNull(
                      success: (_) {
                        showAddCardFields = false;

                        BlocProvider.of<CreditCardBloc>(context).add(
                          const CreditCardEvent.getCreditCardList(),
                        );

                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.success(
                            message: 'Карта успешо добавлена',
                          ),
                        );
                      },
                    );
                  },
                  child: BlocBuilder<CreditCardBloc, CreditCardState>(
                    builder: (context, state) {
                      return state.map(
                        idle: (_) => Container(),
                        loading: (_) => Column(
                          children: [
                            Spacer(),
                            CircularProgressIndicator(),
                            Spacer(),
                          ],
                        ),
                        success: (state) {
                          return SizedBox(
                            width: 800,
                            child: Column(
                              children: [
                                SizedBox(height: 70),
                                Text(
                                  'Мои карты',
                                  style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                SizedBox(height: 32),
                                ...state.creditCards.map<Widget>(
                                  (e) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            _getCardTitle(number: e.number),
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e.date,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                e.cvv.replaceRange(0, 2, '**'),
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          trailing: GestureDetector(
                                            onTap: () {
                                              BlocProvider.of<CreditCardBloc>(
                                                      context)
                                                  .add(
                                                CreditCardEvent.deleteCard(
                                                  cardId: e.id,
                                                ),
                                              );
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                      ],
                                    );
                                  },
                                ).toList(),
                                SizedBox(height: 16),
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
                                SizedBox(height: 16),
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
                                            AddNewCreditCardEvent
                                                .addNewCreditCard(
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
                              ],
                            ),
                          );
                        },
                        error: (_) => const Column(
                          children: [
                            Center(
                              child: Text(
                                'Извините, произошла непредвиденная ошибка',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getCardTitle({required String number}) {
    final cutNumber = number.substring(15);
    final formattedNumber = '****-$cutNumber';

    return formattedNumber;
  }
}
