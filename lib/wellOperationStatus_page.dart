

import 'package:ashal_ver_3/info_Container.dart';
import 'package:ashal_ver_3/services/wellLatest.dart';
//import 'package:ashal_ver_3/services/wellOperationStatus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class WellOperationStatusPage extends StatefulWidget {
  WellLatest? item;

  WellOperationStatusPage({Key? key,this.item}) : super(key: key);

  @override
  _WellOperationStatusPageState createState() => _WellOperationStatusPageState();
}

class _WellOperationStatusPageState extends State<WellOperationStatusPage> {
  @override
  Widget build(BuildContext context) {
    print("well op status page UWI  = "+widget.item!.UWI.toString());
    DateTime dt1;
    String _start_time = "";
    if(widget.item!.START_TIME != null) {
       dt1 = DateFormat('MM/dd/yyyy hh:mm').parse(
          widget.item!.START_TIME.toString());
       _start_time = DateFormat('dd/MM/yyyy h:mm a').format(dt1);
    }
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                  "Operation Status Summary",
                  style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.bold),
                ),
              ),
              Container(

                //height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(8.r),
                color:  Color(0xffaabbd5), //Colors.grey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        infoContainer(height: 0.1.sh,
                          width: 0.3.sw,
                          textColor: Colors.black,
                          backgroundColor: Colors.white,
                          borderColor: Colors.black,
                          text: widget.item!.OPERATION_STATUS.toString(), size: 18.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 5.r, rbRadius: 5.r,
                          borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                        ),
                        Column(children: [
                          //Text("Elevation Ref."),
                          infoContainer(height: 0.05.sh,
                            width: 0.65.sw,
                            textColor: Colors.black,
                            backgroundColor: Colors.white,
                            borderColor: Colors.black,
                            text: "Start Date", size: 20.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                            borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                          ),
                          SizedBox(height: 0.002.sh),
                          infoContainer(height: 0.05.sh,
                            width: 0.65.sw,
                            textColor: Colors.black,
                            backgroundColor: Colors.white,
                            borderColor: Colors.black,
                            text: _start_time, size: 18.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                            borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                          ),

                          //Text(widget.item!.elevatioN_REF.toString()),
                        ],
                        ),
                      ],
                    ),
                    SizedBox(height: 0.002.sh),
                    infoContainer(height: 0.05.sh,
                      width: double.infinity,
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                      borderColor: Colors.black,
                      text: "Reason", size: 15.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                      borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                    ),
                    SizedBox(height: 0.002.sh),
                    infoContainer(height: 0.05.sh,
                      width: double.infinity,
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                      borderColor: Colors.black,
                      text: widget.item!.REASON.toString(), size: 13.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                      borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                    ),
                    SizedBox(height: 0.005.sh),
                    infoContainer(height: 0.05.sh,
                      width: double.infinity,
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                      borderColor: Colors.black,
                      text: "Remarks", size: 18.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                      borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                    ),
                    SizedBox(height: 0.002.sh),
                    infoContainer(height: 0.06.sh,
                      width: double.infinity,
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                      borderColor: Colors.black,
                      text: widget.item!.WLA_REMARKS.toString(), size: 13.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                      borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
