//import 'package:ashal_ver_3/services/wellTest.dart';
import 'package:ashal_ver_3/widgets/custom_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WellTestContainer extends StatelessWidget {
  final String Duration;
  final String StartTime;
  final String EndTime;
  final String ID;
  final String ActivityName;
  final String ActivityType;
 // final WellTest ListWellTest;

  WellTestContainer({Key? key,
    required this.Duration,
    required this.StartTime,
    required this.EndTime,
    required this.ID,
    required this.ActivityName,
    required this.ActivityType,
  //  required this.ListWellTest
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context,designSize: const Size(360,690));
    //ScreenUtil().pixelRatio;
    return SafeArea(
      child: Center(
        child: Container(

          height: 0.31.sh,
          width: double.infinity,
          color: Colors.blueGrey,
          //color: Colors.transparent,
          child: Padding(
            padding:  EdgeInsets.all(5.r),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomContainer(
                      child: Center(
                          child: Text(
                            "Duration",
                            style: TextStyle(color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.bold),
                          )),
                      borderWidth: 1,
                      height: 0.043.sh,
                      width: 0.3.sw,
                      color: Color(0xFF345A7F),
                      radius: 5.r,
                    ),
                    SizedBox(width: 0.013.sw,),
                    CustomContainer(
                      child: Center(
                          child: Text(
                            "$Duration",
                            style: TextStyle(color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.bold),
                          )),
                      borderWidth: 1,
                      height: 0.043.sh,
                      width: 0.2.sw,
                      color: Color(0xFF345A7F),
                      radius: 5.r,
                    ),
                    SizedBox(width: 0.013.sw,),
                    CustomContainer(
                      child: Center(
                          child: Text(
                            "ID",
                            style: TextStyle(color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.bold),
                          )),
                      borderWidth: 1,
                      height: 0.043.sh,
                      width: 0.1.sw,
                      color: Color(0xFF67829F),
                      radius: 5.r,
                    ),

                    SizedBox(width: 0.013.sw,),
                    CustomContainer(
                      child: Center(
                          child: Text(
                            "$ID",
                            style: TextStyle(color: Colors.black,fontSize: 12.r,fontWeight: FontWeight.bold),
                          )),
                      borderWidth: 1,
                      height: 0.043.sh,
                      width: 0.33.sw,
                      color: Colors.white,
                      radius: 5.r,
                    ),
                  ],
                ),
                SizedBox(height: 0.005.sh),
                Row(
                  children: [
                    CustomContainer(
                      child: Center(
                          child: Text(
                            "Start",
                            style: TextStyle(color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.bold),
                          )),
                      borderWidth: 1,
                      height: 0.043.sh,
                      width: 0.3.sw,
                      color: Color(0xFF67829F),
                      radius: 5.r,
                    ),
                    SizedBox(width: 0.013.sw,),
                    CustomContainer(
                      child: Center(
                          child: Text(
                            "Activity Name",
                            style: TextStyle(color: Colors.black,fontSize: 12.sp,fontWeight: FontWeight.bold),
                          )),
                      borderWidth: 1,
                      height: 0.043.sh,
                      width: 0.653.sw,
                      color: Colors.white,
                      radius: 5.r,
                    ),
                  ],
                ),
                SizedBox(height: 0.005.sh,),
                Row(
                  children: [
                    CustomContainer(
                      child: Center(
                          child: Text(
                            "$StartTime",
                            style: TextStyle(color: Colors.white,fontSize: 10.sp,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                      borderWidth: 1,
                      height: 0.07.sh,
                      width: 0.3.sw,
                      color: Color(0xFF67829F),
                      radius: 5.r,
                    ),
                    SizedBox(width: 0.013.sw,),
                    CustomContainer(
                      child: Center(
                          child: Text(
                            "$ActivityName",
                            style: TextStyle(color: Colors.black,fontSize: 12.sp,),
                          )),
                      borderWidth: 1,
                      height: 0.07.sh,
                      width: 0.653.sw,
                      color: Colors.white,
                      radius: 5.r,
                    ),
                  ],
                ),
                SizedBox(height: 0.005.sh,),
                Row(
                  children: [
                    CustomContainer(
                      child: Center(
                          child: Text(
                            "End",
                            style: TextStyle(color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.bold),
                          )),
                      borderWidth: 1,
                      height: 0.043.sh,
                      width: 0.3.sw,
                      color: Color(0xFF67829F),
                      radius: 5.r,
                    ),
                    SizedBox(width: 0.013.sw,),
                    CustomContainer(
                      child: Center(
                          child: Text(
                            "Activity Type",
                            style: TextStyle(color: Colors.black,fontSize: 12.r,fontWeight: FontWeight.bold),
                          )),
                      borderWidth: 1,
                      height: 0.043.sh,
                      width: 0.653.sw,
                      color: Colors.white,
                      radius: 5.r,
                    ),
                  ],
                ),
                SizedBox(height: 0.005.sh,),
                Row(
                  children: [
                    CustomContainer(
                      child: Center(
                          child: Text(
                            "$EndTime",
                            style: TextStyle(color: Colors.white,fontSize: 10.sp,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                      borderWidth: 1,
                      height: 0.07.sh,
                      width: 0.3.sw,
                      color: Color(0xFF67829F),
                      radius: 5.r,
                    ),
                    SizedBox(width: 0.013.sw,),
                    CustomContainer(
                      child: Center(
                          child: Text(
                            "$ActivityType",
                            style: TextStyle(color: Colors.black,fontSize: 12.sp,),
                          )),
                      borderWidth: 1,
                      height: 0.07.sh,
                      width: 0.653.sw,
                      color: Colors.white,
                      radius: 5.r,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
