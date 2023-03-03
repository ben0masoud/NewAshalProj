
// import 'package:ashal_ver_3/pages/charts/flow_line_pressure_chart_page.dart';
// import 'package:ashal_ver_3/pages/charts/gor_chart_page.dart';
// import 'package:ashal_ver_3/pages/charts/liquid_rate_chart_page.dart';
// import 'package:ashal_ver_3/pages/charts/wc_chart_page.dart';
// import 'package:ashal_ver_3/pages/charts/whp_chart_page.dart';
// import 'package:ashal_ver_3/services/body_post_json.dart';
// import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/well.dart';
//import 'package:ashal_ver_3/services/wellOperationStatus.dart';
import 'package:ashal_ver_3/services/wellTest.dart';
import 'package:ashal_ver_3/show_chart_page.dart';
// import 'package:ashal_ver_3/services/wph_test.dart';
// import 'package:ashal_ver_3/well_complition_list_page.dart';
import 'package:ashal_ver_3/widgets/container_chart.dart';
//import 'package:ashal_ver_3/well_test_chart_page.dart';
//import 'package:ashal_ver_3/services/wph_test.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
//import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:fl_chart/fl_chart.dart';
//
// import 'NavBar.dart';
// import 'constant_values.dart';
// import 'main.dart';

class WellTestChart extends StatefulWidget {
  final Well? item_well;
  final List<WellTest>? ListWellTestHistory;
  final List<WellTest>? ListWCTestHistory;
  final List<WellTest>? ListLQRateTestHistory;
  final List<WellTest>? ListFLPTestHistory;
  final List<WellTest>? ListWHPTestHistory;
  final List<WellTest>? ListPressureTestHistory;

   WellTestChart({Key? key, this.item_well,this.ListWellTestHistory,this.ListWCTestHistory,this.ListLQRateTestHistory,this.ListFLPTestHistory,this.ListWHPTestHistory,this.ListPressureTestHistory}) : super(key: key);

  @override
  State<WellTestChart> createState() => _WellTestChartState();
}

class _WellTestChartState extends State<WellTestChart> {
 // late int selectedPage=0;
  bool isLoad = false;
  List<WellTest>? results;

//  late List screens;
  late List<TestData> liquid_rate_list;
  late List<TestData> wc_list;
  late List<TestData> gor_list;
  late List<TestData> flow_line_pressure_list;
  late List<TestData> well_head_pressure_list;
  late List<TestData> pressure_list;


  //FetchDataApi fetchApi = FetchDataApi();

//  List<WellTest>? ListWellTestHistory;
// List<WHPTest>? WHPList;
 // List<FlSpot>? _whp_Spots;
 // List<FlSpot>? _liquid_rate_Spots;
 // List<FlSpot>? _wc_Spots;
 // List<FlSpot>? _gor_Spots;
 // List<FlSpot>? _flow_line_pressure_Spots;

  initState(){
   // MidP=widget.whpList![(widget.whpList!.length/2).toInt()].date!.millisecondsSinceEpoch.toDouble();
  //  screens=[];
 //   selectedPage=0;
    isLoad = false;
    _fetchData();

    super.initState();
  }

   _fetchData()  {

  /*
  FetchDataApi fetchApi = FetchDataApi();
    BodyPost wellPostBody = BodyPost();
    wellPostBody.user = widget.user;
    wellPostBody.whereCondition = "WELL_COMPLETION_S='${widget.item_well_completion}' AND ACTIVITY_NAME='PORTABLE' AND PREFFERED_FLAG='Y' and FLOW_LINE_PRESSURE is not null and TOTAL_GOR is not null and LIQUID_RATE is not null and WC is not null and WHP is not null";

    wellPostBody.orderBy = "START_TIME DESC";
    wellPostBody.rowsLimit = "20";

    //results = await fetchApi.fetchWellTest(":20:WELL_COMPLETION_S='" + widget.item_well_completion! + "' AND ACTIVITY_NAME='PORTABLE' AND PREFFERED_FLAG='Y':START_TIME DESC");
    results = await fetchApi.fetchWellTestPost(wellPostBody);

    List<WellTest>? ListWellTestHistory = results;// as List<WellTest>?;
    */
   // List<WHPTest>? WHPList = [];
 //   List<FlSpot> _whp_Spots = [];
 //   List<FlSpot> _liquid_rate_Spots = [];
 //   List<FlSpot> _wc_Spots = [];
//    List<FlSpot> _gor_Spots = [];
 //   List<FlSpot> _flow_line_pressure_Spots = [];
   // List<TestData> wc_list = [];

    liquid_rate_list = [];
    wc_list = [];
    gor_list = [];
    flow_line_pressure_list = [];
    well_head_pressure_list = [];
    pressure_list = [];

    DateTime dt;
    double w;
    // int i = 0;
    //   double minY = double.maxFinite;
    //   double maxY = double.minPositive;
    List<WellTest>? ListWellHistoryRev = widget.ListWellTestHistory!.reversed.toList();
    List<WellTest>? ListWCHistoryRev = widget.ListWCTestHistory!.reversed.toList();
    List<WellTest>? ListLQRateTestHistoryRev = widget.ListLQRateTestHistory!.reversed.toList();
    List<WellTest>? ListFLPTestHistoryRev = widget.ListFLPTestHistory!.reversed.toList();
    List<WellTest>? ListWHPTestHistoryRev = widget.ListWHPTestHistory!.reversed.toList();
    List<WellTest>? ListPressureTestHistoryRev = widget.ListPressureTestHistory!.reversed.toList();
    ListWCHistoryRev.forEach((e) {
      if ((e.START_TIME
          .toString()
          .isNotEmpty) && (e.WC.toString().isNotEmpty))
      {
                dt = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(e.START_TIME.toString());
                //_wc_Spots.add(FlSpot(dt.millisecondsSinceEpoch.toDouble(), double.parse(e.WC.toString())));
                wc_list.add(TestData(date: dt, value: double.parse(e.WC.toString()))
      );
      }

    });
    ListLQRateTestHistoryRev.forEach((e) {
      if ((e.START_TIME
          .toString()
          .isNotEmpty) && (e.LIQUID_RATE.toString().isNotEmpty) ) {
        dt = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(e.START_TIME.toString());
        //_wc_Spots.add(FlSpot(dt.millisecondsSinceEpoch.toDouble(), double.parse(e.WC.toString())));
        liquid_rate_list.add(
            TestData(date: dt, value: double.parse(e.LIQUID_RATE.toString()))
        );
      }

    });
    ListFLPTestHistoryRev.forEach((e) {
      if ((e.START_TIME
          .toString()
          .isNotEmpty) && (e.FLOW_LINE_PRESSURE.toString().isNotEmpty))
        {
            dt = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(e.START_TIME.toString());
            //_wc_Spots.add(FlSpot(dt.millisecondsSinceEpoch.toDouble(), double.parse(e.WC.toString())));
            flow_line_pressure_list.add(TestData(date: dt, value: double.parse(e.FLOW_LINE_PRESSURE.toString())));
      }

    });
    ListWHPTestHistoryRev.forEach((e) {
      if ((e.START_TIME
          .toString()
          .isNotEmpty) && (e.WHP.toString().isNotEmpty))
      {
        dt = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(e.START_TIME.toString());
        //_wc_Spots.add(FlSpot(dt.millisecondsSinceEpoch.toDouble(), double.parse(e.WC.toString())));
        well_head_pressure_list.add(
            TestData(date: dt, value: double.parse(e.WHP.toString()))
        );
      }

    });
    ListPressureTestHistoryRev.forEach((e) {
      if ((e.START_TIME
          .toString()
          .isNotEmpty) && (e.FLOW_LINE_PRESSURE.toString().isNotEmpty) && (e.WHP.toString().isNotEmpty))
      {
        dt = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(e.START_TIME.toString());
        //_wc_Spots.add(FlSpot(dt.millisecondsSinceEpoch.toDouble(), double.parse(e.WC.toString())));
        pressure_list.add(
            TestData(
                date:dt,
                value: double.parse(e.FLOW_LINE_PRESSURE.toString()),
                value1: double.parse(e.WHP.toString())
            )
        );

      }

    });
    ListWellHistoryRev.forEach((e) {
      if ((e.START_TIME
          .toString()
          .isNotEmpty) && (e.TOTAL_GOR.toString().isNotEmpty))
      {
          dt = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(e.START_TIME.toString());
        //_gor_Spots.add(FlSpot(dt.millisecondsSinceEpoch.toDouble(), double.parse(e.TOTAL_GOR.toString())));
        gor_list.add(
            TestData(date: dt, value: double.parse(e.TOTAL_GOR.toString()))
        );
      }


    });
    setState(() {
     /* screens = [
        WHPChartPage(WHPSpot: _whp_Spots),
        WCChartPage(WCSpots: _wc_Spots),
        LiquidRateChartPage(LQRateSpots: _liquid_rate_Spots),
        GORChartPage(GORSpots: _gor_Spots),
        FlowLinePressureChartPage(FLPSpots: _flow_line_pressure_Spots)

      ];*/
      isLoad = true;
    });

    }
  Scaffold NotEmptyPage() {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
                child: ContainerChart(test: liquid_rate_list,more: false,title: 'Liquid Rate Test'),
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              ShowChartPage(list: liquid_rate_list,more: false,title: 'Liquid Rate Test',),
                          settings: RouteSettings(name: "ShowChartPage")
                      ));

                },
            ),
            GestureDetector(
              child: ContainerChart(test: wc_list,more: false,title: 'Water Cut Test'),
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            ShowChartPage(list: wc_list,more: false,title: 'Water Cut Test',),
                        settings: RouteSettings(name: "ShowChartPage")
                    ));

              },
            ),
            GestureDetector(
              child: ContainerChart(test:  gor_list,more: false,title: 'GOR Test'),
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            ShowChartPage(list:  gor_list,more: false,title: 'GOR Test'),
                        settings: RouteSettings(name: "ShowChartPage")
                    ));

              },
            ),
            GestureDetector(
              child: ContainerChart(test: pressure_list,more: true,title: 'Pressure Test'),
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            ShowChartPage(list: pressure_list,more: true,title: 'Pressure Test'),
                        settings: RouteSettings(name: "ShowChartPage")
                    ));

              },
            ),
           // ContainerChart(test: wc_list,title: 'Water Cut Test'),
           // ContainerChart(test: gor_list,title: 'GOR Test'),
           // ContainerChart(test: flow_line_pressure_list,title: 'Flow Line Pressure Test'),
          ],
        ),
      )

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


