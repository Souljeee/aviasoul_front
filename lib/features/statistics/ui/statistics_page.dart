import 'package:aviasoul_front/features/statistics/bloc/statistics_bloc.dart';
import 'package:aviasoul_front/features/statistics/data/statistics_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticsBloc(
        statisticsRepository: StatisticsRepository(),
      )..add(const StatisticsEvent.fetchStatistics()),
      child: Scaffold(
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
              SizedBox(
                width: 800,
                child: BlocBuilder<StatisticsBloc, StatisticsState>(
                  builder: (context, state) {
                    return state.map(
                      idle: (_) => Container(),
                      loading: (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      success: (state) {
                        List<_FlightData> data = [
                          _FlightData(
                            monthTitle: 'Январь',
                            flightCount:
                                state.statistics.flightsPerMonth['Январь']!,
                          ),
                          _FlightData(
                            monthTitle: 'Февраль',
                            flightCount:
                                state.statistics.flightsPerMonth['Февраль']!,
                          ),
                          _FlightData(
                            monthTitle: 'Март',
                            flightCount:
                                state.statistics.flightsPerMonth['Март']!,
                          ),
                          _FlightData(
                            monthTitle: 'Январь',
                            flightCount:
                                state.statistics.flightsPerMonth['Январь']!,
                          ),
                          _FlightData(
                            monthTitle: 'Апрель',
                            flightCount:
                                state.statistics.flightsPerMonth['Апрель']!,
                          ),
                          _FlightData(
                            monthTitle: 'Май',
                            flightCount:
                                state.statistics.flightsPerMonth['Май']!,
                          ),
                          _FlightData(
                            monthTitle: 'Июнь',
                            flightCount:
                                state.statistics.flightsPerMonth['Июнь']!,
                          ),
                          _FlightData(
                            monthTitle: 'Июль',
                            flightCount:
                                state.statistics.flightsPerMonth['Июль']!,
                          ),
                          _FlightData(
                            monthTitle: 'Август',
                            flightCount:
                                state.statistics.flightsPerMonth['Август']!,
                          ),
                          _FlightData(
                            monthTitle: 'Сентябрь',
                            flightCount:
                                state.statistics.flightsPerMonth['Сентябрь']!,
                          ),
                          _FlightData(
                            monthTitle: 'Октябрь',
                            flightCount:
                                state.statistics.flightsPerMonth['Октябрь']!,
                          ),
                          _FlightData(
                            monthTitle: 'Ноябрь',
                            flightCount:
                                state.statistics.flightsPerMonth['Ноябрь']!,
                          ),
                          _FlightData(
                            monthTitle: 'Декабрь',
                            flightCount:
                                state.statistics.flightsPerMonth['Декабрь']!,
                          ),
                        ];

                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              const Text(
                                'Статистика',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              const SizedBox(height: 32),
                              const Text(
                                'Средний возраст пользователей',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                state.statistics.averageAge.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Город с максимальным количеством аэропортов',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                state.statistics.mostAirportsLocation
                                    .toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Количество карт в системе',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                state.statistics.cardsCount.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Наиболее посещаемый город',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                state.statistics.mostArrivedCity.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Максимальная цена билета в системе',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                state.statistics.maxPrice.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Минимальная цена билета в системе',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                state.statistics.minPrice.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Количество билетов бизнес-класса в системе',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                state.statistics.businessCount.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Количество билетов эконом-класса в системе',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                state.statistics.defaultCount.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Общее количество транзакций оплаты',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                state.statistics.paymentsCount.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'График полетов в месяц',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 800,
                                height: 400,
                                child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  legend: Legend(isVisible: true),
                                  // Enable tooltip
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  series: <ChartSeries<_FlightData, String>>[
                                    LineSeries<_FlightData, String>(
                                        dataSource: data,
                                        xValueMapper: (_FlightData sales, _) =>
                                            sales.monthTitle,
                                        yValueMapper: (_FlightData sales, _) =>
                                            sales.flightCount,
                                        name: 'Полеты в месяц',
                                        // Enable data label
                                        dataLabelSettings:
                                            DataLabelSettings(isVisible: true))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      error: (_) => Container(),
                    );
                  },
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FlightData {
  final String monthTitle;
  final int flightCount;

  const _FlightData({
    required this.monthTitle,
    required this.flightCount,
  });
}
