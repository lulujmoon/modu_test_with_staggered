import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ServicePieChart extends StatelessWidget {
  const ServicePieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('3연동중문', 20, 33.3, Colors.blue[800]),
      ChartData('초슬림3연동중문', 30, 50,  Colors.blueAccent),
      ChartData('몰딩', 10, 16.7, Colors.blue[200]),
    ];

    return SizedBox(
      width: 600,
      height: 400,
      child: SfCircularChart(
        series: <CircularSeries>[
          PieSeries<ChartData, String>(
            dataSource: chartData,
            pointColorMapper: (ChartData data, _)=> data.color,
            xValueMapper: (ChartData data, _)=> data.productName,
            yValueMapper: (ChartData data, _)=> data.value,
            startAngle: 0,
            endAngle: 360,
            dataLabelSettings: const DataLabelSettings(isVisible: true, textStyle: TextStyle(color: Colors.white)),
            dataLabelMapper: (ChartData data, _)=> '${data.percentage}%',
            explode: true,
            explodeIndex: 0,
            enableTooltip: true,
          ),
        ],
        tooltipBehavior: TooltipBehavior(
          enable: true,
        ),
      )
    );
  }
}

class ChartData {
  final String productName;
  final double value;
  final double percentage;
  final Color? color;
  ChartData(this.productName, this.value, this.percentage, this.color);
}