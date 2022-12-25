
import 'package:flutter/material.dart';

class WellCompletionMainInfo extends StatelessWidget {
  const WellCompletionMainInfo({Key? key,
    this.wellStatus,
    this.uwi,
    this.facilityNameID,
    this.currentStatue,
    this.leftMethod}) : super(key: key);

  final String? wellStatus;
  final String? uwi;
  final String? facilityNameID;
  final String? currentStatue;
  final String? leftMethod;

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String status;
    if(wellStatus == "OPEN")
    {
      status = "Open";
      statusColor = Colors.green;
    }
    else
    {
      status = "Close";
      statusColor = Colors.red;
    }
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: MediaQuery.of(context).size.height,
            // color: Colors.black12,
            child: CircleAvatar(
              child: Text(status,style: TextStyle(color: Colors.white,fontSize: 12),),
              backgroundColor: statusColor,
            ),
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
              width: 40,
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
}
