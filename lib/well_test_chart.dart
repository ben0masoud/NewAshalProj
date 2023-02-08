
import 'package:ashal_ver_3/pages/charts/flow_line_pressure_chart_page.dart';
import 'package:ashal_ver_3/pages/charts/gor_chart_page.dart';
import 'package:ashal_ver_3/pages/charts/liquid_rate_chart_page.dart';
import 'package:ashal_ver_3/pages/charts/wc_chart_page.dart';
import 'package:ashal_ver_3/pages/charts/whp_chart_page.dart';
import 'package:ashal_ver_3/services/body_post_json.dart';
import 'package:ashal_ver_3/services/fetchDataApi.dart';
//import 'package:ashal_ver_3/services/wellOperationStatus.dart';
import 'package:ashal_ver_3/services/wellTest.dart';
import 'package:ashal_ver_3/services/wph_test.dart';
//import 'package:ashal_ver_3/well_test_chart_page.dart';
//import 'package:ashal_ver_3/services/wph_test.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';

class WellTestChart extends StatefulWidget {
  String? item_uwi;
  String? item_well_completion;
  String? user;

   WellTestChart({Key? key, required this.item_uwi, required this.item_well_completion,this.user}) : super(key: key);

  @override
  State<WellTestChart> createState() => _WellTestChartState();
}

class _WellTestChartState extends State<WellTestChart> {
  @override

  late int selectedPage=0;
  bool isLoad = false;
  List<WellTest>? results;

  late List screens;

  FetchDataApi fetchApi = FetchDataApi();

//  List<WellTest>? ListWellTestHistory;
// List<WHPTest>? WHPList;
 // List<FlSpot>? _whp_Spots;
 // List<FlSpot>? _liquid_rate_Spots;
 // List<FlSpot>? _wc_Spots;
 // List<FlSpot>? _gor_Spots;
 // List<FlSpot>? _flow_line_pressure_Spots;

  initState(){
   // MidP=widget.whpList![(widget.whpList!.length/2).toInt()].date!.millisecondsSinceEpoch.toDouble();
    screens=[];
    selectedPage=0;
    isLoad = false;
    _fetchData();

    super.initState();
  }

  Future _fetchData() async {

    FetchDataApi fetchApi = FetchDataApi();
    BodyPost wellPostBody = BodyPost();
    wellPostBody.user = widget.user;
    wellPostBody.whereCondition = "WELL_COMPLETION_S='${widget.item_well_completion!}' AND ACTIVITY_NAME='PORTABLE' AND PREFFERED_FLAG='Y'";
    wellPostBody.orderBy = "START_TIME DESC";
    wellPostBody.rowsLimit = "20";

    //results = await fetchApi.fetchWellTest(":20:WELL_COMPLETION_S='" + widget.item_well_completion! + "' AND ACTIVITY_NAME='PORTABLE' AND PREFFERED_FLAG='Y':START_TIME DESC");
    results = await fetchApi.fetchWellTestPost(wellPostBody);

    List<WellTest>? ListWellTestHistory = results;// as List<WellTest>?;
    List<WHPTest>? WHPList = [];
    List<FlSpot> _whp_Spots = [];
    List<FlSpot> _liquid_rate_Spots = [];
    List<FlSpot> _wc_Spots = [];
    List<FlSpot> _gor_Spots = [];
    List<FlSpot> _flow_line_pressure_Spots = [];

    DateTime dt;
    double w;
    // int i = 0;
    //   double minY = double.maxFinite;
    //   double maxY = double.minPositive;
    List<WellTest>? ListWellHistoryRev = ListWellTestHistory!.reversed.toList();
    ListWellHistoryRev.forEach((e) {
      dt = DateFormat('MM/dd/yyyy hh:mm').parse(e.START_TIME.toString());
      print(dt);
      w = double.parse(e.WHP.toString());
      WHPList.add(WHPTest(date: dt, WHP: w));
      _whp_Spots.add(FlSpot(dt.millisecondsSinceEpoch.toDouble(), w));
      _liquid_rate_Spots.add(FlSpot(dt.millisecondsSinceEpoch.toDouble(),
          double.parse(e.LIQUID_RATE.toString())));
      _wc_Spots.add(FlSpot(
          dt.millisecondsSinceEpoch.toDouble(), double.parse(e.WC.toString())));
      _gor_Spots.add(FlSpot(dt.millisecondsSinceEpoch.toDouble(),
          double.parse(e.TOTAL_GOR.toString())));
      _flow_line_pressure_Spots.add(FlSpot(dt.millisecondsSinceEpoch.toDouble(),
          double.parse(e.FLOW_LINE_PRESSURE.toString())));
    });
    setState(() {
      screens = [
        WHPChartPage(WHPSpot: _whp_Spots),
        WCChartPage(WCSpots: _wc_Spots),
        LiquidRateChartPage(LQRateSpots: _liquid_rate_Spots),
        GORChartPage(GORSpots: _gor_Spots),
        FlowLinePressureChartPage(FLPSpots: _flow_line_pressure_Spots)

      ];
      isLoad = true;
    });

    }
  Scaffold NotEmptyPage() {

    return Scaffold(

       appBar: AppBar(),
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
  Widget build(BuildContext context) {

    if(!isLoad)
      return IsEmptyPage();
    else
      return NotEmptyPage();
  }
}



/*
class TestValues {
  TestValues({ required this.date,  required this.test});

  double date;
  double test;

}
*/


