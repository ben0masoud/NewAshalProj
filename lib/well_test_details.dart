

import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/services/wellTest.dart';
//import 'package:ashal_ver_3/well_test_details_container.dart';
import 'package:ashal_ver_3/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'constant_values.dart';

class WellTestDetails extends StatelessWidget {

  final WellTest ListWellTest;
  final Well? item_well;
  const WellTestDetails({Key? key, required this.ListWellTest,this.item_well}) : super(key: key);

  @override



  Widget build(BuildContext context) {

    DateTime dt3;
    String _last_update ='';

    print('pressed');
    if(ListWellTest.LAST_UPDATE.toString().isNotEmpty)
      {
         dt3 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(ListWellTest.LAST_UPDATE.toString());
         _last_update = DateFormat('dd/MM/yyyy hh:mm a').format(dt3);
      }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantValues.MainColor1,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Center(child: Text('Well Test',style: TextStyle(color: Colors.black),)),
      ),
      body: Center(
        child: Padding(
            padding:  EdgeInsets.all(7.r),
            child: Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: 0.35.sh,
                        width: double.infinity,

                      ),
                      Container(
                        height: 0.41.sh,
                        width: double.infinity,
                        color: Color(0xFF355983),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      FirestRow(),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      SecondRow(),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      ThirdRow(),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      FourthRow(),
                      SizedBox(
                        height: 0.03.sh,
                      ),
                      CustomContainer(
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Last Update",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 0.01.sh,
                                ),
                                Text(
                                  _last_update,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            )),
                        //borderWidth: null,
                        //height: 50,
                        //width: MediaQuery.of(context).size.width,
                        //radius: 5,
                        borderWidth: 0,
                        //borderColor: Color(0xFF5081A1),
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
  Widget FirestRow(){
    return Row(
      children: [
        MyContainer( 'Left Choke', ListWellTest.LEFT_CHOKE_SIZE.toString(),80.h,75.w,Colors.black,true),
        SizedBox(
          width: 8.w,
        ),
        MyContainer( '${item_well!.UWI}  ${item_well!.FACILITY_NAME} - ${item_well!.FACILITY_ID}'
            ,'',65.h,180.w,Colors.blue,false),
        SizedBox(
          width: 8.w,
        ),
        MyContainer( 'Right Choke', ListWellTest.RIGHT_CHOKE_SIZE.toString(),80.h,75.w,Colors.black,true),
      ],
    );
  }
  Widget SecondRow(){
    return CustomContainer(
      height: 135.h,
      borderColor: Color(0xFF5081A1),
      width: double.infinity,
      color: Color(0xFF5081A1),
      radius: 5.r,
      child: Padding(
        padding:  EdgeInsets.all(4.r),
        child: Column(
          children: [
            CustomContainer(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 8.w,),
                    Text(
                      "ID",
                      style: TextStyle(
                          color: Colors.black,
                          //fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 120.w,
                    ),
                    Text(
                      ListWellTest.ACTIVITY_ID.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          //fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              //borderWidth: 5,
              height: 35.h,
              width: double.infinity,
              //radius: 5,
              //borderColor: Color(0xFF5081A1),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomContainer(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 8.w,),
                    Text(
                      "Activity Name",
                      style: TextStyle(
                          color: Colors.black,
                         // fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 35.w,
                    ),
                    Text(
                      ListWellTest.ACTIVITY_NAME.toString(),
                      style: TextStyle(
                          color: Colors.black,
                         // fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              //borderWidth: 5,
              height: 35.h,
              width: double.infinity,
              //radius: 5,
              //borderColor: Color(0xFF5081A1),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomContainer(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 8.w,),
                    Text(
                      "Activity Type",
                      style: TextStyle(
                          color: Colors.black,
                         // fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 45.w,
                    ),
                    Text(
                      ListWellTest.ACTIVITY_TYPE.toString(),
                      style: TextStyle(
                          color: Colors.black,
                         // fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              //borderWidth: 5,
              height: 35.h,
              width: double.infinity,
              //radius: 5,
              //borderColor: Color(0xFF5081A1),
            ),
            SizedBox(
              height: 2.h,
            ),

          ],
        ),
      ),
    );
  }
  Widget ThirdRow(){
    DateTime dt1,dt2;
    String _start_time = '';
    String _end_time='';

    if(ListWellTest.START_TIME.toString().isNotEmpty){
       dt1 = DateFormat('MM/dd/yyyy hh:mm').parse(ListWellTest.START_TIME.toString());
       _start_time = DateFormat('dd/MM/yyyy h:mm a').format(dt1);
    }

    if(ListWellTest.END_TIME.toString().isNotEmpty) {
       dt2 = DateFormat('MM/dd/yyyy hh:mm').parse(
          ListWellTest.END_TIME.toString());
           _end_time = DateFormat('dd/MM/yyyy h:mm a').format(dt2);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomContainer(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Start Date",
                    style: TextStyle(
                        color: Colors.black,
                        //fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    _start_time,
                    style: TextStyle(
                        color: Colors.black,
                        //fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
          borderWidth: 5.r,
          height: 80.h,
          width: 120.w,
          radius: 5.r,
          borderColor: Color(0xFF5081A1),
        ),
        SizedBox(
          width: 8.w,
        ),
        CustomContainer(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Duration",
                    style: TextStyle(
                        color: Colors.black,
                       // fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    ListWellTest.DURATION.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        //fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          borderWidth: 5.r,
          height: 80.h,
          width: 90.w,
          radius: 5.r,
          borderColor: Color(0xFF5081A1),
        ),
        SizedBox(
          width: 8.w,
        ),
        CustomContainer(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "End Date",
                    style: TextStyle(
                        color: Colors.black,
                       // fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    _end_time,
                    style: TextStyle(
                        color: Colors.black,
                        //fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
          borderWidth: 5.r,
          height: 80.h,
          width: 120.w,
          radius: 5.r,
          borderColor: Color(0xFF5081A1),
        ),
      ],
    );
  }
  Widget FourthRow(){
    return Column(
      children: [
        FourthRowCol1(),
        SizedBox(height: 8.h,),
        FourthRowCol2(),
        SizedBox(height: 8.h,),
        FourthRowCol3(),
      ],
    );
  }
  Widget FourthRowCol1()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyContainer( 'WHP',ListWellTest.WHP.toString(),60.h,90.w,Colors.black,true),
        SizedBox(
          width: 8.w,
        ),
        MyContainer( 'Pressure Flage',ListWellTest.PRESSURE_FLAG.toString(),60.h,140.w,Colors.black,true),
        SizedBox(
          width: 8.w,
        ),
        MyContainer( 'FLP',ListWellTest.FLOW_LINE_PRESSURE.toString(),60.h,90.w,Colors.black,true),
      ],
    );
  }
  Widget FourthRowCol2()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyContainer( 'WC',ListWellTest.WC.toString(),60.h,90.w,Colors.black,true),
        SizedBox(
          width: 8.w,
        ),
        MyContainer( 'Liqued Rate',ListWellTest.LIQUID_RATE.toString(),60.h,140.w,Colors.black,true),
        SizedBox(
          width: 8.w,
        ),
        MyContainer( 'GOR', ListWellTest.TOTAL_GOR.toString(),60.h,90.w,Colors.black,true),
      ],
    );
  }
  Widget FourthRowCol3()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyContainer( 'WC Flag',ListWellTest.WC_FLAG.toString(),60.h,90.w,Colors.black,true),
        SizedBox(
          width: 8.w,
        ),
        MyContainer( 'Preffered Flage',ListWellTest.PREFFERED_FLAG.toString(),60.h,140.w,Colors.black,true),
        SizedBox(
          width: 8.w,
        ),
        MyContainer( 'GOR Flag',ListWellTest.GOR_FLAG.toString(),60.h,90.w,Colors.black,true),
      ],
    );
  }
  Widget MyContainer (String str1,String str2,double h,double w,Color? textColor,bool secondVal) {


    if (secondVal)
      return CustomContainer(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  str1,
                  style: TextStyle(
                      color: textColor ?? Colors.black,
                      // fontSize: 13.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  str2,
                  style: TextStyle(
                      color: textColor ?? Colors.black,
                      // fontSize: 13.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
        borderWidth: 5.r,
        height: h,
        width:  w,
        radius: 5.r,
        borderColor: Color(0xFF5081A1),
      );
    else
      return CustomContainer(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  str1,
                  style: TextStyle(
                      color: textColor ?? Colors.black,
                      // fontSize: 13.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
        borderWidth: 5.r,
        height: h,
        width:  w,
        radius: 5.r,
        borderColor: Color(0xFF5081A1),
      );
  }
}
