

import 'package:ashal_ver_3/unused_files/page1.dart';
import 'package:ashal_ver_3/unused_files/page2.dart';
import 'package:ashal_ver_3/services/body_post_json.dart';
import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/services/wellTest.dart';
import 'package:ashal_ver_3/pages/wellCompletion/well_complition_list_page.dart';
import 'package:ashal_ver_3/pages/well_test/well_test_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../wire_line_activity/AllWellTestHistory_Page.dart';
import '../../services/NavBar.dart';
import '../../services/constant_values.dart';

class WellTestAndChartPage extends StatefulWidget {

  final String? item_uwi;
  final String? item_well_completion;
  final Well? item_well;
  final List<String>? userPrivilege;
  final String? user;
  final List<Well>? wells;

   WellTestAndChartPage({Key? key,required this.item_uwi, required this.item_well_completion, required this.item_well,this.userPrivilege,this.user,this.wells}) : super(key: key);

  @override
  State<WellTestAndChartPage> createState() => _WellTestAndChartPageState();
}


class _WellTestAndChartPageState extends State<WellTestAndChartPage> {


  late int selectedPage=0;
  bool isLoad = false;
 //late List<WellTest>? results;
  BodyPost wellPostBody = BodyPost();
  FetchDataApi fetchApi = FetchDataApi();

   late List screens;

  var results;



  late List<WellTest>? well_test_list ;
  late List<WellTest>? well_chart_list ;
  late List<WellTest>? well_wc_test_list;
  late List<WellTest>? well_liguidRate_test_list;
  late List<WellTest>? well_FLP_test_list;
  late List<WellTest>? well_WHP_test_list;
  late List<WellTest>? well_pressure_test_list;
 // late List<HeaderCompConnection?> header_comp_list ;
 // late List<SlotCompConnection?> slote_comp_list ;



  Future _fetchData() async {
    screens=[];
     wellPostBody.user =widget.user;
     wellPostBody.whereCondition = "WELL_COMPLETION_S='${widget.item_well_completion!}'";
     wellPostBody.orderBy = "START_TIME DESC";
    //results = await fetchApi.fetchWellTest(":20:WELL_COMPLETION_S='" + widget.item_well_completion! + "' AND ACTIVITY_NAME='PORTABLE' AND PREFFERED_FLAG='Y':START_TIME DESC");
    results = await fetchApi.fetchWellTestPost(wellPostBody);
    well_test_list = results;

    wellPostBody.whereCondition = "WELL_COMPLETION_S='${widget.item_well_completion}' AND ACTIVITY_NAME='PORTABLE' AND PREFFERED_FLAG='Y' and TOTAL_GOR is not null";// and LIQUID_RATE is not null and WC is not null and WHP is not null";
    wellPostBody.orderBy = "START_TIME DESC";
    //wellPostBody.rowsLimit = "20";
    //results = await fetchApi.fetchWellTest(":20:WELL_COMPLETION_S='" + widget.item_well_completion! + "' AND ACTIVITY_NAME='PORTABLE' AND PREFFERED_FLAG='Y':START_TIME DESC");
    results = await fetchApi.fetchWellTestPost(wellPostBody);
    well_chart_list = results;

    wellPostBody.whereCondition = "WELL_COMPLETION_S='${widget.item_well_completion}' AND WC_FLAG='Y' AND WC is not null";
    wellPostBody.orderBy = "START_TIME DESC";
    //wellPostBody.rowsLimit = "20";
    //results = await fetchApi.fetchWellTest(":20:WELL_COMPLETION_S='" + widget.item_well_completion! + "' AND ACTIVITY_NAME='PORTABLE' AND PREFFERED_FLAG='Y':START_TIME DESC");
    results = await fetchApi.fetchWellTestPost(wellPostBody);
    well_wc_test_list = results;

    wellPostBody.whereCondition = "WELL_COMPLETION_S='${widget.item_well_completion}' AND PREFFERED_FLAG='Y' and LIQUID_RATE is not null";
    results = await fetchApi.fetchWellTestPost(wellPostBody);
    well_liguidRate_test_list = results;

    wellPostBody.whereCondition = "WELL_COMPLETION_S='${widget.item_well_completion}' AND PRESSURE_FLAG='Y' and FLOW_LINE_PRESSURE is not null AND WHP is not null";
    results = await fetchApi.fetchWellTestPost(wellPostBody);
    well_FLP_test_list = results;
    well_WHP_test_list = results;
    well_pressure_test_list = results;

    setState(() {
      /*
      screens = [
        GcCompConnectionPage(
          gc_comp_list: gc_comp_list, gc_header_slot: 'GC',),
        HeaderCompConnectionPage(
          header_comp_list: header_comp_list, gc_header_slot: 'Header',),
        SLotCompConnectionPage(
          slot_comp_list: slote_comp_list, gc_header_slot: 'Slote',),


      ];

       */
      screens=[
        AllWellTestHistoryPage(item_well: widget.item_well,ListWellTestHistory: well_test_list),
        WellTestChart(item_well: widget.item_well,ListWellTestHistory: well_chart_list,
          ListWCTestHistory: well_wc_test_list,ListLQRateTestHistory: well_liguidRate_test_list,
          ListFLPTestHistory: well_FLP_test_list,ListWHPTestHistory: well_WHP_test_list,ListPressureTestHistory: well_pressure_test_list,)
      ];
      isLoad = true;
    });

  }

  initState(){
    well_test_list =[];
    screens=[];
    selectedPage=0;
    isLoad = false;
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {

    if(!isLoad)
      return IsEmptyPage();
    else
      return NotEmptyPage();


  }
  Scaffold NotEmptyPage() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantValues.MainColor1,
        iconTheme: IconThemeData(color: Colors.blue),
        leadingWidth: 0.24.sw,
        leading: GestureDetector(
          child: Row(
            children: [
              TextButton.icon(
                onPressed: () {
                  //Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>MyHomePage(title: 'Flutter Demo Home Page')));
                  Navigator.of(context).popUntil(ModalRoute.withName("wellcompletionlist"));
                },
                label: Text("Wells",style: TextStyle(fontSize: 12.sp,color: Colors.blue),),
                icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.blue,),)
              //Icon(Icons.arrow_back_ios_outlined),
              // Text("Wells",style: TextStyle(fontSize: 10.sp),),
            ],
          ),
          onTap: () {
            //Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>WellCompletionListPage(title: 'Flutter Demo Home Page')));
           // Navigator.of(context).popUntil(ModalRoute.withName("/"));
          },
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: (){
                  Scaffold.of(context).openEndDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                icon: Icon(Icons.menu),

                color: Colors.blue,
              );
            },
          ),
        ],
        title: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Well Test',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text('${widget.item_well!.UWI} ${widget.item_well!.FACILITY_NAME} - ${widget.item_well!.FACILITY_ID}',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ],
            )),
      ),
      //drawer: NavBar(),
      endDrawer: NavBar(uwi: widget.item_well!.UWI,well_completion: widget.item_well!.WELL_COMPLETION_S,my_well: widget.item_well,userPrivilege: widget.userPrivilege,user:widget.user,wells: widget.wells,),

      body: screens[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list),label: 'List'),
            BottomNavigationBarItem(icon: Icon(Icons.show_chart),label: 'Chart')
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
      appBar: AppBar(),
      //  endDrawer: NavBar(),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}


