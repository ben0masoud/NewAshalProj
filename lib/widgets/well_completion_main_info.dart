
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WellCompletionMainInfo extends StatelessWidget {
  const WellCompletionMainInfo({Key? key,
    this.wellStatus,
    this.uwi,
    this.facilityNameID,
    this.currentStatue,
    this.leftMethod,
    this.start_time,
    this.end_time}) : super(key: key);

  final String? wellStatus;
  final String? uwi;
  final String? facilityNameID;
  final String? currentStatue;
  final String? leftMethod;
  final String? start_time;
  final String? end_time;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: MediaQuery.of(context).size.height,
            // color: Colors.black12,
            child: WellStatusAvatar(wellStatus!,end_time!),
          ),
          // SizedBox(width: 5,),
          Container(
              width: 90,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              // color: Colors.green,
              child: Text(uwi!,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
          ),
          Container(
              width: 70,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              // color: Colors.yellow,
              child: Text(facilityNameID!,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center)),
          Expanded(
            child: Container(
              color: Colors.blueAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        color:  Color(0xFF345A7F),
                        child:Text(currentStatue!,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 12),)
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        color: Color(0xFFD98654),
                        child:Text(leftMethod!,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 12))
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget WellStatusAvatar(String status,String end_time)
  {
    Color statusColor;

    if(wellStatus == "OPEN")
    {
      status = "Open";
      statusColor = Colors.green;
    }
    else
    {
      if(end_time == "") {
        status = "Close";
        statusColor = Colors.grey;
      }
      else
      {
        status = "Close";
        statusColor = Colors.red;
      }
    }
    DateTime dt1 ;
    String formattedDate ;
    if(end_time != "") {
      dt1 = DateFormat('MM/dd/yyyy hh:mm').parse(end_time);
       formattedDate = DateFormat('dd/MM/yyyy').format(dt1);
    }
    else
      formattedDate="";
    return
        CircleAvatar(
          backgroundColor: statusColor,
          child:Stack(
            children: [
          Center(child: Text(status,style: TextStyle(color: Colors.white,fontSize: 15),)),
              if(statusColor == Colors.red)
                Center(

                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-30/360)
                      ,child: Text(formattedDate,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 9,
                            backgroundColor: Colors.black,
                            color: Colors.white
                        ),
                      ),
                    ),
                )
          ],
        ),
    );

  }
}
