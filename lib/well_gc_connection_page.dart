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
  State<WellGcConnectionPage> createState() => _WellGcConnectionPageState();
}

class _WellGcConnectionPageState extends State<WellGcConnectionPage> {
  @override
  Widget build(BuildContext context) {
   // print("well op status page UWI  = "+widget.item!.UWI.toString());
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
                    GcConnCard('GC',widget.item!.GC.toString(),widget.item!.GC_CONN_DATE.toString()),
                    SizedBox(height: 0.002.sh,),
                    GcConnCard('HEADER',widget.item!.HEADER.toString(),widget.item!.HEADER_CONN_DATE.toString()),
                    GcConnCard('SLOT',widget.item!.SLOT.toString(),widget.item!.SLOT_CONN_DATE.toString()),
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
  Widget GcConnCard(String? gc_title,String? gc_name,String? conn_date) {
    DateTime? dt3 = DateFormat('MM/dd/yyyy hh:mm').parse(conn_date!);
    String? _conn_date = DateFormat('dd/MM/yyyy h:mm a').format(dt3);
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
          color: Colors.white,
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
              color: Colors.white,
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
                  color: Colors.white,
                ),
                SizedBox(width: 0.007.sw,),
                CustomContainer(
                  height: 0.05.sh,
                  width: 0.48.sw,
                  child: Center(child: CustomText(text: _conn_date,size: 12.sp,color: Colors.black,fontwdth: FontWeight.bold,)),
                  borderColor: Colors.black,
                  borderWidth: 1,
                  radius: 5.r,
                  color: Colors.white,
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
