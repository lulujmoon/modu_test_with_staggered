import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ServiceLineChart extends StatelessWidget {
  const ServiceLineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(1, 26.5),
      SalesData(2, 26.5),
      SalesData(3, 25.4),
      SalesData(4, 23.3),
      SalesData(5, 20.6),
      SalesData(6, 18.0),
      SalesData(7, 17.4),
      SalesData(8, 18.9),
      SalesData(9, 21.2),
      SalesData(10, 22.8),
      SalesData(11, 23.6),
      SalesData(12, 25.5)
    ];

    return SfCartesianChart(
      series: <ChartSeries>[
        LineSeries<SalesData, int>(
          dataSource: chartData,
          xValueMapper: (SalesData sales, _) => sales.month,
          yValueMapper: (SalesData sales, _) => sales.sales,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            labelAlignment: ChartDataLabelAlignment.top,
          ),
          color: Colors.teal,
          width: 1,
        )
      ],
      primaryXAxis: NumericAxis(
        labelFormat: '{value}월',
        majorGridLines: const MajorGridLines(width: 0.0),
        maximumLabels: 6,
        axisLine: const AxisLine(color: Colors.black87)
      ),
      primaryYAxis: NumericAxis(isVisible: false),
      backgroundColor: Colors.grey[200],
      plotAreaBorderWidth: 0,
    );
  }
}

class SalesData {
  final int month;
  final double sales;

  SalesData(this.month, this.sales);
}
