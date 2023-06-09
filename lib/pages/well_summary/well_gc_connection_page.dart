//import 'package:ashal_ver_3/info_Container.dart';
import 'package:ashal_ver_3/services/wellLatest.dart';
import 'package:ashal_ver_3/widgets/custom_container.dart';
import 'package:ashal_ver_3/widgets/custom_text.dart';
//import 'package:ashal_ver_3/services/wellOperationStatus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';


class WellGcConnectionPage extends StatefulWidget {
  WellLatest? item;

   WellGcConnectionPage({Key? key,this.item}) : super(key: key);

  @override

  _WellGcConnectionPageState createState() => _WellGcConnectionPageState();
}

class _WellGcConnectionPageState extends State<WellGcConnectionPage> {
  @override
  Widget build(BuildContext context) {

    Color titleBackgroundColor = Colors.white;
    Color titleTextColor = Colors.black;
    Color titleBorderColor = Colors.black;

    Color valueBackgroundColor = Colors.white;
    Color valueTextColor = Colors.black;
    Color valueBorderColor = Colors.black;

   // print("well op status page UWI  = "+widget.item!.UWI.toString());
    DateTime dt1;
    String _gc_conn_date = "";
    String _header_conn_date = "";
    String _slot_conn_date = "";
    if(widget.item!.GC_CONN_DATE!.isNotEmpty) {
      dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(
          widget.item!.GC_CONN_DATE.toString());
      _gc_conn_date = DateFormat('dd/MM/yyyy hh:mm a').format(dt1);
    }
    if(widget.item!.HEADER_CONN_DATE!.isNotEmpty) {
      dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(
          widget.item!.HEADER_CONN_DATE.toString());
      _header_conn_date = DateFormat('dd/MM/yyyy hh:mm a').format(dt1);
    }
    if(widget.item!.SLOT_CONN_DATE!.isNotEmpty) {
      dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(
          widget.item!.SLOT_CONN_DATE.toString());
      _slot_conn_date = DateFormat('dd/MM/yyyy hh:mm a').format(dt1);
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
                  "Gc Connection Summary",
                  style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.bold),
                ),
              ),

              Container(

                //height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(8.r),
                color:  Color(0xffaabbd5), //Colors.grey,
                child: Column(
                  children: [
                    GcConnCard('GC',widget.item!.GC!,_gc_conn_date!,titleBackgroundColor,valueBackgroundColor),
                    SizedBox(height: 0.002.sh,),
                    GcConnCard('HEADER',widget.item!.HEADER!,_header_conn_date!,titleBackgroundColor,valueBackgroundColor),
                    GcConnCard('SLOT',widget.item!.SLOT!,_slot_conn_date!,titleBackgroundColor,valueBackgroundColor),
                    SizedBox(height: 0.002.sh,),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget GcConnCard(String? gc_title,String? gc_name,String? conn_date,Color title,Color value) {

    /*if(conn_date!.isNotEmpty) {
      DateTime? dt3 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(conn_date!);
      conn_date = DateFormat('dd/MM/yyyy hh:mm a').format(dt3!);
    }*/

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomContainer(
          height: 0.103.sh,
          width: 0.22.sw,
          child: Center(child: CustomText(text: gc_title!,size: 15.sp,color: Colors.blue,fontwdth: FontWeight.bold,textAlign: TextAlign.right,),),
          borderColor: Colors.black,
          borderWidth: 1,
          radius: 5.r,
          color: title,
        ),
        //CustomText(text: gc_title!,size: 20.sp,color: Colors.blue,fontwdth: FontWeight.bold,textAlign: TextAlign.right,),
        SizedBox(width: 0.002.sw,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomContainer(
              height: 0.05.sh,
              width: 0.73.sw,
              child: Center(child: CustomText(text: gc_name!,size: 15.sp,color: Colors.black,fontwdth: FontWeight.bold,)),
              borderColor: Colors.black,
              borderWidth: 1,
              radius: 5.r,
              color: value,
            ),
            SizedBox(height: 0.002.sh,),
            Row(
              children: [
                CustomContainer(
                  height: 0.05.sh,
                  width: 0.24.sw,
                  child: Center(child: CustomText(text: "Connection Date",size: 11.sp,color: Colors.black,fontwdth: FontWeight.bold,textAlign: TextAlign.center,)),
                  borderColor: Colors.black,
                  borderWidth: 1,
                  radius: 5.r,
                  color: title,
                ),
                SizedBox(width: 0.007.sw,),
                CustomContainer(
                  height: 0.05.sh,
                  width: 0.48.sw,
                  child: Center(child: CustomText(text: conn_date!,size: 12.sp,color: Colors.black,fontwdth: FontWeight.bold,)),
                  borderColor: Colors.black,
                  borderWidth: 1,
                  radius: 5.r,
                  color: value,
                ),
              ],
            ),
            SizedBox(height: 0.002.sh,),
          ],
        ),
      ],
    );
  }
}
