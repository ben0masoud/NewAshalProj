import 'package:ashal_ver_3/services/body_post_json.dart';
import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/services/wellTest.dart';
import 'package:ashal_ver_3/services/wirelineActivity.dart';
import 'package:ashal_ver_3/well_test_details.dart';
import 'package:ashal_ver_3/well_complition_list_page.dart';
import 'package:ashal_ver_3/wire_line_activity_history_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'NavBar.dart';
import 'constant_values.dart';
import 'main.dart';

class WireLineActivityHistoryPage extends StatefulWidget {
  String? item_uwi;
  String? item_well_completion;
  Well? item_well;
  List<String>? userPrivilege;
  String? user;
  List<Well>? wells;

  WireLineActivityHistoryPage(
      {Key? key, required this.item_uwi, required this.item_well_completion,this.item_well,this.userPrivilege,this.user,this.wells})
      : super(key: key);

  @override
  State<WireLineActivityHistoryPage> createState() =>
      _WireLineActivityHistoryPageState();
}

class _WireLineActivityHistoryPageState
    extends State<WireLineActivityHistoryPage> {
  @override
  FetchDataApi fetchApi = FetchDataApi();
  BodyPost wellPostBody = BodyPost();
  List<String?> OilCompany = [
    'FPS',
    'EXPERTEST',
    'BJ',
    'GDMC',
    'GOFSC',
    'GOFSCO',
    'HLS',
    'NPSC',
    'SLB',
    'SPETCO',
    'WeatherFord'
  ];

  Widget buildCompanyCard(List<WirelineActivity?> list, int i) {

    DateTime dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse( list[i]!.START_TIME.toString());
    String _start_time = DateFormat('dd/MM/yyyy hh:mm a').format(dt1);

    return GestureDetector(
      onTap: (){
        {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WireLineActivityHistoryDetialPage(
                        item: list[i])),
          );
        }
      },
      child: Padding(
        padding:  EdgeInsets.all(5.r),
        child: Stack(
          children: [
            Card(
              child: Padding(
                padding:  EdgeInsets.all(5.r),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Image.asset(
                            //'assets/no-image-available.jpeg',
                            OilCompany.indexOf(list[i]!.CONTRACTOR) >
                                -1 //where((item) => item == list[i]!.CONTRACTOR)
                                ? 'assets/company/${list[i]!.CONTRACTOR}.png'
                                : 'assets/company/NoLogo.png',
                            height: 0.15.sh,
                            width: 0.3.sw,
                            fit: BoxFit.fitWidth,
                          ),
                          Text(list[i]!.CONTRACTOR.toString(),style: TextStyle(fontSize: 15.sp),),

                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          Text(
                            list[i]!.ACTIVITY_NAME.toString(),
                            style:
                            TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          Text(
                            list[i]!.STATUS.toString(),
                            style:
                            TextStyle(fontSize: 15.sp, fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          Text(
                            _start_time,
                            style:
                            TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            if((list[i]!.ACTIVITY_NAME == 'PORTABLE TEST (GOR)') && (list[i]!.STATUS == 'Successful'))
              Align(
              child: GestureDetector(
                child: Icon(
                  Icons.flag,
                  color: Colors.red,
                  size: 36,
                ),
                onTap: () {
                  _getWellTestInfo('PORTABLE', list[i]!.START_TIME);
                }
              ),
              alignment: Alignment.topLeft,
            )
          ]
        ),
      ),
    );
  }

  _getWellTestInfo(String str,String? start_time) async{
    DateTime dt = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(start_time!);
    String _start_time = DateFormat('MM-dd-yyyy').format(dt);

    wellPostBody.user =widget.user;
    wellPostBody.whereCondition = "WELL_COMPLETION_S='${widget.item_well_completion!}' and ACTIVITY_NAME= '${str}' and Convert(date,START_TIME) = '${_start_time}'";
   // wellPostBody.orderBy = "START_TIME DESC";
    List<WellTest>? ListWellTestHistory  = await fetchApi.fetchWellTestPost(wellPostBody);
   // List<WellTest>? ListWellTestHistory  = await fetchApi.fetchWellTest("::WELL_COMPLETION_S='${widget.item_well_completion!}' and ACTIVITY_NAME= '${str}' and Convert(date,START_TIME) = '${_start_time}'");
    if (ListWellTestHistory!.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WellTestDetails(
            ListWellTest: ListWellTestHistory[0],
            item_well: widget.item_well,
          ),
        ),
      );
    } else {

    }
  }
  Widget build(BuildContext context) {
    //final List<WirelineActivity?> ListWirelineActivityHistory = [];
    wellPostBody.user = widget.user;
    wellPostBody.whereCondition = "UWI='${widget.item_uwi}'";
    wellPostBody.orderBy = "START_TIME DESC";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantValues.MainColor1,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Center(
            child: Column(
              children: [
                Text('Wireline Activity',
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
        leadingWidth: 75.w,
        leading: GestureDetector(
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios_outlined,color: Colors.blue,),
              Text("Wells",style: TextStyle(fontSize: 15.sp,color: Colors.blue),),
            ],
          ),
          onTap: () {
            //Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>WellCompletionListPage(title: 'Flutter Demo Home Page')));
            Navigator.of(context).popUntil(ModalRoute.withName("wellcompletionlist"));
          },
        ),
      ),
      endDrawer: NavBar(uwi: widget.item_well!.UWI,well_completion: widget.item_well!.WELL_COMPLETION_S,my_well: widget.item_well,userPrivilege: widget.userPrivilege,user:widget.user,wells: widget.wells,),
      body: Container(
        child: FutureBuilder(
          future: fetchApi.fetchWirelineActivityPost(wellPostBody),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('Loading...'),
                ),
              );
            } else {
              List<WirelineActivity?> ListWirelineActivityHistory =
                  snapshot.data as List<WirelineActivity?>;
              return (ListWirelineActivityHistory.length > 0) ? ListView.builder(
                  itemCount: (ListWirelineActivityHistory == null)
                      ? 0
                      : ListWirelineActivityHistory.length,
                  itemBuilder: (context, int index) {
                    return buildCompanyCard(ListWirelineActivityHistory, index);
                    /*
                                        ListTile(
                                          leading:  Container(
                                            //alignment: Alignment.center,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                              //Icon(Icons.circle,color:Colors.green),
                                              //Image(image: AssetImage('assets/no-image-available.jpeg')),
                                              Image.asset(
                                                  //'assets/no-image-available.jpeg',
                                                OilCompany.contains(ListWirelineActivityHistory[index]!.CONTRACTOR)
                                                    ? 'assets/company/${ListWirelineActivityHistory[index]!.CONTRACTOR}.png'
                                                    : 'assets/company/NoLogo.png',
                                                   height: 50,
                                                   width:  50,
                                                   fit: BoxFit.fitWidth,
                                              ),
                                              Text(ListWirelineActivityHistory[index]!.CONTRACTOR.toString())
                                              ],
                                            ),
                                          ),
                                        title: Column(
                                          children: [
                                            Text(ListWirelineActivityHistory[index]!.ACTIVITY_NAME.toString()),
                                            Text(ListWirelineActivityHistory[index]!.STATUS.toString())
                                          ],
                                        ),
                                        subtitle: Text(ListWirelineActivityHistory[index]!.START_TIME.toString()),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder:
                                                (context) => WireLineActivityHistoryDetialPage(item: ListWirelineActivityHistory[index])),
                                          );
                                        },
                                      );
                                        */
                  }) : Center(child: Text('No Data'),);
            }
            ;
          },
        ),
      ),
    );
  }
}
