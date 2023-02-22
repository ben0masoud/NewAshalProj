
import 'dart:convert';

import 'package:ashal_ver_3/services/body_post_json.dart';
import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/well_op_status_reason.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:quiver/testing/src/time/time.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:darq/darq.dart';

class AddWellOperationStatus extends StatefulWidget {
  const AddWellOperationStatus({Key? key, required this.title, required this.WellStatus,this.WellReason,this.StatusDate,this.WellCompletion,this.user}) : super(key: key);
  final String title;
  final String WellStatus;
  final String? WellReason;
  final String? StatusDate;
  final String? WellCompletion;
  final String? user;

  @override
  State<AddWellOperationStatus> createState() => _AddWellOperationStatusState();
}

class _AddWellOperationStatusState extends State<AddWellOperationStatus> {



  FetchDataApi fetchApi = FetchDataApi();
 // PostWellOpStatus _postWellOpStatus
  PostWellOpStatus post_well_op_status = PostWellOpStatus(proc_name: "" ,WellParams: []);

 /* late List<WellOpStatusReason?> AllWellsOp;
  late List<WellOpStatusReason?> level1;
  late List<WellOpStatusReason?> level2;
  late List<WellOpStatusReason?> Reason;
  late List<WellOpStatusReason?> Category;*/
  var AllWellsOp = [];
  var StatusType = [];
  List<dynamic> level1 = [];
  List<dynamic> level2 = [];
  List<dynamic> Reason = [];
  List<dynamic> lvl1 = [];
  List<dynamic> lvl2 = [];
  List<dynamic> Rsn = [];
  var Category =[];

  var result;
 // bool? isClicked;

  String? statusTypeId='';
  String? level1Id='';
  String? level2Id='';
  String? reasonId='';
  int? groupValue=0;
  String? status_rsn;

  BodyPost wellPostBody = BodyPost();

  bool isStatusSelected = false;
  bool isLevel1Selected = false;
  TextEditingController _descController = TextEditingController();
  TextEditingController _remarkController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
 // PostWellOpStatus post_well_op_status = PostWellOpStatus();


  void initState() {
    AllWellsOp = [];
    //StatusType = [];
    level1 = [];
    level2 = [];
    Reason = [];
    lvl1 = [];
    lvl2 = [];
    Rsn = [];
    fetchWellOpStatusReason(widget.WellStatus);
    super.initState();


  }

  void dispose(){
    _remarkController.dispose();
    _descController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  Future fetchWellOpStatusReason(String status) async {

    wellPostBody.user = widget.user;
    wellPostBody.whereCondition = "STATUS_TYPE= '$status'";
   // wellPostBody.orderBy = "START_TIME DESC";
    try {
      // print('the response is '+response.statusCode.toString());
      setState(() {
        if(status == 'CLOSE') {
          groupValue=1;

        } else {
          groupValue=0;
          status_rsn = widget.WellReason;
        }
      });

      result = await fetchApi.fetchWellOpStatusReasonPost(wellPostBody);
     // result = await fetchApi.fetchWellOpStatusReason("");
      print('fetchWellOpStatusReason AllWellsOp = ${result!.length}');
      setState((){
        AllWellsOp.clear();
        level1.clear();
        level2.clear();
        Reason.clear();

        AllWellsOp = result!.cast<WellOpStatusReason>().toList();

        for(int i=0;i< AllWellsOp.length;++i)
          {
            if((level1.singleWhere((e) => e!["name"] ==  AllWellsOp[i].LEVEL1.toString() , orElse: () => null)) != null)
              {
                print('already exist');
              } else {
             // level1.add(MyList(AllWellsOp[i].STATUS_TYPE.toString(), AllWellsOp[i].LEVEL1.toString()));
             // level1.add({"id" : AllWellsOp[i].LEVEL1.toString(), "name" : AllWellsOp[i].LEVEL1.toString()});
              level1.add({"id" : AllWellsOp[i].LEVEL1.toString(), "name" : AllWellsOp[i].LEVEL1.toString(),"parentID" : AllWellsOp[i].STATUS_TYPE.toString()});
            }

            if((level2.singleWhere((e) => e!["name"] ==  AllWellsOp[i].LEVEL2.toString() , orElse: () => null)) != null) {
              print('already exist');
            } else {
             //   level2.add(MyList(AllWellsOp[i].LEVEL1.toString(), AllWellsOp[i].LEVEL2.toString()));
                //level2.add({"id" : AllWellsOp[i].LEVEL1.toString(), "name": AllWellsOp[i].LEVEL2.toString()});
                level2.add({"id" : AllWellsOp[i].LEVEL2.toString(), "name" : AllWellsOp[i].LEVEL2.toString(),"parentID" : AllWellsOp[i].LEVEL1.toString()});
            }

            if((Reason.singleWhere((e) => e!["name"] ==  AllWellsOp[i].STATUS_REASON.toString() , orElse: () => null)) != null)
            {
              print('already exist');
            } else {
            //  Reason.add(MyList(AllWellsOp[i].LEVEL2.toString(), AllWellsOp[i].STATUS_REASON.toString()));
              //Reason.add({"id" : AllWellsOp[i].LEVEL2.toString(), "name": AllWellsOp[i].STATUS_REASON.toString()});
              Reason.add({"id" : AllWellsOp[i].STATUS_REASON.toString(), "name" : AllWellsOp[i].STATUS_REASON.toString(),"parentID" : AllWellsOp[i].LEVEL2.toString()});
            }


          }
       /* if(widget.WellStatus == 'OPEN')
        {
          int indx = Reason.indexWhere((e) => e["id"].contains(status_rsn));
          print('indx is $indx');
        }*/


      });

    } catch (e) {
      print('e is ${e}');
    }
  }

  DateTime dateTime = DateTime(DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      DateTime.now().hour,
      DateTime.now().minute);



  Widget build(BuildContext context) {
   // if(Reason.isNotEmpty) print('Reason : ${Reason.length}');
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.title),

      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Status',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      CupertinoSlidingSegmentedControl(
                        thumbColor: groupValue == 0 ? CupertinoColors.activeGreen : CupertinoColors.destructiveRed,
                        padding: const EdgeInsets.all(4),
                        groupValue: groupValue,
                        children: {
                          0: buildSegment('OPEN'),
                          1: buildSegment('CLOSE'),
                        },
                        onValueChanged: (groupValue) {
                          // print(groupValue);
                          setState(() {
                            this.groupValue = groupValue as int?;
                          //  this.isClicked = true;

                            if(groupValue == 1) {
                              fetchWellOpStatusReason('CLOSE') ;
                              print('CLOSE = ${AllWellsOp.length}');
                            }
                            else {
                              fetchWellOpStatusReason('OPEN');
                              print('OPEN = ${AllWellsOp.length}');
                            }

                          });
                        },


                      )
                    ],

                  ),
                  const SizedBox(width: 20,),
                  Column(
                    children: [
                      const Text('Date and Time',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ElevatedButton(
                          onPressed: pickDateTime,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              '${dateTime.year}/${dateTime.month}/${dateTime.day} ${dateTime.hour}:${dateTime.minute}',
                              style: const TextStyle(fontSize: 12),
                            ),
                          )
                      ),
                    ],
                  ),
                ],
              ),

            ),
            level1.isNotEmpty  ? DropDownValues(widget.WellStatus)
                : (widget.WellStatus == 'OPEN') ? DropDownValues(widget.WellStatus) :const Center(child: CircularProgressIndicator(),),

          ],
        ),

      ),
      floatingActionButton:   FloatingActionButton(child: Text('add'),
        onPressed: () async{
          post_well_op_status.proc_name = "InsertOperationStatus";
          List<Param>? p = [];
          p.add(Param(name: "v_status",value: ""));
          p.add(Param(name: "WELL_COMPLETION_S",value: widget.WellCompletion!));
          p.add(Param(name: "start_time",value: DateFormat('dd-MMM-yyyy hh:mm:ss a').format(dateTime)));
          p.add(Param(name: "status",value:  widget.WellStatus));
          p.add(Param(name: "STATUS_REASON",value: reasonId!));
          p.add(Param(name: "remarks",value: _descController.text));
          p.add(Param(name: "ofo_remarks",value: _remarkController.text));
          p.add(Param(name: "insert_date",value: DateFormat('dd-MMM-yyyy hh:mm:ss a').format(DateTime.now())));
          p.add(Param(name: "inserted_by",value: widget.user!));
          post_well_op_status.WellParams = p;

          print('the json is : ${post_well_op_status.toJson()}');
          print('the json encode is : ${jsonEncode(post_well_op_status)}');

          result = await fetchApi.PostWellOpStatus("JsonHeader", jsonEncode(post_well_op_status));
          print(result);

        },),
    );
  }

  Widget DropDownValues(String? well_status)
  {
    //if(Reason.isNotEmpty) print('Reason : ${Reason.length}');
    if(well_status=='OPEN'){
      level2 = [];
      level1 = [];
    }

    return Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[

                    //DropDwn(level1Id,level2Id,level1,lvl2,level2,'Level1'),

                    FormHelper.dropDownWidget(
                        context,
                        "Select Level1",
                        level1Id,
                        level1,
                            (onChangedVal) {
                          setState(() {
                            //countryId = onChangedVal;
                            level1Id = onChangedVal;
                            print("selected Status Type: $onChangedVal");
                            lvl2 = level2
                                .where(
                                  (Item) => Item!["parentID"].toString() == onChangedVal.toString() ,
                            )
                                .toList();
                            level2Id = null;
                          });
                          // print("selected State: ${states[0]}");
                        },
                            (onValidateVal) {
                          if (onValidateVal == null) {
                            return 'Please Select a Level1';
                          }
                          return null;
                        },
                        borderColor: Theme.of(context).primaryColor,
                        borderFocusColor: Theme.of(context).primaryColor,
                        borderRadius: 10,

                    ) ,

                    const SizedBox(height: 10,),
                    //DropDwn(level2Id,reasonId,lvl2,Rsn,Reason,'Level2'),

                    FormHelper.dropDownWidget(
            context,
            "Select Level2",
            level2Id,
            lvl2,
                (onChangedVal) {
              setState(() {
                //countryId = onChangedVal;
                level2Id = onChangedVal;
                print("selected Status Type: $onChangedVal");
                Rsn = Reason
                    .where(
                      (Item) => Item!["parentID"].toString() == onChangedVal.toString() ,
                )
                    .toList();
                reasonId = null;
              });
              // print("selected State: ${states[0]}");
            },
                (onValidateVal) {
              if (onValidateVal == null) {
                return 'Please Select a Level2';
              }
              return null;
            },
            borderColor: Theme.of(context).primaryColor,
            borderFocusColor: Theme.of(context).primaryColor,
            borderRadius: 10,

          ) ,

                    const SizedBox(height: 10,),
              //      DropDwn(reasonId,reasonId,Rsn,Rsn,Reason,'Reason'),

          FormHelper.dropDownWidget(
            context,
            "Select Reason",
            reasonId,
            (well_status == 'OPEN') ? Reason
                .where(
                  (Item) => Item!["parentID"].toString() == "" ,
            )
                .toList() :
            Rsn,
                (onChangedVal) {
              setState(() {
                //countryId = onChangedVal;
                reasonId = onChangedVal;
                print("selected Reason: $onChangedVal");
/*
                Rsn = Reason
                    .where(
                      (Item) => Item!["parentID"].toString() == onChangedVal.toString() ,
                )
                    .toList();
*/
 //               reasonId = null;
              });
              // print("selected State: ${states[0]}");
            },
                (onValidateVal) {
              if (onValidateVal == null) {
                return 'Please Select a Reason';
              }
              return null;
            },
            borderColor: Theme.of(context).primaryColor,
            borderFocusColor: Theme.of(context).primaryColor,
            borderRadius: 10,

          ) ,

                    /*
                          FormHelper.dropDownWidget(
                            context,
                            "Select a Level2",
                            stateId,
                            states,
                                (onChangedVal) {
                              setState(() {
                                stateId = onChangedVal;
                                blocks = blockMasters
                                    .where(
                                      (blockItem) =>
                                  blockItem["ParentId"].toString() ==
                                      onChangedVal.toString(),
                                )
                                    .toList();
                                blockId = null;
                              });

                              //print("selected State: $onChangedVal");
                            },
                                (onValidate) {
                              return null;
                            },
                            borderColor: Theme.of(context).primaryColor,
                            borderFocusColor: Theme.of(context).primaryColor,
                            borderRadius: 10,
                            //optionValue: "ID",
                            //optionLabel: "Name"
                          ),
                          const SizedBox(height: 10,),
                          FormHelper.dropDownWidget(
                            context,
                            "Select a reason",
                            blockId,
                            blocks,
                                (onChangedVal) {
                              setState(() {
                                blockId = onChangedVal;
                              });
                              //print("selected Block: $onChangedVal");
                            },
                                (onValidate) {
                              return null;
                            },
                            borderColor: Theme.of(context).primaryColor,
                            borderFocusColor: Theme.of(context).primaryColor,
                            borderRadius: 10,
                            //optionValue: "ID",
                            //optionLabel: "Name"
                          ),
                          const SizedBox(height: 10,),
                          FormHelper.dropDownWidget(
                            context,
                            "Select a Category",
                            blockId,
                            blocks,
                                (onChangedVal) {
                              setState(() {
                                blockId = onChangedVal;
                              });
                              //print("selected Block: $onChangedVal");
                            },
                                (onValidate) {
                              return null;
                            },
                            borderColor: Theme.of(context).primaryColor,
                            borderFocusColor: Theme.of(context).primaryColor,
                            borderRadius: 10,
                            //optionValue: "ID",
                            //optionLabel: "Name"
                          ),
                          */
          const SizedBox(height: 10,),
          const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text('Description',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          ),
          const SizedBox(height: 10,),
           TextField(
            controller:_descController ,
          maxLines: 3,
          decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text('Remarks',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          ),
           TextField(
            controller: _remarkController,
            maxLines: 3,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),


    ],
    );
  }
  Widget buildSegment(String text) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }
  Future<DateTime?> pickDate() {

    DateTime dt =DateFormat('dd/MM/yyyy hh:mm a').parse(widget.StatusDate ??  '07/03/2021 2:05 AM') ;  //widget.StatusDate ?? "1980"   07/03/2021 2:05 AM
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: dt,
      lastDate: DateTime(2100),
    );
  }
  Future<TimeOfDay?> pickTime() => showTimePicker(
      context:context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute)
  );
  Future pickDateTime() async {
    DateTime? date = await pickDate();


    if (date == null) return;

    TimeOfDay? time = await pickTime();
    if (time == null) return;

    final dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute
    );
    setState(() => this.dateTime = dateTime);
  }

  Widget DropDwn(String? id,String? nextId ,List<dynamic> dropList,List<dynamic> nextList,List<dynamic> nextDropList,String myLabel){
    return
    FormHelper.dropDownWidget(
      context,
      "Select $myLabel",
      id,
      dropList,
          (onChangedVal) {
        setState(() {
          //countryId = onChangedVal;
          id = onChangedVal;
          print("selected  $myLabel : $onChangedVal");
          nextList = nextDropList
              .where(
                (Item) => Item!["parentID"].toString() == onChangedVal.toString() ,
          )
              .toList();
          nextId = null;
        });
        // print("selected State: ${states[0]}");
      },
          (onValidateVal) {
        if (onValidateVal == null) {
          return 'Please Select a $myLabel';
        }
        return null;
      },
      borderColor: Theme.of(context).primaryColor,
      borderFocusColor: Theme.of(context).primaryColor,
      borderRadius: 10,

    );
  }
}

class PostWellOpStatus{
  String? proc_name="";
  List<Param> WellParams;


  PostWellOpStatus({this.proc_name, required this.WellParams});

  Map<String, dynamic> toJson() => {
    "proc_name": proc_name,
    "params": List<dynamic>.from(WellParams!.map((p) => p.toJson()))
  };

}
class Param{
  String name;
  String value;
  Param({required this.name,required this.value});
  Map<String, dynamic> toJson() => {
    "name" : name,
    "value" : value
  };
}

