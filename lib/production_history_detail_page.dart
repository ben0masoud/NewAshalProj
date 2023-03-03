
//import 'package:ashal_ver_3/info_Container.dart';
import 'package:ashal_ver_3/services/WellProduction.dart';
import 'package:ashal_ver_3/well_test_details_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'constant_values.dart';

class ProductionHistoryDetailPage extends StatefulWidget {
  WellProduction? item;
   ProductionHistoryDetailPage({Key? key,this.item}) : super(key: key);

  @override
  State<ProductionHistoryDetailPage> createState() => _ProductionHistoryDetailPageState();
}

class _ProductionHistoryDetailPageState extends State<ProductionHistoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    DateTime dt1;
    String _production_date ;
    dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(
        widget.item!.PRODUCTION_DATE.toString());
    _production_date =
        DateFormat('dd/MM/yyyy hh:mm a').format(
            dt1);
    return Scaffold(
        appBar: AppBar(
          title: Text("Production History",style: TextStyle(color: Colors.blue),),
          backgroundColor: ConstantValues.MainColor1,
          iconTheme: IconThemeData(color: Colors.blue),
        ),
        body:Container(
          child: Column(
            children: [
              SizedBox(height: 0.05.sh,),
              Text('${widget.item!.UWI} ${widget.item!.FACILITY_TYPE} - ${widget.item!.FACILITY_ID}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 0.01.sh,),
              Container(
                //padding: EdgeInsets.all(20.r),
                  width: 0.3.sw,
                  height: 0.15.sh,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/Production/ProductionDays.png"), //assets/icons/Production/ProductionDays.png
                      //alignment: Alignment.center,
                      fit: BoxFit.fill,
                    )
                    ,
                  ),
                  child: Center(
                      child: Text(widget.item!.PRODUCTIVE_DAYS.toString(),
                                  style: TextStyle(fontSize: 18.sp,fontWeight:
                                                     FontWeight.bold),
                      ),
                  )
              ),
              SizedBox(height: 0.02.sh,),
              WellTestDetailsContainer(height: 0.12.sh,
              width: double.infinity ,
              textColor: Colors.black,
              backgroundColor: Colors.white,
              //borderColor: Colors.black,
              name: "Production Date",
              value: _production_date,
                  size: 16.sp),
              WellTestDetailsContainer(height: 0.12.sh,
                  width: double.infinity ,
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                  //borderColor: Colors.black,
                  name: "OIL VOLUME",
                  value: widget.item!.OIL_VOLUME.toString(),
                  size: 16),
              WellTestDetailsContainer(height: 0.12.sh,
                  width: double.infinity ,
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                 // borderColor: Colors.black,
                  name: "CONDENSTAE VOLUME",
                  value: widget.item!.CONDENSATE_VOLUME.toString(),
                  size: 16.sp),
              WellTestDetailsContainer(height: 0.12.sh,
                  width: double.infinity ,
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                 // borderColor: Colors.black,
                  name: "GAS VOLUME",
                  value: widget.item!.GAS_VOLUME.toString(),
                  size: 16.sp),
              WellTestDetailsContainer(height: 0.12.sh,
                  width: double.infinity ,
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                 // borderColor: Colors.black,
                  name: "WATER VOLUME",
                  value: widget.item!.WATER_VOLUME.toString(),
                  size: 16.sp),

            ],
          ),
        ),

    );
  }
}
