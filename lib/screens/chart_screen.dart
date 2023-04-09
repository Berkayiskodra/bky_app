import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class SalesData {
  String date = "";
  double amount = 0.0;
  SalesData(this.date, this.amount);
}

class ProductSale {
  String productName = "";
  Color productColor = Colors.green;
  int count = 0;
  ProductSale(this.productName, this.count, this.productColor);
}

class _ChartScreenState extends State<ChartScreen> {
  // ignore: non_constant_identifier_names
  String chart_type = "line";

  var salesData = <SalesData>[
                SalesData('03/04', 35000),
                SalesData('02/04', 27000),
                SalesData('01/04', 29000),
                SalesData('31/03', 48000),
                SalesData('30/03', 15000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Wrap(
              children: [
                const SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      chart_type = "line";
                      setState(() {});
                    },
                    style: const ButtonStyle(
                      // backgroundColor
                    ),
                    child: const Text('Line')
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      chart_type = "spark";
                      setState(() {});
                    },
                    style: const ButtonStyle(
                      // backgroundColor
                    ),
                    child: const Text('Spark')
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      chart_type = "spline";
                      setState(() {});
                    },
                    style: const ButtonStyle(
                      // backgroundColor
                    ),
                    child: const Text('Spline')
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      chart_type = "pie";
                      setState(() {});
                    },
                    style: const ButtonStyle(
                      // backgroundColor
                    ),
                    child: const Text('Pie')
                  ),
                ),
              ],
            ),
          chart_type == 'line' ? LineChart(data: salesData,) : chart_type == 'spark' ? const SparkChart() :chart_type == 'spline' ? SplineChart(data: salesData,) : chart_type == 'pie' ? PieChart() : const Text('Not İmplemented Yet'),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LineChart extends StatelessWidget {

  List<SalesData> data;

   LineChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
          // Initialize category axis
          primaryXAxis: CategoryAxis(),
          // chart title
          title: ChartTitle(
            text: 'Günlük Satış Raporu',
            alignment:  ChartAlignment.center,
          ),
          // legend
          legend: Legend(
            isVisible: true
          ),
          // tooltip
          tooltipBehavior: TooltipBehavior(
            enable: true,
            //animationDuration: 10,
            //header: ('Detay'),
            //tooltipPosition: TooltipPosition.auto,
          ),
          series: <LineSeries<SalesData, String>>[
            LineSeries<SalesData, String>(

              name: 'Satış',
              //dataLabelSettings: DataLabelSettings(
              //  isVisible: true,
              //  useSeriesColor: true,
              //),
              // Bind data source
              dataSource:  <SalesData>[
                SalesData('03/04', 35000),
                SalesData('02/04', 28000),
                SalesData('01/04', 29000),
                SalesData('31/03', 48000),
                SalesData('30/03', 15000)
              ],
              xValueMapper: (SalesData sales, _) => sales.date,
              yValueMapper: (SalesData sales, _) => sales.amount,
              ),
              LineSeries<SalesData, String>(
              name: 'Masraflar',
              //dataLabelSettings: DataLabelSettings(
              //  isVisible: true,
              //  useSeriesColor: true,
              //),
              // Bind data source
              dataSource:  data,
              xValueMapper: (SalesData sales, _) => sales.date,
              yValueMapper: (SalesData sales, _) => sales.amount,
              ),
              LineSeries<SalesData, String>(
              name: 'Kar',
              color: Colors.orange,
              //dataLabelSettings: DataLabelSettings(
              //  isVisible: true,
              //  useSeriesColor: true,
              //),
              // Bind data source
              dataSource:  <SalesData>[
                SalesData('03/04', 16000),
                SalesData('02/04', 12000),
                SalesData('01/04', 9000),
                SalesData('31/03', 1000),
                SalesData('30/03', 5500)
              ],
              xValueMapper: (SalesData sales, _) => sales.date,
              yValueMapper: (SalesData sales, _) => sales.amount,
              ),
      ],
    );
  }
}

class SparkChart extends StatelessWidget {

  const SparkChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfSparkLineChart(
      //Enable the trackball
       trackball: const SparkChartTrackball(
            activationMode: SparkChartActivationMode.tap),
      //Enable marker
        marker: const SparkChartMarker(
            displayMode: SparkChartMarkerDisplayMode.all),
      //Enable data label
        labelDisplayMode: SparkChartLabelDisplayMode.all,
      data: const <double>[
                1, 5, -6, 0, 1, -2, 7, -7, -4, -10, 13, -6, 7, 5, 11, 5, 3
              ],
    );
  }
}

// ignore: must_be_immutable
class SplineChart extends StatelessWidget {

  List<SalesData> data;

  SplineChart({
    Key ? key,
    required this.data,})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      legend: Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      //isTransposed: true,
      series: <ChartSeries>[
      // Renders spline chart
        SplineSeries<SalesData, String>(
        name: 'Satış',
        dataSource: data,
        markerSettings: const MarkerSettings(isVisible: true),
        splineType: SplineType.natural,
        enableTooltip: true,
        xValueMapper: (SalesData data, _) => data.date,
        yValueMapper: (SalesData data, _) => data.amount),
        SplineSeries<SalesData, String>(
        name: 'Masraflar',
        markerSettings: const MarkerSettings(isVisible: true),
        dataSource: [
          SalesData('03/04', 14000),
          SalesData('02/04', 17000),
          SalesData('01/04', 9000),
          SalesData('31/03', 1000),
          SalesData('30/03', 29000)
        ],
        splineType: SplineType.natural,
        enableTooltip: true,
        xValueMapper: (SalesData data, _) => data.date,
        yValueMapper: (SalesData data, _) => data.amount),
      ],
    );
  }

}

// ignore: must_be_immutable
class PieChart extends StatelessWidget {
   PieChart({
    super.key,
  });

  List<ProductSale> data = [
    ProductSale("Mont", 9, Colors.green),
    ProductSale("Gömlek", 48, Colors.orange),
    ProductSale("Tişört", 19, Colors.blue),
    ProductSale("Pantolon", 150, Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(
        text: 'Ürünler',
      ),
      legend: Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CircularSeries>[
      // Render pie chart
      PieSeries<ProductSale, String>(
        dataSource: data,
        pointColorMapper:(ProductSale data,  _) => data.productColor,
        xValueMapper: (ProductSale data, _) => data.productName,
        yValueMapper: (ProductSale data, _) => data.count
        ),
      ],
    );
  }
}