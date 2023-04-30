

import 'package:ashal_ver_3/widgets/info_Container.dart';
import 'package:ashal_ver_3/services/wellLatest.dart';
//import 'package:ashal_ver_3/services/wirelineActivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class WirelineActivityPage extends StatefulWidget {

  WellLatest? item;

  WirelineActivityPage({Key? key, this.item}) : super(key: key);

  @override
  _WirelineActivityPageState createState() => _WirelineActivityPageState();
}

class _WirelineActivityPageState extends State<WirelineActivityPage> {
  @override
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
  Widget build(BuildContext context) {

    Color titleBackgroundColor = Colors.white;
    Color titleTextColor = Colors.black;
    Color titleBorderColor = Colors.black;

    Color valueBackgroundColor = Colors.white;
    Color valueTextColor = Colors.black;
    Color valueBorderColor = Colors.black;

    print("wire page UWI  = "+widget.item!.UWI.toString());
    DateTime dt1;
    String _start_time = "";
    if(widget.item!.START_TIME != null) {
      DateTime dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(
          widget.item!.START_TIME.toString());
      String _start_time = DateFormat('dd/MM/yyyy hh:mm a').format(dt1);
    }
    //print(widget.item!.SPUD_DATE.toString());
    //print(dt1);
    //print(_spud_date);
   // DateTime dt2 = DateFormat('MM/dd/yyyy hh:mm').parse(widget.item!.COMPLETION_DATE.toString());
   // String _completion_date = DateFormat('dd/MM/yyyy h:mm a').format(dt2);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                    color:  Color(0xffaabbd5)
                ),
                height: 0.05.sh,
                width: 0.7.sw,
                child: Text(
                  "Wireline Activity Summary",
                  style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.r),
                color:  Color(0xffaabbd5), //Colors.grey,
                child: Column(
                    children: [
                      //SizedBox(height: 10),
                      Image.asset(
                        //'assets/no-image-available.jpeg',
                        OilCompany.indexOf(widget.item!.CONTRACTOR) >
                            -1 //where((item) => item == list[i]!.CONTRACTOR)
                            ? 'assets/company/${widget.item!.CONTRACTOR}.png'
                            : 'assets/company/NoLogo.png',
                        height: 0.15.sh,
                        width: 0.5.sw,

                        fit: BoxFit.scaleDown,
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          //SizedBox(width: 5),
                          infoContainer(height: 0.04.sh,
                            width: 0.35.sw,
                              textColor: titleTextColor,
                              backgroundColor: titleBackgroundColor,
                              borderColor: titleBorderColor,
                            text: "Contractor", size: 13.sp, ltRadius: 5.r, rtRadius: 0, lbRadius: 5.r, rbRadius: 0,
                            borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                          ),
                          SizedBox(width: 0.005.sw),
                          infoContainer(height: 0.04.sh,
                            width: 0.6.sw,
                              textColor: valueTextColor,
                              backgroundColor: valueBackgroundColor,
                              borderColor: valueBorderColor,
                            text: widget.item!.CONTRACTOR.toString(), size: 13.sp, ltRadius: 0, rtRadius: 5.r, lbRadius: 0, rbRadius: 5.r,
                              borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                          ),
                        ],
                      ),
                      SizedBox(height: 0.005.sh),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SizedBox(height: 5),
                          infoContainer(height: 0.04.sh,
                            width: 0.35.sw,
                              textColor: titleTextColor,
                              backgroundColor: titleBackgroundColor,
                              borderColor: titleBorderColor,
                            text: "Activity Name", size: 13.sp, ltRadius: 5.r, rtRadius: 0, lbRadius: 5.r, rbRadius: 0,
                              borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                          ),
                          SizedBox(width: 0.005.sw),
                          infoContainer(height: 0.04.sh,
                            width: 0.6.sw,
                              textColor: valueTextColor,
                              backgroundColor: valueBackgroundColor,
                              borderColor: valueBorderColor,
                            text: widget.item!.WLA_ACTIVITY_NAME.toString(), size: 13.sp, ltRadius: 0, rtRadius: 5.r, lbRadius: 0, rbRadius: 5.r,
                              borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                          ),
                        ],
                      ),
                      SizedBox(height: 0.005.sh),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SizedBox(height: 5),
                          infoContainer(height: 0.04.sh,
                            width: 0.35.sw,
                              textColor: titleTextColor,
                              backgroundColor: titleBackgroundColor,
                              borderColor: titleBorderColor,
                            text: "Status", size: 13.sp, ltRadius: 5.r, rtRadius: 0, lbRadius: 5.r, rbRadius: 0,
                              borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                          ),
                          SizedBox(width: 0.005.sw),
                          infoContainer(height: 0.04.sh,
                            width: 0.6.sw,
                              textColor: valueTextColor,
                              backgroundColor: valueBackgroundColor,
                              borderColor: valueBorderColor,
                            text: widget.item!.WLA_STATUS.toString(), size: 13.sp, ltRadius: 0, rtRadius: 5.r, lbRadius: 0, rbRadius: 5.r,
                              borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                          ),
                        ],
                      ),
                      SizedBox(height: 0.005.sh),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SizedBox(height: 5),
                          infoContainer(height: 0.04.sh,
                            width: 0.35.sw,
                              textColor: titleTextColor,
                              backgroundColor: titleBackgroundColor,
                              borderColor: titleBorderColor,
                            text: "Start Date", size: 13.sp, ltRadius: 5.r, rtRadius: 0, lbRadius: 5.r, rbRadius: 0,
                              borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                          ),
                          SizedBox(width: 0.005.sw),
                          infoContainer(height: 0.04.sh,
                            width: 0.6.sw,
                              textColor: valueTextColor,
                              backgroundColor: valueBackgroundColor,
                              borderColor: valueBorderColor,
                            text:_start_time, size: 13.sp, ltRadius: 0, rtRadius: 5.r, lbRadius: 0, rbRadius: 5.r,
                              borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                          ),
                        ],
                      ),
                      SizedBox(height: 0.005.sh),
                      infoContainer(height: 0.04.sh,
                        width: double.infinity,
                          textColor: titleTextColor,
                          backgroundColor: titleBackgroundColor,
                          borderColor: titleBorderColor,
                        text: "Remarks", size: 15.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                          borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                      ),
                      SizedBox(height: 0.002.sh),
                      infoContainer(height: 0.11.sh,
                        width: double.infinity,
                          textColor: valueTextColor,
                          backgroundColor: valueBackgroundColor,
                          borderColor: valueBorderColor,
                        text: widget.item!.WLA_REMARKS.toString(), size: 11.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                          borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                      ),
                    ],
                  ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
