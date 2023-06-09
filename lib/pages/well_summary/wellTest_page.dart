import 'package:ashal_ver_3/widgets/info_Container.dart';
import 'package:ashal_ver_3/services/wellLatest.dart';
//import 'package:ashal_ver_3/services/wellTest.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class WellTestPage extends StatefulWidget {
  WellLatest? item;

  WellTestPage({Key? key, this.item}) : super(key: key);

  @override
  _WellTestPageState createState() => _WellTestPageState();
}

class _WellTestPageState extends State<WellTestPage> {
  @override
  Widget build(BuildContext context) {

    Color titleBackgroundColor = Colors.white;
    Color titleTextColor = Colors.black;
    Color titleBorderColor = Colors.black;

    Color valueBackgroundColor = Colors.white;
    Color valueTextColor = Colors.black;
    Color valueBorderColor = Colors.black;


    print("well test page UWI  = "+widget.item!.UWI.toString());
    DateTime dt1;
    String _start_time = "";
    if(widget.item!.START_TIME != null) {
       dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(
          widget.item!.START_TIME.toString());
       _start_time = DateFormat('dd/MM/yyyy hh:mm a').format(dt1);
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
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.r),
                        topRight: Radius.circular(18.r)),
                    color: Color(0xffaabbd5)),
                height: 0.05.sh,
                width: 0.7.sw,
                child: Text(
                  "Well Test Summary",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height,
                color:  Color(0xffaabbd5),
                child: Padding(
                  padding:  EdgeInsets.all(8.r),
                  child: Column(
                    children: [

                      Row(
                        children: [
                          infoContainer(height: 0.05.sh,
                            width: 0.28.sw,
                            textColor: titleTextColor,
                            backgroundColor: titleBackgroundColor,
                            borderColor: titleBorderColor,
                            text: "Activity Type", size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                            borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                          ),
                          SizedBox(width: 0.01.sw,),
                          infoContainer(height: 0.05.sh,
                            width: 0.37.sw,
                            textColor: valueTextColor,
                            backgroundColor: valueBackgroundColor,
                            borderColor: valueBorderColor,
                            text: widget.item!.WT_ACTIVITY_TYPE.toString(), size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                            borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                          ),
                          SizedBox(width: 0.01.sw,),
                          infoContainer(height: 0.05.sh,
                            width: 0.28.sw,
                            textColor: titleTextColor,
                            backgroundColor: titleBackgroundColor,
                            borderColor: titleBorderColor,
                            text: "Activity ID", size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                            borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                          ),
                        ],
                      ),
                      SizedBox(height: 0.005.sh,),
                      Row(
                        children: [
                        infoContainer(height: 0.05.sh,
                        width: 0.28.sw,
                          textColor: titleTextColor,
                          backgroundColor: titleBackgroundColor,
                          borderColor: titleBorderColor,
                        text: "Activity Name", size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                          borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                         ),
                          SizedBox(width: 0.01.sw,),
                      infoContainer(height: 0.05.sh,
                        width: 0.37.sw,
                        textColor: valueTextColor,
                        backgroundColor: valueBackgroundColor,
                        borderColor: valueBorderColor,
                        text: widget.item!.WT_ACTIVITY_NAME.toString(), size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                        borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                      ),
                          SizedBox(width: 0.01.sw,),
                      infoContainer(height: 0.05.sh,
                        width: 0.28.sw,
                        textColor: valueTextColor,
                        backgroundColor: valueBackgroundColor,
                        borderColor: valueBorderColor,
                        text: widget.item!.WT_ACTIVITY_ID.toString(), size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                        borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                      ),
                        ],
                      ),
                      SizedBox(height: 0.005.sh,),
                      Row(
                        children: [
                          infoContainer(height: 0.05.sh,
                            width: 0.28.sw,
                            textColor: titleTextColor,
                            backgroundColor: titleBackgroundColor,
                            borderColor: titleBorderColor,
                            text: "Start Time", size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                            borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                          ),
                          SizedBox(width: 0.01.sw,),
                          infoContainer(height: 0.05.sh,
                            width: 0.37.sw,
                            textColor: valueTextColor,
                            backgroundColor: valueBackgroundColor,
                            borderColor: valueBorderColor,
                            text: _start_time, size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                            borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                          ),
                          SizedBox(width: 0.01.sw,),
                          infoContainer(height: 0.05.sh,
                            width: 0.28.sw,
                            textColor: titleTextColor,
                            backgroundColor: titleBackgroundColor,
                            borderColor: titleBorderColor,
                            text: "Duration", size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                            borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                          ),
                        ],
                      ),
                      SizedBox(height: 0.005.sh,),
                      Row(
                        children: [
                          infoContainer(height: 0.05.sh,
                            width: 0.28.sw,
                            textColor: titleTextColor,
                            backgroundColor: titleBackgroundColor,
                            borderColor: titleBorderColor,
                            text: "End Time", size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                            borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                          ),
                          SizedBox(width: 0.01.sw,),
                          infoContainer(height: 0.05.sh,
                            width: 0.37.sw,
                            textColor: valueTextColor,
                            backgroundColor: valueBackgroundColor,
                            borderColor: valueBorderColor,
                            text: widget.item!.END_TIME.toString(), size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                            borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                          ),
                          SizedBox(width: 0.01.sw,),
                          infoContainer(height: 0.05.sh,
                            width: 0.28.sw,
                            textColor: valueTextColor,
                            backgroundColor: valueBackgroundColor,
                            borderColor: valueBorderColor,
                            text: (widget.item!.DURATION!.isNotEmpty) ? widget.item!.DURATION!+' hrs' : '', size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                            borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                          ),
                        ],
                      ),
                      SizedBox(height: 0.005.sh,),
                      Row(
                        children: [
                          Column(
                            children: [
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: titleTextColor,
                                backgroundColor: titleBackgroundColor,
                                borderColor: titleBorderColor,
                                text: "Left Choke", size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                                borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                              ),
                              SizedBox(height: 0.005.sh,),
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: valueTextColor,
                                backgroundColor: valueBackgroundColor,
                                borderColor: valueBorderColor,
                                text: (widget.item!.LEFT_CHOKE_SIZE!.isNotEmpty) ? widget.item!.LEFT_CHOKE_SIZE!+' Inch' : '', size: 11.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                                borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                              ),
                            ],
                          ),
                          SizedBox(width: 0.005.sw,),
                          Column(

                          children: [

                            Container(
                              height: 0.05.sh,
                              width: 0.37.sw,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  infoContainer(height: 0.05.sh,
                                    width: 0.14.sw,
                                    textColor: titleTextColor,
                                    backgroundColor: titleBackgroundColor,
                                    borderColor: titleBorderColor,
                                    text: "WHP", size: 11.sp, ltRadius: 5.r, rtRadius: 0, lbRadius: 5.r, rbRadius: 0,
                                    borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                                  ),
                                  SizedBox(width: 0.005.sw,),
                                  infoContainer(height: 0.05.sh,
                                    width: 0.22.sw,
                                    textColor: valueTextColor,
                                    backgroundColor: valueBackgroundColor,
                                    borderColor: valueBorderColor,
                                    text: (widget.item!.WHP!.isNotEmpty) ? widget.item!.WHP!+' psi' : '', size: 11.sp, ltRadius: 0, rtRadius: 5.r, lbRadius: 0, rbRadius: 5.r,
                                    borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 0.005.sh,),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  infoContainer(height: 0.05.sh,
                                    width: 0.14.sw,
                                    textColor: titleTextColor,
                                    backgroundColor: titleBackgroundColor,
                                    borderColor: titleBorderColor,
                                    text: "FLP", size: 11.sp, ltRadius: 5.r, rtRadius: 0, lbRadius: 5.r, rbRadius: 0,
                                    borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                                  ),
                                  SizedBox(width: 0.005.sw,),
                                  infoContainer(height: 0.05.sh,
                                    width: 0.22.sw,
                                    textColor: valueTextColor,
                                    backgroundColor: valueBackgroundColor,
                                    borderColor: valueBorderColor,
                                    text: (widget.item!.FLOW_LINE_PRESSURE!.isNotEmpty) ? widget.item!.FLOW_LINE_PRESSURE!+' psi' : '', size: 11.sp, ltRadius: 0, rtRadius: 5.r, lbRadius: 0, rbRadius: 5.r,
                                    borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                          ),
                          SizedBox(width: 0.005.sw,),
                          Column(
                            children: [
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: titleTextColor,
                                backgroundColor: titleBackgroundColor,
                                borderColor: titleBorderColor,
                                text: "Right Choke", size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                                borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                              ),
                              SizedBox(height: 0.005.sh,),
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: valueTextColor,
                                backgroundColor: valueBackgroundColor,
                                borderColor: valueBorderColor,
                                text: (widget.item!.RIGHT_CHOKE_SIZE!.isNotEmpty) ? widget.item!.RIGHT_CHOKE_SIZE!+' Inch' : '', size: 11.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                                borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 0.005.sh,),
                      Row(
                        children: [
                          Column(
                            children: [
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: titleTextColor,
                                backgroundColor: titleBackgroundColor,
                                borderColor: titleBorderColor,
                                text: "WC", size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                                borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                              ),
                              SizedBox(height: 0.005.sh,),
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: valueTextColor,
                                backgroundColor: valueBackgroundColor,
                                borderColor: valueBorderColor,
                                text: (widget.item!.WC!.isNotEmpty) ? widget.item!.WC!+' %' : '', size: 11.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                                borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                              ),
                            ],
                          ),
                          SizedBox(width: 0.005.sw,),
                          Column(
                          children: [
                            Container(
                              height: 0.05.sh,
                              width: 0.37.sw,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  infoContainer(height: 0.05.sh,
                                    width: 0.20.sw,
                                    textColor: titleTextColor,
                                    backgroundColor: titleBackgroundColor,
                                    borderColor: titleBorderColor,
                                    text: "Pressure Flage", size: 11.sp, ltRadius: 5.r, rtRadius: 0, lbRadius: 5.r, rbRadius: 0,
                                    borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                                  ),
                                  SizedBox(width: 0.005.sw,),
                                  infoContainer(height: 0.05.sh,
                                    width: 0.16.sw,
                                    textColor: valueTextColor,
                                    backgroundColor: valueBackgroundColor,
                                    borderColor: valueBorderColor,
                                    text: widget.item!.PRESSURE_FLAG.toString(), size: 11.sp, ltRadius: 0, rtRadius: 5.r, lbRadius: 0, rbRadius: 5.r,
                                    borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 0.005.sh,),
                            Container(
                              height: 0.05.sh,
                              width: 0.37.sw,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  infoContainer(height: 0.05.sh,
                                    width: 0.2.sw,
                                    textColor: titleTextColor,
                                    backgroundColor: titleBackgroundColor,
                                    borderColor: titleBorderColor,
                                    text: "Liqued Rate", size: 11.sp, ltRadius: 5.r, rtRadius: 0, lbRadius: 5.r, rbRadius: 0,
                                    borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                                  ),
                                  SizedBox(width: 0.005.sw,),
                                  infoContainer(height: 0.05.sh,
                                    width: 0.16.sw,
                                    textColor: valueTextColor,
                                    backgroundColor: valueBackgroundColor,
                                    borderColor: valueBorderColor,
                                    text: (widget.item!.LIQUID_RATE!.isNotEmpty) ? widget.item!.LIQUID_RATE!+' BBL/Day' : '', size: 11.sp, ltRadius: 0, rtRadius: 5.r, lbRadius: 0, rbRadius: 5.r,
                                    borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                          ),
                          SizedBox(width: 0.005.sw,),
                          Column(
                            children: [
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: titleTextColor,
                                backgroundColor: titleBackgroundColor,
                                borderColor: titleBorderColor,
                                text: "GOR", size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                                borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                              ),
                              SizedBox(height: 0.005.sh,),
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: valueTextColor,
                                backgroundColor: valueBackgroundColor,
                                borderColor: valueBorderColor,
                                text: (widget.item!.TOTAL_GOR!.isNotEmpty) ? widget.item!.TOTAL_GOR!+' scf/bbl' : '', size: 11.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                                borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 0.005.sh,),
                      Row(
                        children: [
                          Column(
                            children: [
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: titleTextColor,
                                backgroundColor: titleBackgroundColor,
                                borderColor: titleBorderColor,
                                text: "WC Flage", size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                                borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                              ),
                              SizedBox(height: 0.005.sh,),
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: valueTextColor,
                                backgroundColor: valueBackgroundColor,
                                borderColor: valueBorderColor,
                                text: widget.item!.WC_FLAG.toString(), size: 11.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                                borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                              ),
                            ],
                          ),
                          SizedBox(width: 0.005.sw,),
                          Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                infoContainer(height: 0.05.sh,
                                  width: 0.37.sw,
                                  textColor: titleTextColor,
                                  backgroundColor: titleBackgroundColor,
                                  borderColor: titleBorderColor,
                                  text: "Preffered Flag", size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                                  borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                                ),
                                SizedBox(height: 0.005.sh,),
                                infoContainer(height: 0.05.sh,
                                  width: 0.37.sw,
                                  textColor: valueTextColor,
                                  backgroundColor: valueBackgroundColor,
                                  borderColor: valueBorderColor,
                                  text: widget.item!.PREFFERED_FLAG.toString(), size: 11.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                                  borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                                ),
                              ],
                            ),
                          ],
                          ),
                          SizedBox(width: 0.005.sw,),
                          Column(
                          children: [
                            infoContainer(height: 0.05.sh,
                              width: 0.28.sw,
                              textColor: titleTextColor,
                              backgroundColor: titleBackgroundColor,
                              borderColor: titleBorderColor,
                              text: "GOR Flage", size: 11.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                              borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                            ),
                            SizedBox(height: 0.005.sh,),
                            infoContainer(height: 0.05.sh,
                              width: 0.28.sw,
                              textColor: valueTextColor,
                              backgroundColor: valueBackgroundColor,
                              borderColor: valueBorderColor,
                              text: widget.item!.GOR_FLAG.toString(), size: 11.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                              borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
                            ),
                          ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
