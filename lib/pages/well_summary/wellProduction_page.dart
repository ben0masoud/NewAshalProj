import 'package:ashal_ver_3/widgets/info_Container.dart';
//import 'package:ashal_ver_3/services/WellProduction.dart';
//import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/wellLatest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../widgets/daysContainer.dart';

class WellProductionPage extends StatefulWidget {
  WellLatest? item;

   WellProductionPage({Key? key, this.item}) : super(key: key);

  @override
  _WellProductionPageState createState() => _WellProductionPageState();
}

class _WellProductionPageState extends State<WellProductionPage> {
  @override
  Widget build(BuildContext context) {
   //FetchDataApi fetchApi = FetchDataApi();
    ScreenUtil.init(context,designSize: Size(360, 690));

    Color titleBackgroundColor = Colors.white;
    Color titleTextColor = Colors.black;
    Color titleBorderColor = Colors.black;

    Color valueBackgroundColor = Colors.white;
    Color valueTextColor = Colors.black;
    Color valueBorderColor = Colors.black;

    print(" production page UWI  = "+widget.item!.UWI.toString());
    DateTime dt1;
    String _production_date = "";
    if(widget.item!.PRODUCTION_DATE != "") {
      dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(widget.item!.PRODUCTION_DATE.toString());
      _production_date = DateFormat('dd/MM/yyyy hh:mm a').format(dt1);
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                  "Production Summary",
                  style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.bold),
                ),
              ),
              Container(

                padding: EdgeInsets.all(8.r),
                color: Color(0xffaabbd5),
                child: Column(
                  children: [
                    //SizedBox(height: 8.h,),
                    Container(
                      //padding: EdgeInsets.all(8.r),
                      color:  Color(0xffaabbd5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Text("Production Date"),
                          infoContainer(height: 0.05.sh,
                              width: 0.4.sw,
                              textColor: titleTextColor,
                              backgroundColor: titleBackgroundColor,
                              borderColor: titleBorderColor,
                              text: "Production Date", size: 12.sp, ltRadius: 5.r, rtRadius: 0, lbRadius: 5.r, rbRadius: 0,
                              borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                          ),
                          //SizedBox(width: 8,),
                          //Text(widget.item!.productioN_DATE.toString()),
                          SizedBox(width: 0.02.sw,),
                          infoContainer(height: 0.05.sh,
                              width: 0.45.sw,
                              textColor: valueTextColor,
                              backgroundColor: valueBackgroundColor,
                              borderColor: valueBorderColor,
                              text: _production_date, size: 12.sp, ltRadius: 0, rtRadius: 5, lbRadius: 0, rbRadius: 5,
                              borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color:  Color(0xffaabbd5),
                      child: Row(
                        children: [
                        SizedBox(width: 0.02.sw,),
                        Column(children:
                        [
                          SizedBox(height: 0.02.sh,),
                          infoContainer(height: 0.05.sh,
                              width: 0.30.sw,
                              textColor: titleTextColor,
                              backgroundColor: titleBackgroundColor,
                              borderColor: titleBorderColor,
                              text: "Oil Volume", size: 12.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                              borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                          ),
                          SizedBox(height: 0.005.sh,),
                          infoContainer(height: 0.05.sh,
                              width: 0.30.sw,
                              textColor: valueTextColor,
                              backgroundColor: valueBackgroundColor,
                              borderColor: valueBorderColor,
                              text: widget.item!.OIL_VOLUME!+' BBL', size: 12.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                              borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                          ),
                          SizedBox(height: 0.03.sh,),
                          infoContainer(height: 0.05.sh,
                              width: 0.30.sw,
                              textColor: titleTextColor,
                              backgroundColor: titleBackgroundColor,
                              borderColor: titleBorderColor,
                              text: "Gas Volume", size: 12.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                              borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                          ),
                          SizedBox(height: 0.005.sh,),
                          infoContainer(height: 0.05.sh,
                              width: 0.30.sw,
                              textColor: valueTextColor,
                              backgroundColor: valueBackgroundColor,
                              borderColor: valueBorderColor,
                              text: widget.item!.GAS_VOLUME!+' MMSCF', size: 12.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                              borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                          ),
                        ],
                        ),
                        SizedBox(width: 0.02.sw,),
                        Column(children:
                        [
                          // DaysContainer(height: 0.13.sh,width: 0.25.sw,borderWidth: 5,textColor: Colors.black,
                          //   text:  widget.item!.PRODUCTIVE_DAYS.toString(),
                          //   size: 20.sp,radius: 30.r,
                          //   borderColor: Colors.blueGrey,
                          //   backgroundColor: Colors.white,
                          // ),
                          Container(
                              height: 0.13.sh,
                              width: 0.25.sw,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/icons/Production/ProductionDays.png"), //assets/icons/Production/ProductionDays.png
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                )
                                ,
                              ),
                              child: Center(child: Text(widget.item!.PRODUCTIVE_DAYS.toString(),style: TextStyle(fontSize: 20.sp),))
                          ),
                        ],
                        ),
                        SizedBox(width: 0.02.sw,),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.start,

                          children:
                          [
                            //  Text("Condensate Volume"),
                            //  Text(widget.item!.condensatE_VOLUME.toString()),
                            //  Text("Water Volume"),
                            //  Text(widget.item!.wateR_VOLUME.toString()),
                            SizedBox(height: 0.02.sh,),
                            infoContainer(height: 0.05.sh,
                                width: 0.33.sw,
                                textColor: titleTextColor,
                                backgroundColor: titleBackgroundColor,
                                borderColor: titleBorderColor,
                                text: "Condensate Volume", size: 12.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                                borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                            ),
                            SizedBox(height: 0.005.sh,),
                            infoContainer(height: 0.05.sh,
                                width: 0.33.sw,
                                textColor: valueTextColor,
                                backgroundColor: valueBackgroundColor,
                                borderColor: valueBorderColor,
                                text: (widget.item!.CONDENSATE_VOLUME!.isNotEmpty) ? widget.item!.CONDENSATE_VOLUME!+' BBL' : '', size: 12.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                                borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                            ),
                            SizedBox(height: 0.03.sh,),
                            infoContainer(height: 0.05.sh,
                                width: 0.33.sw,
                                textColor: titleTextColor,
                                backgroundColor: titleBackgroundColor,
                                borderColor: titleBorderColor,
                                text: "Water Volume", size: 12.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 0, rbRadius: 0,
                                borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                            ),
                            SizedBox(height: 0.005.sh,),
                            infoContainer(height: 0.05.sh,
                                width: 0.33.sw,
                                textColor: valueTextColor,
                                backgroundColor: valueBackgroundColor,
                                borderColor: valueBorderColor,
                                text: widget.item!.WATER_VOLUME!+' BBL', size: 12.sp, ltRadius: 0, rtRadius: 0, lbRadius: 5.r, rbRadius: 5.r,
                                borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0
                            ),

                          ],
                        ),

                      ],
                      ),
                    ),
                    SizedBox(height: 8.h,),
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
