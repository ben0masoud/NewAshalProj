
//import 'package:ashal_ver_3/info_Container.dart';
import 'package:ashal_ver_3/services/WellProduction.dart';
import 'package:ashal_ver_3/well_test_details_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

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
    dt1 = DateFormat('MM/dd/yyyy hh:mm').parse(
        widget.item!.PRODUCTION_DATE.toString());
    _production_date =
        DateFormat('dd/MM/yyyy h:mm a').format(
            dt1);
    return Scaffold(
        appBar: AppBar(
          title: Text("Prod. of ${widget.item!.UWI} "),
        ),
        body:Container(
          child: Column(
            children: [
              SizedBox(height: 0.05.sh,),
              Container(
                width: 0.2.sw,
                height: 0.1.sh,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    topLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                  ),
                  border: Border.all(color: Colors.black,width: 2),
                  //boxShadow: BoxShadow(blurRadius: ),

                ),
                child: Column(

                  children: [
                    Container(
                      height:  0.035.sh,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.r),
                          topLeft: Radius.circular(8.r),

                        ),
                      ),
                      child: Text(
                        "Days",
                        textAlign: TextAlign.center,
                        //overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp  ,
                            fontWeight: FontWeight.bold
                        ),

                      ),
                    ),

                    Container(
                      //alignment: Alignment.center,
                      // padding: EdgeInsets.fromLTRB(2, 10, 2, 2),
                      margin: EdgeInsets.only(top: 5.r),
                      //width: 30,
                      //height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                      child: Center(
                        child: Text(
                            widget.item!.PRODUCTIVE_DAYS.toString(),
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp  ,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
