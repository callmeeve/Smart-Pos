import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:smartpos/theme.dart';

class LineChart extends StatelessWidget {
  const LineChart({Key? key}) : super(key: key);

  static final List<Financial> expensesData = [
    Financial('2018', 5, primaryBlue),
    Financial('2019', 25, primaryBlue),
    Financial('2020', 100, primaryBlue),
    Financial('2021', 50, primaryBlue),
    Financial('2022', 25, primaryBlue),
  ];
  static final List<Financial> revenueData = [
    Financial('2018', 7, secondaryYellow),
    Financial('2019', 29, secondaryYellow),
    Financial('2020', 120, secondaryYellow),
    Financial('2021', 40, secondaryYellow),
    Financial('2022', 55, secondaryYellow),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Financial, String>> expensesAndRevenueSeries = [
      charts.Series(
        id: "Pengeluaran",
        data: expensesData,
        domainFn: (Financial pops, _) => pops.year,
        measureFn: (Financial pops, _) => pops.value,
        colorFn: (Financial pops, __) =>
            charts.ColorUtil.fromDartColor(pops.barColor),
      ),
      charts.Series(
        id: "Pemasukan",
        data: revenueData,
        domainFn: (Financial pops, _) => pops.year,
        measureFn: (Financial pops, _) => pops.value,
        colorFn: (Financial pops, __) =>
            charts.ColorUtil.fromDartColor(pops.barColor),
      ),
    ];
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: charts.BarChart(
                expensesAndRevenueSeries,
                animate: true,
                defaultRenderer: charts.BarRendererConfig(
                  cornerStrategy: const charts.ConstCornerStrategy(40),
                ),
                primaryMeasureAxis: const charts.NumericAxisSpec(
                  tickProviderSpec: charts.BasicNumericTickProviderSpec(
                    desiredTickCount: 7,
                  ),
                ),
                behaviors: [charts.SeriesLegend()],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: 155,
                decoration: BoxDecoration(
                  color: primaryBlue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: const [
                    Text(
                      "2023",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text("Total Pengeluaran",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    Text("(dalam jutaan)",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\Rp2.000.000",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: 155,
                decoration: BoxDecoration(
                  color: secondaryYellow,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: const [
                    Text(
                      "2023",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text("Total Pemasukan",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    Text("(dalam jutaan)",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\Rp3.000.000",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Financial {
  final String year;
  final int value;
  final Color barColor;

  Financial(this.year, this.value, this.barColor);
}
