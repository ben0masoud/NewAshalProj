
import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/widgets/dynamic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'constant_values.dart';

class WellCompletionDetailPage extends StatefulWidget {
   WellCompletionDetailPage({Key? key,this.item}) : super(key: key);
   final Well? item;

  @override
  State<WellCompletionDetailPage> createState() => _WellCompletionDetailPageState();
}
late Well? well_completion;



class _WellCompletionDetailPageState extends State<WellCompletionDetailPage> {
@override
  void initState() {
    // TODO: implement initState
    well_completion = widget.item;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantValues.MainColor1,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text("Well Completion Detailes",style: TextStyle(color: Colors.black,),),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FirestRow(context),
                SecondRow(context),
                ThiredRow(context),
                SizedBox(height: 10,),
                FourthRow(context),

              ],
            ),
          ),
        ),
      ),
      bottomSheet: Fivth(context),
    );
  }
}
List<Color> BackgroundStatus(String? wellStatus){

  List<Color> statusColor = [];


  // widget.item!.OPERATION_STATUS

  if(wellStatus == "OPEN")
  {
    statusColor.add(Colors.green);
    statusColor.add(Colors.greenAccent);
  }
  else if(wellStatus == "CLOSE")
  {
    statusColor.add(Colors.red);
    statusColor.add(Colors.redAccent);
  } else
  {
    statusColor.add(Colors.grey);
    statusColor.add(Colors.blueGrey);
  }

  return statusColor;
}
FirestRow(BuildContext context){
  String _date = well_completion!.START_TIME.toString();
  String _date1 = well_completion!.END_TIME.toString();

  if(_date.isNotEmpty ) {
    DateTime dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(_date);
    _date = DateFormat('dd/MM/yyyy hh:mm a').format(dt1);
  }
  if(_date1.isNotEmpty ) {
    DateTime dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(_date1);
    _date1 = DateFormat('dd/MM/yyyy hh:mm a').format(dt1);
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      DynamicContainer(h: 100, w: 120, title: 'Start Date', value: _date,titleSize: 14.sp,valueSize: 12.sp,borderType: 0,matrixType: 'C',),
      CircleAvatar(
          radius: 60.r,
          backgroundColor: BackgroundStatus(well_completion!.OPERATION_STATUS)[1],
          child: CircleAvatar(
              radius: 55.r,
              backgroundColor: BackgroundStatus(well_completion!.OPERATION_STATUS)[0],
              child:
              //Text('uwi',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(well_completion!.UWI.toString(),
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),textAlign: TextAlign.center,),
                  Text(well_completion!.FACILITY_NAME.toString()+" - "+well_completion!.FACILITY_ID.toString(),
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),textAlign: TextAlign.center,),
                ],
              ))
      ),
      DynamicContainer(h: 100, w: 120, title: 'End Date', value: _date1,titleSize: 14.sp,valueSize: 12.sp,borderType: 0,matrixType: 'C',),
    ],
  );
}
SecondRow(BuildContext context){
  String _date = well_completion!.OPERATION_STATUS_DATE.toString();
  String _date1 = well_completion!.OPERATION_STATUS_DATE.toString();

  if(_date.isNotEmpty ) {
    DateTime dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(_date);
    _date = DateFormat('dd/MM/yyyy hh:mm a').format(dt1);
  }
  if(_date1.isNotEmpty ) {
    DateTime dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(_date1);
    _date1 = DateFormat('dd/MM/yyyy hh:mm a').format(dt1);
  }
  return Container(
    height: 150,
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //ContWithBorder(120,MediaQuery.of(context).size.width * 0.25,'Field',well_completion!.FIELD.toString(),13.sp,14.sp,8,Colors.lightGreen),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ConstantValues.SubColor4
          ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DynamicContainer(h: 100, w: MediaQuery.of(context).size.width * 0.22, title: 'Field', value: well_completion!.FIELD.toString(),titleSize: 13.sp,valueSize: 13.sp,borderType: 0,matrixType: 'C',),
            )),

        Container(
          height: 150,
          width: MediaQuery.of(context).size.width * 0.42,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DynamicContainer(h: 30, w: MediaQuery.of(context).size.width * 0.4, title: 'Operation Status Date', value: _date.toString(),titleSize: 10.sp,valueSize: 9.sp,borderType: 0,matrixType: 'R',),
              SizedBox(height: 10,),
              DynamicContainer(h: 30, w: MediaQuery.of(context).size.width * 0.4, title: 'Status', value: well_completion!.AL_STATUS.toString(),titleSize: 10.sp,valueSize: 9.sp,borderType: 0,matrixType: 'R',),
              SizedBox(height: 10,),
              DynamicContainer(h: 30, w: MediaQuery.of(context).size.width * 0.4, title: 'Status Date', value: _date1.toString(),titleSize: 10.sp,valueSize: 9.sp,borderType: 0,matrixType: 'R',),

            ],
          ),
        ),

        //ContWithBorder(120,MediaQuery.of(context).size.width * 0.25,'Reservoir',well_completion!.RESERVOIR_ID.toString(),13.sp,14.sp,8,Colors.lightGreen),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ConstantValues.SubColor4
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DynamicContainer(h: 100, w: MediaQuery.of(context).size.width * 0.22, title: 'Reservoir', value: well_completion!.RESERVOIR_ID.toString(),titleSize: 13.sp,valueSize: 13.sp,borderType: 0,matrixType: 'C',),
            )),
      ],
    ),
  );
}
ThiredRow(BuildContext context){
  String _date = well_completion!.GC_CONN_DATE.toString();
  String _date1 = well_completion!.HEADER_CONN_DATE.toString();
  String _date2 = well_completion!.SLOT_CONN_DATE.toString();
  if(_date.isNotEmpty ) {
    DateTime dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(_date);
    _date = DateFormat('dd/MM/yyyy hh:mm a').format(dt1);
  }
  if(_date1.isNotEmpty ) {
    DateTime dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(_date1);
    _date1 = DateFormat('dd/MM/yyyy hh:mm a').format(dt1);
  }
  if(_date2.isNotEmpty ) {
    DateTime dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(_date2);
    _date2 = DateFormat('dd/MM/yyyy hh:mm a').format(dt1);
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ConstantValues.SubColor4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DynamicContainer(h: 60, w: MediaQuery.of(context).size.width * 0.25, title: 'GC', value: well_completion!.GC.toString(),titleSize: 12.sp,valueSize: 10.sp,borderType: 0,matrixType: 'C',),
              SizedBox(height: 3,),
              DynamicContainer(h: 60, w: MediaQuery.of(context).size.width * 0.25, title: 'Connection Date', value: _date,titleSize: 8.sp,valueSize: 8.sp,borderType: 0,matrixType: 'C',),
            ],
          ),
        ),
      ),
      SizedBox(width: 15,),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ConstantValues.SubColor4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DynamicContainer(h: 60, w: MediaQuery.of(context).size.width * 0.25, title: 'Header', value: well_completion!.HEADER.toString(),titleSize: 12.sp,valueSize: 10.sp,borderType: 0,matrixType: 'C',),
              SizedBox(height: 3,),
              DynamicContainer(h: 60, w: MediaQuery.of(context).size.width * 0.25, title: 'Connection Date', value: _date1,titleSize: 8.sp,valueSize: 8.sp,borderType: 0,matrixType: 'C',),
            ],
          ),
        ),
      ),
      SizedBox(width: 15,),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ConstantValues.SubColor4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DynamicContainer(h: 60, w: MediaQuery.of(context).size.width * 0.25, title: 'Slot', value: well_completion!.SLOT.toString(),titleSize: 12.sp,valueSize: 10.sp,borderType: 0,matrixType: 'C',),
              SizedBox(height: 3,),
              DynamicContainer(h: 60, w: MediaQuery.of(context).size.width * 0.25, title: 'Connection Date', value: _date2,titleSize: 8.sp,valueSize: 8.sp,borderType: 0,matrixType: 'C',),
            ],
          ),
        ),
      ),

    ],
  );
}
FourthRow(BuildContext context){

  return  Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: ConstantValues.SubColor4,
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DynamicContainer(h: 50, w: MediaQuery.of(context).size.width*0.9, title: 'Objective', value: well_completion!.COMPLETION_OBJECTIVE.toString(),titleSize: 16.sp,valueSize: 16.sp,borderType: 0,matrixType: 'R',),
          SizedBox(height: 5,),
          DynamicContainer(h: 50, w: MediaQuery.of(context).size.width*0.9, title: 'Left Method', value: well_completion!.LIFT_METHOD.toString(),titleSize: 16.sp,valueSize: 16.sp,borderType: 0,matrixType: 'R',),
          SizedBox(height: 5,),
          DynamicContainer(h: 50, w: MediaQuery.of(context).size.width*0.9, title: 'Allowable', value: well_completion!.ALLOWABLE.toString(),titleSize: 16.sp,valueSize: 16.sp,borderType: 0,matrixType: 'R',),
        ],
      ),
    ),
  );

}
Fivth(BuildContext context){
    String _date = well_completion!.LAST_UPDATE.toString();

    if(_date.isNotEmpty ) {
      DateTime dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(_date);
      _date = DateFormat('dd/MM/yyyy hh:mm a').format(dt1);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      DynamicContainer(h: 50, w: MediaQuery.of(context).size.width-50, title: 'Last Update', value: _date,titleSize: 14.sp,valueSize: 12.sp,borderType: 0,matrixType: 'C',),
      ],
    );
}



