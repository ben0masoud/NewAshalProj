import 'package:ashal_ver_3/info_Container.dart';
//import 'package:ashal_ver_3/services/fetchDataApi.dart';
//import 'package:ashal_ver_3/services/wellBore.dart';
import 'package:ashal_ver_3/services/wellLatest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class WellBorePage extends StatefulWidget {
  WellLatest? item;


  WellBorePage({ Key? key,  this.item}) : super(key: key);
  @override

  _WellBorePageState createState() => _WellBorePageState();

}
class _WellBorePageState extends State<WellBorePage> {

  @override

  Widget build(BuildContext context) {
   // FetchDataApi fetchApi = FetchDataApi();
    ScreenUtil.init(context,designSize: Size(360, 690));
    DateTime dt1;
    String _spud_date = "";
    DateTime dt2;
    String _completion_date = "";
    if(widget.item!.SPUD_DATE != "") {
      dt1 = DateFormat('MM/dd/yyyy hh:mm').parse(
          widget.item!.SPUD_DATE.toString());
      _spud_date = DateFormat('dd/MM/yyyy h:mm a').format(dt1);
    }
    if(widget.item!.COMPLETION_DATE != "") {
       dt2 = DateFormat('MM/dd/yyyy hh:mm').parse(
          widget.item!.COMPLETION_DATE.toString());
       _completion_date = DateFormat('dd/MM/yyyy h:mm a').format(dt2);
    }

    print("well bore page UWI  = "+widget.item!.UWI.toString());
    double fontSize = 10.sp;
    return Scaffold(

      body: Center(

        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(18.r),topRight: Radius.circular(18.r)),
                color:  Color(0xffaabbd5)
              ),
              height: 0.05.sh,
              width: 0.7.sw,
              child: Text(
                "Well Bore Summary",
                style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.r),
              color:  Color(0xffaabbd5), //Colors.grey,
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                infoContainer(height: 0.05.sh,
                                    width: 0.28.sw,
                                    textColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    borderColor: Colors.black,
                                    text: "Elevation", size: fontSize, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0.r, rbRadius: 0.r,
                                    borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                                ),
                                SizedBox(height: 0.005.sh),
                                infoContainer(height: 0.05.sh,
                                    width: 0.28.sw,
                                    textColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    borderColor: Colors.black,
                                    text: widget.item!.ELEVATION.toString(), size: 15.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                                    borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(children: [
                              //Text("Elevation Ref."),
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: Colors.black,
                                backgroundColor: Colors.white,
                                borderColor: Colors.black,
                                text: "Elevation Ref.", size: fontSize, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                                  borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                              ),
                              SizedBox(height: 0.005.sh),
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: Colors.black,
                                backgroundColor: Colors.white,
                                borderColor: Colors.black,
                                text: widget.item!.ELEVATION_REF.toString(), size: 15.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                                  borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                              ),

                              //Text(widget.item!.elevatioN_REF.toString()),
                            ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 0.005.sh),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             // Text("Spud Date"),
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: Colors.black,
                                backgroundColor: Colors.white,
                                borderColor: Colors.black,
                                text: "Spud Date", size: fontSize, ltRadius: 5.r, rtRadius: 0, lbRadius: 5.r, rbRadius: 0,
                                borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                              ),
                             // Text(widget.item!.spuD_DATE.toString()),
                              SizedBox(height: 0.005.sh),
                                infoContainer(height: 0.05.sh,
                                  width: 0.28.sw,
                                  textColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  borderColor: Colors.black,
                                  text: "Comp. Date" , size: fontSize, ltRadius: 5.r, rtRadius: 0, lbRadius: 5.r, rbRadius: 0,
                                    borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                                ),
                            ],
                          ),
                          SizedBox(width: 0.01.sw,),
                          Column(
                            children: [
                              //Text(widget.item!.spuD_DATE.toString()),
                             // Text(widget.item!.comP_DATE.toString()),
                              infoContainer(height: 0.05.sh,
                                width: 0.5.sw,
                                textColor: Colors.black,
                                backgroundColor: Colors.white,
                                borderColor: Colors.black,
                                text: _spud_date, size: fontSize, ltRadius: 0, rtRadius: 5.r, lbRadius: 0, rbRadius: 5.r,
                                  borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                              ),
                              // Text(widget.item!.spuD_DATE.toString()),
                              SizedBox(height: 0.005.sh),
                              infoContainer(height: 0.05.sh,
                                width: 0.5.sw,
                                textColor: Colors.black,
                                backgroundColor: Colors.white,
                                borderColor: Colors.black,
                                text: _completion_date , size: fontSize, ltRadius: 0, rtRadius: 5.r, lbRadius: 0, rbRadius: 5.r,
                                  borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 0.005.sh),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                             // Text("Ground Elevation"),
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: Colors.black,
                                backgroundColor: Colors.white,
                                borderColor: Colors.black,
                                text: "Ground Elevation", size: fontSize, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                                  borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                              ),
                              SizedBox(height: 0.005.sh),
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: Colors.black,
                                backgroundColor: Colors.white,
                                borderColor: Colors.black,
                                text: widget.item!.GROUND_ELEVATION.toString(), size: 15.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                                  borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                              ),
                              //Text(widget.item!.grounD_ELEVATION.toString()),
                            ],
                          ),
                          Column(
                            children: [
                              //Text("Drillers TD"),
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: Colors.black,
                                backgroundColor: Colors.white,
                                borderColor: Colors.black,
                                text: "Drillers TD.", size: fontSize, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                                  borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                              ),
                              SizedBox(height: 0.005.sh),
                              infoContainer(height: 0.05.sh,
                                width: 0.28.sw,
                                textColor: Colors.black,
                                backgroundColor: Colors.white,
                                borderColor: Colors.black,
                                text: widget.item!.DRILLERS_TD.toString(), size: 15.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                                  borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                              ),
                              //Text(widget.item!.drillerS_TD.toString()),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )




    ],
        ),
      ),
    );
  }
}
