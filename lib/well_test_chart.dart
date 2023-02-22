
import 'package:ashal_ver_3/pages/charts/flow_line_pressure_chart_page.dart';
import 'package:ashal_ver_3/pages/charts/gor_chart_page.dart';
import 'package:ashal_ver_3/pages/charts/liquid_rate_chart_page.dart';
import 'package:ashal_ver_3/pages/charts/wc_chart_page.dart';
import 'package:ashal_ver_3/pages/charts/whp_chart_page.dart';
import 'package:ashal_ver_3/services/body_post_json.dart';
import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/well.dart';
//import 'package:ashal_ver_3/services/wellOperationStatus.dart';
import 'package:ashal_ver_3/services/wellTest.dart';
import 'package:ashal_ver_3/services/wph_test.dart';
import 'package:ashal_ver_3/well_complition_list_page.dart';
//import 'package:ashal_ver_3/well_test_chart_page.dart';
//import 'package:ashal_ver_3/services/wph_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
//import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';

import 'NavBar.dart';
import 'constant_values.dart';
import 'main.dart';

class WellTestChart extends StatefulWidget {
  final String? item_uwi;
  final String? item_well_completion;
  final Well? item_well;
  List<String>? userPrivilege;
  final String? user;

   WellTestChart({Key? key, this.item_uwi,this.item_well_completion,this.item_well, this.userPrivilege,this.user}) : super(key: key);

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
    wellPostBody.whereCondition = "WELL_COMPLETION_S='${widget.item_well_completion}' AND ACTIVITY_NAME='PORTABLE' AND PREFFERED_FLAG='Y' and FLOW_LINE_PRESSURE is not null and TOTAL_GOR is not null and LIQUID_RATE is not null and WC is not null and WHP is not null";

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
      if(e.START_TIME.toString().isNotEmpty)
          dt = DateFormat('MM/dd/yyyy hh:mm').parse(e.START_TIME.toString());
      else
        dt=DateFormat('MM/dd/yyyy hh:mm').parse(DateTime.now().toString());

      print(dt);
      if(e.WHP.toString().isNotEmpty) {
        w = double.parse(e.WHP.toString());
        WHPList.add(WHPTest(date: dt, WHP: w));
        _whp_Spots.add(FlSpot(dt.millisecondsSinceEpoch.toDouble(), w));
      }
      if(e.LIQUID_RATE.toString().isNotEmpty) _liquid_rate_Spots.add(FlSpot(dt.millisecondsSinceEpoch.toDouble(), double.parse(e.LIQUID_RATE.toString())));
      if(e.WC.toString().isNotEmpty) _wc_Spots.add(FlSpot(dt.millisecondsSinceEpoch.toDouble(), double.parse(e.WC.toString())));
      if(e.TOTAL_GOR.toString().isNotEmpty) _gor_Spots.add(FlSpot(dt.millisecondsSinceEpoch.toDouble(), double.parse(e.TOTAL_GOR.toString())));
      if(e.FLOW_LINE_PRESSURE.toString().isNotEmpty) _flow_line_pressure_Spots.add(FlSpot(dt.millisecondsSinceEpoch.toDouble(), double.parse(e.FLOW_LINE_PRESSURE.toString())));
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

      appBar: AppBar(
        backgroundColor: ConstantValues.MainColor1,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Center(
            child: Column(
              children: [
                Text('Well Chart',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text('${widget.item_uwi} ${widget.item_well!.FACILITY_NAME} - ${widget.item_well!.FACILITY_ID}',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ],
            )),
        leadingWidth: 75.w,
        leading: GestureDetector(
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios_outlined,color: Colors.blue,),
              Text("Wells",style: TextStyle(fontSize: 15.sp,color: Colors.blue),),
            ],
          ),
          onTap: () {
            Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>WellCompletionListPage(title: 'Flutter Demo Home Page')));
            //Navigator.of(context).popUntil(ModalRoute.withName('wellcompletionlist'));
          },
        ),
      ),
      endDrawer: NavBar(uwi: widget.item_well!.UWI,well_completion: widget.item_well!.WELL_COMPLETION_S,my_well: widget.item_well,userPrivilege: widget.userPrivilege,user:widget.user),
      // endDrawer: NavBar(),
      body: screens[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.compress_outlined), label: 'WHP'),
            BottomNavigationBarItem(
                icon: Icon(Icons.water_drop_outlined),
                label: 'WC'),
            BottomNavigationBarItem(
                icon: Icon(Icons.water),
                label: 'LQ'),
            BottomNavigationBarItem(
                icon: Icon(Icons.oil_barrel_outlined), label: 'GOR'),
            BottomNavigationBarItem(
                icon: Icon(Icons.line_axis_rounded),
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


