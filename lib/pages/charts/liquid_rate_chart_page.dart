import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LiquidRateChartPage extends StatelessWidget {
   LiquidRateChartPage({Key? key,required this.LQRateSpots}) : super(key: key);

  @override
  List<FlSpot>? LQRateSpots;

  @override
  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 40,
    getTitlesWidget: (value, meta) {
      String text = '';

      if (value.toInt() == meta.min.toInt())
      {
        text = DateFormat.yMMM().format(DateTime.fromMillisecondsSinceEpoch(meta.min.toInt()));
        text = '';
      }
      else if (value.toInt() == meta.max.toInt())
      {

        text = DateFormat.yMMM().format(DateTime.fromMillisecondsSinceEpoch(meta.max.toInt()));
        text = '';
      }
      else {
        //  print('${DateFormat.yMMM().format(DateTime.fromMillisecondsSinceEpoch(value.toInt()))}');
        text = '';
        text = DateFormat.yMMM().format(DateTime.fromMillisecondsSinceEpoch(value.toInt()));
        //print('${}');
      }

      return SideTitleWidget(
        child: Text(text,style: TextStyle(fontSize: 12),),
        axisSide: meta.axisSide,
        angle: -1.0,
        space: 20,
      ); //Text(DateFormat.yMMM().format(date));
    },

    //interval: _leftTitlesInterval,
  );

  SideTitles get _leftTitles => SideTitles(
    showTitles: true,
    interval: 500.0,
    reservedSize: 40,
    getTitlesWidget: (value, meta) {
      String text = '';

      text = value.toInt().toString();

      return SideTitleWidget(
        child: Text(text,style: TextStyle(fontSize: 12),),
        axisSide: meta.axisSide,
        angle: .4,
        space: 8,
      ); //Text(Da//Text(DateFormat.yMMM().format(date));
    },
    //interval: _leftTitlesInterval,
  );



  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 45.0,horizontal: 25.0),
        child: (LQRateSpots!.isNotEmpty) ?LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                  spots: LQRateSpots, //points.map((point) => FlSpot(point.index.toDouble(), point.test)).toList(),
                  isCurved: false,
                  dotData: FlDotData(
                    show: true,
                  ),
                  color: Colors.red
              ),
            ],
            borderData: FlBorderData(
                border: const Border(bottom: BorderSide(), left: BorderSide())),
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(sideTitles: _bottomTitles),
              leftTitles: AxisTitles(sideTitles: _leftTitles),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false,)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),

            ),
          ),
        ) : Center(child: Text('No Chart'),) ,
      );
  }
}
