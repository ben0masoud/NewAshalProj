
import 'package:ashal_ver_3/services/access_info.dart';
import 'package:ashal_ver_3/services/body_post_json.dart';
import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/services/wellOperationStatus.dart';
import 'package:ashal_ver_3/well_complition_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'NavBar.dart';
import 'add_well_operation_status.dart';
import 'constant_values.dart';
import 'main.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class WellOperationStatusHistory_Page extends StatefulWidget {

  String? item_uwi;
  String? item_well_completion;
  Well? item_well;
  List<String>? userPrivilege;
  String? user;
  List<Well>? wells;

  WellOperationStatusHistory_Page({Key? key, required this.item_uwi, required this.item_well_completion,this.item_well,this.userPrivilege,this.user,this.wells}) : super(key: key);

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
  String FirstStatusDate = "";
  //bool found = false;
  @override
  // void initState() {
  //   // TODO: implement initState
  //   setState(() {
  //     found = widget.userPrivilege!.FORM_GROUP_ID.contains('PO_OPERATOR_GC');
  //   });
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    FetchDataApi fetchApi = FetchDataApi();
    BodyPost wellPostBody = BodyPost();


    ScreenUtil.init(context,designSize: Size(360, 690));

    //"::WELL_COMPLETION_S='"+widget.item_well_completion!+"':START_TIME DESC"
    wellPostBody.user = widget.user;
    wellPostBody.whereCondition = "WELL_COMPLETION_S='${widget.item_well_completion}'";
    wellPostBody.orderBy = "START_TIME DESC";

    return Scaffold(
      appBar: AppBar(

        backgroundColor: ConstantValues.MainColor1,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Operation Status',
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
            Navigator.of(context).popUntil(ModalRoute.withName('wellcompletionlist'));
            //Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>WellCompletionListPage(title: 'Flutter Demo Home Page')));
          },
        ),
      ),
      //drawer: NavBar(),
      endDrawer: NavBar(uwi: widget.item_uwi,well_completion: widget.item_well_completion,my_well: widget.item_well,userPrivilege: widget.userPrivilege,user:widget.user,wells: widget.wells,),
      body: Container(
        child: FutureBuilder(
          future: fetchApi.fetchWellOperationStatusPost(wellPostBody),//fetchApi.fetchWellTest("::WELL_COMPLETION_S='"+widget.item!.WELL_COMPLETION_S.toString()+"'"),
          builder: (context, snapshot) {
            //print(snapshot.data);
            if(snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('Loading...'),
                ),
              );
            } else {

                    List<WellOperationStatus>? ListWellOperationStatusHistory = snapshot.data as List<WellOperationStatus>?;
                    if(ListWellOperationStatusHistory!.length>0) {
                    //print(ListWellOperationStatusHistory!.length);
                        if (ListWellOperationStatusHistory![0].STATUS!.isNotEmpty) {
                          if (ListWellOperationStatusHistory![0].STATUS
                              .toString() == 'CLOSE') {
                            FirstWellStatus = 'OPEN';
                            FirstWellReason =
                                ListWellOperationStatusHistory![0].STATUS_REASON
                                    .toString();
                          } else {
                            FirstWellStatus = 'CLOSE';
                          }
                        } else {
                          FirstWellStatus = "";
                          FirstWellReason = "";
                        }
                    //FirstWellStatus = ListWellOperationStatusHistory![0].STATUS.toString();
                      return ListView.builder(
                      itemCount: ListWellOperationStatusHistory!.length,
                      itemBuilder: (context, int index) {
                        // print(ListWellOperationStatusHistory[index].START_TIME!);
                        DateTime dt = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(
                            ListWellOperationStatusHistory[index].START_TIME!);
                        String _star_time = DateFormat('dd/MM/yyyy hh:mm a')
                            .format(dt);
                        if (index == 0) {
                          FirstStatusDate = _star_time;
                        }
                        // print(_star_time);
                        if (ListWellOperationStatusHistory[index].STATUS ==
                            "CLOSE") {
                          _well_status = "Close Date:";
                          _statusColor = Colors.red;
                        }
                        else {
                          _well_status = "Open Date:";
                          _statusColor = Colors.green;
                        }
                        return Card(
                          child: Container(
                            width: double.infinity,
                            //  ScreenUtil().screenWidth,// MediaQuery.of(context).size.width,
                            height: 0.24.sh,
                            //ScreenUtil().screenHeight * 0.2,// MediaQuery.of(context).size.height * 0.2,
                            color: _statusColor,
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: Column(
                                children: [
                                  //SizedBox(height: ScreenUtil().screenHeight * 0.010),
                                  SizedBox(height: 0.005.sh),
                                  Row(
                                    children: [
                                      //SizedBox(width: ScreenUtil().screenWidth * .003,),
                                      SizedBox(width: 0.005.sw),
                                      Container(

                                        width: 0.30.sw,
                                        //ScreenUtil().screenWidth * .3-10,
                                        child: Text(
                                          _well_status!,
                                          //textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: _textColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,

                                          ),
                                        ),
                                      ),
                                      //SizedBox(width: ScreenUtil().screenWidth * .003,),
                                      SizedBox(width: 0.005.sw),
                                      Container(
                                        //alignment: Alignment.center,
                                        width: 0.60.sw,
                                        //ScreenUtil().screenWidth * .7-10,
                                        child: Text(

                                          //ListWellOperationStatusHistory[index].START_TIME.toString(),
                                          _star_time,
                                          //textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: _textColor,
                                              fontSize: 14.sp,
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
                                        width: 0.3.sw,
                                        //ScreenUtil().screenWidth * .3-10,
                                        child: Text("Reason:",
                                          style: TextStyle(
                                              color: _textColor,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      //SizedBox(width: ScreenUtil().screenWidth * .003,),
                                      SizedBox(width: 0.005.sw),
                                      Container(
                                        //alignment: Alignment.center,
                                        width: 0.6.sw,
                                        //ScreenUtil().screenWidth * .7-10,
                                        child: Text(
                                          ListWellOperationStatusHistory[index]
                                              .STATUS_REASON.toString(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(

                                              color: _textColor,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      // SizedBox(width: ScreenUtil().screenWidth * .003,),
                                      // SizedBox(width: 0.005.sw),
                                    ],
                                  ),
                                  SizedBox(height: ScreenUtil().screenHeight *
                                      0.009),
                                  Row(
                                    children: [
                                      //SizedBox(width: ScreenUtil().screenWidth * .003,),
                                      SizedBox(width: 0.005.sw),
                                      Container(
                                        width: 0.3.sw,
                                        child: Text("Remarks:",
                                          style: TextStyle(
                                              color: _textColor,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      //SizedBox(width: ScreenUtil().screenWidth * .003,),
                                      SizedBox(width: 0.005.sw),
                                      Container(
                                        //alignment: Alignment.center,
                                        width: 0.6.sw,
                                        child: Text(
                                          ListWellOperationStatusHistory[index]
                                              .REMARKS.toString(),
                                          style: TextStyle(
                                              color: _textColor,
                                              fontSize: 14.sp,
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
                  } else
                      return Center(child: Text('No Data'),);
               };
          },
        ),
      ),
      floatingActionButton: _getFAB(widget.userPrivilege!.contains('PO_OPERATOR_GC')),
    );


  }
  Widget _getFAB(bool found) {
    if(found) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              settings: RouteSettings(name: "AddWellOperationStatus"),
              builder: (context) =>
                  AddWellOperationStatus(
                      title: widget.item_well_completion.toString(),
                      WellStatus: FirstWellStatus,
                      WellReason: FirstWellReason,
                      StatusDate: FirstStatusDate,
                      WellCompletion: widget.item_well_completion,
                       user: widget.user,)
          ),
          );
        },
        tooltip: 'Add Status',
        child: const Icon(Icons.add),
      );
    }
    else {
      return Container();
    }
  }
}

