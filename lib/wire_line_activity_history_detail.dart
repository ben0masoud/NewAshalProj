
import 'package:ashal_ver_3/services/wirelineActivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'constant_values.dart';
import 'info_Container.dart';

class WireLineActivityHistoryDetialPage extends StatefulWidget {
  WirelineActivity? item;
   WireLineActivityHistoryDetialPage({Key? key,this.item}) : super(key: key);

  @override
  State<WireLineActivityHistoryDetialPage> createState() => _WireLineActivityHistoryDetialPageState();
}

class _WireLineActivityHistoryDetialPageState extends State<WireLineActivityHistoryDetialPage> {
  @override
  List<String?> OilCompany = ['FPS',
    'EXPERTEST',
    'BJ',
    'GDMC',
    'GOFSC',
    'GOFSCO',
    'HLS',
    'NPSC',
    'SLB',
    'SPETCO',
    'WeatherFord' ];
  Widget build(BuildContext context) {

    //double Myheight =  MediaQuery.of(context).size.height / 9 ;

    DateTime dt1 = DateFormat('MM/dd/yyyy hh:mm').parse(widget.item!.START_TIME.toString());
    String _start_time = DateFormat('dd/MM/yyyy h:mm a').format(dt1);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantValues.MainColor1,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Center(
          child: Column(
            children: [
              Text(
                "Well Activity",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.bold),
              ),
              Text(
                widget.item!.UWI.toString(),style: TextStyle(color: Colors.black,fontSize: 13.sp),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,//MediaQuery.of(context).size.width ,
        height: double.infinity,//MediaQuery.of(context).size.height,

        child: Column(

          children: [
            SizedBox(height: 0.05.sh),
            Image.asset(
              //'assets/no-image-available.jpeg',
              OilCompany.indexOf(widget.item!.CONTRACTOR) > -1  //where((item) => item == list[i]!.CONTRACTOR)
                  ? 'assets/company/${widget.item!.CONTRACTOR}.png'
                  : 'assets/company/NoLogo.png',
              height: 0.15.sh,
              width:  0.5.sw,
              //color: Colors.red,
              fit: BoxFit.fitWidth,
            ),
            Container(
              height: 0.05.sh,
              width: double.infinity,
              //color: Colors.red,
              child: Text(
                widget.item!.CONTRACTOR.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp  ,
                    fontWeight: FontWeight.bold
                ),

              ),
            ),
            Container(

              height:  0.08.sh,
              width: double.infinity,
              color: Colors.blue.withOpacity(0.05),
              /*decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10-2.0),
                        topLeft: Radius.circular(10-2.0),

                      ),
                    ),*/
              child: Text(
                widget.item!.ACTIVITY_NAME.toString(),
                textAlign: TextAlign.center,

                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp  ,
                    fontWeight: FontWeight.bold
                ),

              ),
            ),
            Container(
              height: 0.05.sh,
              width: double.infinity,

              child: Center(
                child: Text(
                  widget.item!.UWI.toString(),
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.sp  ,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              height: 0.05.sh,
              width: double.infinity,

              /*decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10-2.0),
                        topLeft: Radius.circular(10-2.0),

                      ),
                    ),*/
              child: Text(
                "Status",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp  ,
                    fontWeight: FontWeight.bold
                ),

              ),
            ),
            Container(
              height:  0.05.sh,
              width: double.infinity,
              color: Colors.blue.withOpacity(0.05),
              /*decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10-2.0),
                        topLeft: Radius.circular(10-2.0),

                      ),
                    ),*/
              child: Text(
                widget.item!.STATUS.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp  ,
                  //fontWeight: FontWeight.bold
                ),

              ),
            ),
            Container(
              height:  0.05.sh,
              width: double.infinity,
              /*decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10-2.0),
                        topLeft: Radius.circular(10-2.0),

                      ),
                    ),*/
              child: Text(
                "Start Date",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp  ,
                    fontWeight: FontWeight.bold
                ),

              ),
            ),
            Container(
              height:  0.05.sh,
              width: double.infinity,
              color: Colors.blue.withOpacity(0.05),
              /*decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10-2.0),
                        topLeft: Radius.circular(10-2.0),

                      ),
                    ),*/
              child: Text(
                _start_time,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp  ,
                  //fontWeight: FontWeight.bold
                ),

              ),
            ),
            Container(
              height:  0.05.sh,
              width: double.infinity,
              /*decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10-2.0),
                        topLeft: Radius.circular(10-2.0),

                      ),
                    ),*/
              child: Text(
                "Remarks",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp  ,
                    fontWeight: FontWeight.bold
                ),

              ),
            ),

        Padding(
          padding:  EdgeInsets.all(2.r),
          child: infoContainer(height: 0.22.sh,
            width: double.infinity,
            textColor: Colors.black,
            backgroundColor: Colors.blue.withOpacity(0.05),
            borderColor: Colors.black,
            text: widget.item!.REMARKS.toString(), size: 12.sp, ltRadius: 5.r, rtRadius: 5.r, lbRadius: 5.r, rbRadius: 5.r,
            borderWidthL: 2.0,borderWidthT: 2.0,borderWidthR: 2.0,borderWidthB: 2.0,
            softWrap: true,
          ),
        ),
          ],
        ),
      ),

    );
  }
}
