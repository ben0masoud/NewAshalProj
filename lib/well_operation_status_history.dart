
import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/services/wellOperationStatus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'NavBar.dart';
import 'add_well_operation_status.dart';
import 'main.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class WellOperationStatusHistory_Page extends StatefulWidget {

  String? item_uwi;
  String? item_well_completion;
  Well? item_well;

  WellOperationStatusHistory_Page({Key? key, required this.item_uwi, required this.item_well_completion,this.item_well}) : super(key: key);

  @override
  State<WellOperationStatusHistory_Page> createState() => _WellOperationStatusHistory_PageState();
}

class _WellOperationStatusHistory_PageState extends State<WellOperationStatusHistory_Page> {
  @override
  String? _well_status = "OPEN";
  Color? _statusColor = Colors.red;
  Color? _textColor = Colors.white;
  double? _size = 14.sp;
   String FirstWellStatus = "";
  String FirstWellReason = "";


  Widget build(BuildContext context) {
    FetchDataApi fetchApi = FetchDataApi();

    ScreenUtil.init(context,designSize: Size(360, 690));

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.item_uwi!)),
        leadingWidth: 75.w,
        leading: GestureDetector(
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios_outlined),
              Text("Wells",style: TextStyle(fontSize: 15.sp),),
            ],
          ),
          onTap: () {
            //Navigator.of(context).popUntil(ModalRoute.withName("/home"));
            Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>MyHomePageWithPages(title: 'Flutter Demo Home Page')));
          },
        ),
      ),
      //drawer: NavBar(),
      endDrawer: NavBar(uwi: widget.item_uwi,well_completion: widget.item_well_completion,my_well: widget.item_well),
      body: Container(
        child: FutureBuilder(
          future: fetchApi.fetchWellOperationStatus("::WELL_COMPLETION_S='"+widget.item_well_completion!+"':START_TIME DESC"),//fetchApi.fetchWellTest("::WELL_COMPLETION_S='"+widget.item!.WELL_COMPLETION_S.toString()+"'"),
          builder: (context, snapshot) {
            if(snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('Loading...'),
                ),
              );
            } else {
              List<WellOperationStatus>? ListWellOperationStatusHistory = snapshot.data as List<WellOperationStatus>?;
              if(ListWellOperationStatusHistory![0].STATUS.toString() == 'CLOSE')
                {
                  FirstWellStatus = 'OPEN';
                  FirstWellReason = ListWellOperationStatusHistory![0].STATUS_REASON.toString();
                } else {
                FirstWellStatus = 'CLOSE';
              }
              //FirstWellStatus = ListWellOperationStatusHistory![0].STATUS.toString();
              return ListView.builder(
                itemCount: ListWellOperationStatusHistory!.length,
                itemBuilder: (context,int index) {
                 // print(ListWellOperationStatusHistory[index].START_TIME!);
                  DateTime dt = DateFormat('MM/dd/yyyy hh:mm').parse(ListWellOperationStatusHistory[index].START_TIME!);
                  String _star_time = DateFormat('dd/MM/yyyy h:mm a').format(dt);
                 // print(_star_time);
                  if(ListWellOperationStatusHistory[index].STATUS == "CLOSE")
                  {
                    _well_status="Close Date:";
                    _statusColor = Colors.red;
                  }
                  else
                  {
                    _well_status="Open Date:";
                    _statusColor = Colors.green;
                  }
                  return Card(
                    child: Container(
                      width:  double.infinity,//  ScreenUtil().screenWidth,// MediaQuery.of(context).size.width,
                      height: 0.24.sh,//ScreenUtil().screenHeight * 0.2,// MediaQuery.of(context).size.height * 0.2,
                      color: _statusColor,
                      child: Padding(
                        padding:  EdgeInsets.all(8.r),
                        child: Column(
                          children: [
                            //SizedBox(height: ScreenUtil().screenHeight * 0.010),
                            SizedBox(height: 0.005.sh),
                            Row(
                              children: [
                                //SizedBox(width: ScreenUtil().screenWidth * .003,),
                                SizedBox(width: 0.005.sw),
                                Container(

                                  width: 0.30.sw,//ScreenUtil().screenWidth * .3-10,
                                  child: Text(
                                    _well_status!,
                                    //textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: _textColor,
                                      fontSize: 14.sp  ,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                ),
                                //SizedBox(width: ScreenUtil().screenWidth * .003,),
                                SizedBox(width: 0.005.sw),
                                Container(
                                  //alignment: Alignment.center,
                                  width: 0.60.sw,//ScreenUtil().screenWidth * .7-10,
                                  child: Text(

                                    //ListWellOperationStatusHistory[index].START_TIME.toString(),
                                    _star_time,
                                    //textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: _textColor,
                                        fontSize: 14.sp  ,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                //SizedBox(width: ScreenUtil().screenWidth * .003,),
                                //SizedBox(width: 0.005.sw),
                              ],
                            ),
                            //SizedBox(height: ScreenUtil().screenHeight * 0.009),
                            SizedBox(height: 0.02.sw),
                            Row(
                              children: [
                                //SizedBox(width: ScreenUtil().screenWidth * .003,),
                                SizedBox(width: 0.005.sw),
                                Container(
                                  width: 0.3.sw,//ScreenUtil().screenWidth * .3-10,
                                  child: Text("Reason:",
                                    style: TextStyle(
                                        color: _textColor,
                                        fontSize: 14.sp  ,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                //SizedBox(width: ScreenUtil().screenWidth * .003,),
                                SizedBox(width: 0.005.sw),
                                Container(
                                  //alignment: Alignment.center,
                                  width: 0.6.sw,//ScreenUtil().screenWidth * .7-10,
                                  child: Text(ListWellOperationStatusHistory[index].STATUS_REASON.toString(),textAlign: TextAlign.start,
                                    style: TextStyle(

                                        color: _textColor,
                                        fontSize: 14.sp  ,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                               // SizedBox(width: ScreenUtil().screenWidth * .003,),
                               // SizedBox(width: 0.005.sw),
                              ],
                            ),
                            SizedBox(height: ScreenUtil().screenHeight * 0.009),
                            Row(
                              children: [
                                //SizedBox(width: ScreenUtil().screenWidth * .003,),
                                SizedBox(width: 0.005.sw),
                                Container(
                                  width: 0.3.sw,
                                  child: Text("Remarks:",
                                    style: TextStyle(
                                        color: _textColor,
                                        fontSize: 14.sp  ,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                //SizedBox(width: ScreenUtil().screenWidth * .003,),
                                SizedBox(width: 0.005.sw),
                                Container(
                                  //alignment: Alignment.center,
                                  width: 0.6.sw,
                                  child: Text(ListWellOperationStatusHistory[index].REMARKS.toString(),
                                    style: TextStyle(
                                        color: _textColor,
                                        fontSize: 14.sp  ,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                //SizedBox(width: ScreenUtil().screenWidth * .003,),
                                SizedBox(width: 0.005.sw),
                              ],
                            ),
                            //SizedBox(height: ScreenUtil().screenHeight * 0.009),
                          ],
                        ),
                      ),
                    ),
                  );

                },
              );
            };
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              settings: RouteSettings(name: "AddWellOperationStatus"),
              builder: (context)=>AddWellOperationStatus(title: widget.item_well_completion.toString(),
                                                         WellStatus: FirstWellStatus,
                                                         WellReason: FirstWellReason,)
          ),
          );
        },
        tooltip: 'Add Status',
        child: const Icon(Icons.add),
      ),
    );
  }
}

