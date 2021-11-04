import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ServicePieChart extends StatelessWidget {
  const ServicePieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 400,
      child: PieChart(
          PieChartData(
              centerSpaceRadius: 0,
              startDegreeOffset: -90,
              sections: [
                PieChartSectionData(
                    title: '33.3%',
                    titleStyle: TextStyle(color: Colors.white),
                    color: Colors.blue[900],
                    value: 33.3,
                    radius: 170
                ),
                PieChartSectionData(
                  title: '50%',
                  titleStyle: TextStyle(color: Colors.white),
                  color: Colors.blue[700],
                  value: 50,
                  radius: 170,
                ),
                PieChartSectionData(
                  title: '16.7%',
                  titleStyle: TextStyle(color: Colors.white),
                  color: Colors.blue[200],
                  value: 16.7,
                  radius: 170,
                ),
              ],
            pieTouchData: PieTouchData(
              touchCallback: (event, response){

              }
            )
          )
      ),
    );
  }
}
