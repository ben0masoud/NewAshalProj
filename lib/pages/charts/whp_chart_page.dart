import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WHPChartPage extends StatelessWidget {
   WHPChartPage({Key? key,required this.WHPSpot}) : super(key: key);

  List<FlSpot>? WHPSpot;

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
        text = DateFormat.yMMM().format(DateTime.fromMillisecondsSinceEpoch(value.toInt()));
        //print('${}');
      }
     // text = DateFormat.yMMM().format(DateTime.fromMillisecondsSinceEpoch(value.toInt()));

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
    // interval: 50.0,
     reservedSize: 40,
     getTitlesWidget: (value, meta) {
       String text = '';


       // final DateTime date =
       //  DateTime.fromMillisecondsSinceEpoch(value.toInt());


        if (value.toInt() == meta.min.toInt())
      {
        text =  meta.min.toString();
        text='';
      }
      else if (value.toInt() == meta.max.toInt())
      {

        text = meta.max.toString();
        text='';
      }
      else {
        //  print('${DateFormat.yMMM().format(DateTime.fromMillisecondsSinceEpoch(value.toInt()))}');
        text = '';
        text = value.toInt().toString();
        //print('${}');
      }

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
         child: LineChart(
           LineChartData(
             lineBarsData: [
               LineChartBarData(
                   spots: WHPSpot, //points.map((point) => FlSpot(point.index.toDouble(), point.test)).toList(),
                   isCurved: true,
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
         ),
       );
   }
}
