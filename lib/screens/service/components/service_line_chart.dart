import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ServiceLineChart extends StatelessWidget {
  const ServiceLineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200]
          ),
          width: 600,
          height: 400,
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black
            ),
            width: 600,
            height: 1,
          ),
          bottom: 75,
        ),
        SizedBox(
          width: 550,
          height: 350,
          child: LineChart(LineChartData(
              borderData: FlBorderData(show: false),
              maxX: 12,
              maxY: 50,
              minX: 0,
              minY: 0,
              titlesData: FlTitlesData(
                  leftTitles: SideTitles(showTitles: false),
                  rightTitles: SideTitles(showTitles: false),
                  topTitles: SideTitles(showTitles: false),
                  bottomTitles: SideTitles(
                      getTitles: (value) {
                        List<String> months = [
                          '', '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월', ''
                        ];
                        return months[value.toInt()];
                      },
                      showTitles: true)),
              gridData: FlGridData(show: false),
              lineBarsData: [
                LineChartBarData(
                  colors: [Colors.teal],
                  barWidth: 1,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(),
                  spots: [
                    const FlSpot(1, 26.5),
                    const FlSpot(2, 26.5),
                    const FlSpot(3, 25.4),
                    const FlSpot(4, 23.3),
                    const FlSpot(5, 20.6),
                    const FlSpot(6, 18.0),
                    const FlSpot(7, 17.4),
                    const FlSpot(8, 18.9),
                    const FlSpot(9, 21.2),
                    const FlSpot(10,22.8 ),
                    const FlSpot(11, 23.6),
                    const FlSpot(12, 25.5),
                  ],
                ),
              ],
              lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: Colors.white70,
                  ),
              ))),
        ),
      ],
    );
  }
}
