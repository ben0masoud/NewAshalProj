
import 'package:flutter/material.dart';

class WellTestDetailsContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color textColor;
   Color? backgroundColor;
   double? BorderSize;
  final Color borderColor;
  final String name;
  final String value;
  final double size;
  //final double ltRadius;
  //final double rtRadius;
  //final double lbRadius;
  //final double rbRadius;
  //final double? borderWidthL;
  //final double? borderWidthT;
  //final double? borderWidthR;
  //final double? borderWidthB;
  //double zeroRadius;
  IconData? icon;
  bool? haveIcon;


  WellTestDetailsContainer({Key? key,
    required this.height,
    required this.width,
    required this.textColor,
    required this.backgroundColor,
     this.borderColor = Colors.black,
    this.BorderSize=0.0,
    required this.name,
    required this.value,
    required this.size,
    //required this.ltRadius,
    //required this.rtRadius,
    //required this.lbRadius,
    //required this.rbRadius,
    //this.borderWidthL,
    //this.borderWidthT,
    //this.borderWidthR,
    //this.borderWidthB,
    this.icon,
    this.haveIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text(
              name,
              textAlign: TextAlign.center,
              //overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: textColor,
                  fontSize: size  ,
                  fontWeight: FontWeight.bold
              ),
            ),
            Divider(),
            Text(
              value,
              textAlign: TextAlign.center,
              //overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: textColor,
                  fontSize: size  ,
                  //fontWeight: FontWeight.bold
              ),
            ),
          ],
        )

      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          width: BorderSize!,
          color: borderColor
        )
        /*
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(rtRadius),
          topLeft: Radius.circular(ltRadius),
          bottomRight: Radius.circular(rbRadius),
          bottomLeft: Radius.circular(lbRadius),
        ),

        border: Border(
          left: BorderSide(
            color: borderColor,
            width: borderWidthL!,
          ),
          top: BorderSide(
            color: borderColor,
            width: borderWidthT!,
          ),
          right: BorderSide(
            color: borderColor,
            width: borderWidthR!,
          ),
          bottom: BorderSide(
            color: borderColor,
            width: borderWidthB!,
          ),
        ),

         */
      ),
    );
  }
}
