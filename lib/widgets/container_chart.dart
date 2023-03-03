
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ContainerChart extends StatefulWidget {
  final List<TestData> test;
  final bool more;
  final String? title;
   ContainerChart({Key? key,required this.test,required this.more, this.title}) : super(key: key);

  @override
  State<ContainerChart> createState() => _ContainerChartState();
}


class _ContainerChartState extends State<ContainerChart> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    // TODO: implement initState
   // this.more = false;
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      /*
      //format: 'point.x'
        builder: (dynamic data, dynamic point, dynamic series,
            int pointIndex, int seriesIndex) {
            String dt;
            dt =  DateFormat('dd/MM/yyyy hh:mm a').format(data.date);
          return Container(
              height: 50,
              width: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Value : ',style: TextStyle(color: Colors.white,fontSize: 10,),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '${data.value}',style: TextStyle(color: Colors.white,fontSize: 10,),
                        textAlign: TextAlign.start,
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Date : ',style: TextStyle(color: Colors.white,fontSize: 10,),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '${dt}',style: TextStyle(color: Colors.white,fontSize: 10),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  )

                ],
              )
          );
        }
        */
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(!widget.more)
         return One();
    else
      return MoreThanOne();
  }

  Widget One(){
    return Container(
      child: SfCartesianChart(
        title: ChartTitle(text: widget.title! ?? "Chart"),
        //legend: Legend(isVisible: true),
        tooltipBehavior: _tooltipBehavior,
        enableAxisAnimation: true,
        zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
            enablePinching: true,
            zoomMode: ZoomMode.x
        ),
        series: <ChartSeries>[
          LineSeries<TestData,DateTime>(
            name: widget.title! ?? "Chart",
            dataSource: widget.test,
            xValueMapper: (TestData tst, _) => tst.date,
            yValueMapper: (TestData tst, _) => tst.value,
            dataLabelSettings: DataLabelSettings(isVisible: true,),
            markerSettings: MarkerSettings(isVisible: true),
            enableTooltip: true,
          ),
        ],
        primaryXAxis: DateTimeAxis(),//title: AxisTitle(text: widget.title)),
        //NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
        // primaryYAxis: NumericAxis(numberFormat: NumberFormat.decimalPattern()),
      ),
    );
  }
  Widget MoreThanOne(){
    return Container(
      child: SfCartesianChart(
        title: ChartTitle(text: widget.title! ?? "Chart"),
        legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom
        ),
        tooltipBehavior: _tooltipBehavior,
        enableAxisAnimation: true,
        zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
            enablePinching: true,
            zoomMode: ZoomMode.x
        ),
        series: <ChartSeries>[
          LineSeries<TestData,DateTime>(
            name: 'FLP',
            dataSource: widget.test,
            xValueMapper: (TestData tst, _) => tst.date,
            yValueMapper: (TestData tst, _) => tst.value,
            dataLabelSettings: DataLabelSettings(isVisible: true,),
            markerSettings: MarkerSettings(isVisible: true),
            enableTooltip: true,
          ),
          LineSeries<TestData,DateTime>(
            name: 'WHP',
            dataSource: widget.test,
            xValueMapper: (TestData tst, _) => tst.date,
            yValueMapper: (TestData tst, _) => tst.value1,
            dataLabelSettings: DataLabelSettings(isVisible: true,),
            markerSettings: MarkerSettings(isVisible: true),
            enableTooltip: true,
          ),

        ],
        primaryXAxis: DateTimeAxis(),//title: AxisTitle(text: widget.title)),
        //NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
        // primaryYAxis: NumericAxis(numberFormat: NumberFormat.decimalPattern()),
      ),
    );
  }
}



class TestData {
  TestData({required this.date,required this.value,this.value1});
  final DateTime date;
  final double value;
  final double? value1;
}
