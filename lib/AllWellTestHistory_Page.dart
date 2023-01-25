import 'package:ashal_ver_3/WellTest_Container.dart';

import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/services/wellTest.dart';
import 'package:ashal_ver_3/well_test_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'NavBar.dart';

class AllWellTestHistoryPage extends StatefulWidget {
  String? item_uwi;
  String? item_well_completion;
  Well? item_well;


  AllWellTestHistoryPage(
      {Key? key, required this.item_uwi, required this.item_well_completion, required this.item_well})
      : super(key: key);

  @override
  State<AllWellTestHistoryPage> createState() => _AllWellTestHistoryPageState();
}

class _AllWellTestHistoryPageState extends State<AllWellTestHistoryPage> {
  @override
  Widget build(BuildContext context) {
    FetchDataApi fetchApi = FetchDataApi();

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0.24.sw,
        leading: GestureDetector(
          child: Row(
            children: [
              TextButton.icon(
                  onPressed: () {
                    //Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>MyHomePage(title: 'Flutter Demo Home Page')));
                    Navigator.of(context).popUntil(ModalRoute.withName("Home"));
                  },
                  label: Text("Wells",style: TextStyle(fontSize: 12.sp,color: Colors.blue),),
                icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.blue,),)
              //Icon(Icons.arrow_back_ios_outlined),
              // Text("Wells",style: TextStyle(fontSize: 10.sp),),
            ],
          ),
          onTap: () {
            //Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>MyHomePage(title: 'Flutter Demo Home Page')));
            Navigator.of(context).popUntil(ModalRoute.withName("/"));
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
            children: [
              Text(
               "Well Test",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.bold),
              ),
              Text(
                widget.item_uwi!,style: TextStyle(color: Colors.black,fontSize: 13.sp),
              ),
            ],
          ),
        ),
      ),
      //drawer: NavBar(),
      endDrawer: NavBar(
          uwi: widget.item_uwi, well_completion: widget.item_well_completion),

      body: Container(
        child: FutureBuilder(
          future: fetchApi.fetchWellTest("::WELL_COMPLETION_S='" +
              widget.item_well_completion! +
              "':START_TIME DESC"), //fetchApi.fetchWellTest("::WELL_COMPLETION_S='"+widget.item!.WELL_COMPLETION_S.toString()+"'"),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('Loading...'),
                ),
              );
            } else {
              List<WellTest>? ListWellTestHistory =
                  snapshot.data as List<WellTest>?;
              DateTime dt1,dt2;
              String _start_time, _end_time;
              return ListView.builder(
                itemCount: ListWellTestHistory!.length,
                itemBuilder: (context, int index) {
                  if (ListWellTestHistory[index]
                      .START_TIME
                      .toString()
                      .isNotEmpty) {
                    dt1 = DateFormat('MM/dd/yyyy hh:mm').parse(
                        ListWellTestHistory[index].START_TIME.toString());
                    _start_time = DateFormat('dd/MM/yyyy h:mm a').format(dt1);
                  } else {
                    _start_time = '';
                  }
                  //print('well test page start time = '+_start_time);
                  if (ListWellTestHistory[index]
                      .END_TIME
                      .toString()
                      .isNotEmpty) {
                    dt2 = DateFormat('MM/dd/yyyy hh:mm')
                        .parse(ListWellTestHistory[index].END_TIME.toString());
                    _end_time = DateFormat('dd/MM/yyyy h:mm a').format(dt2);
                  } else {
                    _end_time = '';
                  }
                  // print('well test page end time = '+_end_time);
                  //print(_end_time);
                  return GestureDetector(

                    //behavior: HitTestBehavior.opaque,
                    child: WellTestContainer(
                        Duration:
                            ListWellTestHistory[index].DURATION.toString(),
                        StartTime: _start_time,
                        EndTime: _end_time,
                        ID: ListWellTestHistory[index].ACTIVITY_ID.toString(),
                        ActivityName:
                            ListWellTestHistory[index].ACTIVITY_NAME.toString(),
                        ActivityType: ListWellTestHistory[index]
                            .ACTIVITY_TYPE
                            .toString(),
                    ),
                    onTap: () {
                      print('it pressed');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WellTestDetails(
                                ListWellTest: ListWellTestHistory[index],
                                ),
                                   ),
                      );
                    },
                  );
                },
              );
              //return Container();

            }
            ;
          },
          // WellTestContainer(Duration: '22',StartTime: '11/11/2020',EndTime: '01/01/2021',ID: '1234567',ActivityName: 'Only Test',ActivityType: 'WATER_CUT'),
        ),
      ),
    );
  }
}
