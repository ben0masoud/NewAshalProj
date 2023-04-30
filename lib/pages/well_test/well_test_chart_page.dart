
import 'package:ashal_ver_3/pages/charts/flow_line_pressure_chart_page.dart';
import 'package:ashal_ver_3/pages/charts/gor_chart_page.dart';
import 'package:ashal_ver_3/pages/charts/liquid_rate_chart_page.dart';
import 'package:ashal_ver_3/pages/charts/wc_chart_page.dart';
import 'package:ashal_ver_3/pages/charts/whp_chart_page.dart';
import 'package:ashal_ver_3/services/wellTest.dart';
import 'package:ashal_ver_3/services/wph_test.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WellTestChartPage extends StatefulWidget {
   WellTestChartPage({Key? key,
     required this.TestList,
     required this.whpList,
     required this.WHPSpot,
     required this.lqdRateSpot,
     required this.WCSpots,
     required this.GORSpots,
     required this.FlowLinePressureSpots
   }) : super(key: key);

   List<WellTest>? TestList;
   List<WHPTest>? whpList;
   List<FlSpot>? WHPSpot,lqdRateSpot,WCSpots,GORSpots,FlowLinePressureSpots;





  @override
  State<WellTestChartPage> createState() => _WellTestChartPageState();
}

class _WellTestChartPageState extends State<WellTestChartPage> {
  @override
  double? MidP ;
  int selectedPage=0;
  bool isLoad = false;

  late List screens;
  initState(){
    MidP=widget.whpList![(widget.whpList!.length/2).toInt()].date!.millisecondsSinceEpoch.toDouble();
    setState(() {


      screens = [
        WHPChartPage(WHPSpot:widget.WHPSpot),
        WCChartPage(WCSpots:widget.WCSpots),
        LiquidRateChartPage(LQRateSpots:widget.lqdRateSpot),
        GORChartPage(GORSpots:widget.GORSpots),
        FlowLinePressureChartPage(FLPSpots:widget.FlowLinePressureSpots)

      ];
      isLoad = true;
    });
    super.initState();
  }

  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 16,
    getTitlesWidget: (value, meta) {
      String text = '';

     // final DateTime date =
    //  DateTime.fromMillisecondsSinceEpoch(value.toInt());


      if (value.toInt() == meta.min.toInt())
      {text = DateFormat.yMMM().format(DateTime.fromMillisecondsSinceEpoch(meta.max.toInt()));}
      else if (value.toInt() == meta.max.toInt())
      {

        text = DateFormat.yMMM().format(DateTime.fromMillisecondsSinceEpoch(meta.min.toInt()));
      }
      else {
      //  print('${DateFormat.yMMM().format(DateTime.fromMillisecondsSinceEpoch(value.toInt()))}');
        text = '';
        //print('${}');
      }

      return SideTitleWidget(
                child: Text(text,style: TextStyle(fontSize: 9),),
                axisSide: meta.axisSide,
                angle: -.4,
              //  space: 9,
      ); //Text(DateFormat.yMMM().format(date));
    },
    
    //interval: _leftTitlesInterval,
  );

  SideTitles get _leftTitles => SideTitles(
    showTitles: true,
    interval: 500.0,
    reservedSize: 60,
    getTitlesWidget: (value, meta) {
      String text = '';


      // final DateTime date =
      //  DateTime.fromMillisecondsSinceEpoch(value.toInt());

      text = value.toInt().toString();
     /* if (value.toInt() == meta.min.toInt())
      {text = DateFormat.yMMM().format(DateTime.fromMillisecondsSinceEpoch(meta.max.toInt()));}
      else if (value.toInt() == meta.max.toInt())
      {

        text = DateFormat.yMMM().format(DateTime.fromMillisecondsSinceEpoch(meta.min.toInt()));
      }
      else {
        //  print('${DateFormat.yMMM().format(DateTime.fromMillisecondsSinceEpoch(value.toInt()))}');
        text = '';
        //print('${}');
      }
*/
      return Text(text);//Text(DateFormat.yMMM().format(date));
    },
    //interval: _leftTitlesInterval,
  );



  Widget build(BuildContext context) {

    if(!isLoad)
      return IsEmptyPage();
    else
      return NotEmptyPage();


  }
  Scaffold NotEmptyPage() {

    return Scaffold(

     // appBar: AppBar(),
      // endDrawer: NavBar(),
      body: screens[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.email_outlined), label: 'WHP'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_rounded),
                label: 'WC'),
            BottomNavigationBarItem(
                icon: Icon(Icons.connect_without_contact_outlined),
                label: 'LQ'),
            BottomNavigationBarItem(
                icon: Icon(Icons.email_outlined), label: 'GOR'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_rounded),
                label: 'FLP'),


          ],
          selectedItemColor: Colors.green,
          elevation: 5.0,
          unselectedItemColor: Colors.green[900],
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              //print('index = $index');
              selectedPage = index;
            });
          }
      ),
    );
  }
  Scaffold IsEmptyPage() {
    return Scaffold(
     // appBar: AppBar(),
      //  endDrawer: NavBar(),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

