

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class infoContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final double size;
  final double ltRadius;
  final double rtRadius;
  final double lbRadius;
  final double rbRadius;
  final double? borderWidthL;
  final double? borderWidthT;
  final double? borderWidthR;
  final double? borderWidthB;
   bool? softWrap=false;
  //double zeroRadius;
  IconData? icon;
  bool? haveIcon;


  infoContainer({Key? key,
    required this.height,
    required this.width,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.text,
    required this.size,
    required this.ltRadius,
    required this.rtRadius,
    required this.lbRadius,
    required this.rbRadius,
    this.borderWidthL,
    this.borderWidthT,
    this.borderWidthR,
    this.borderWidthB,
    this.softWrap,
    this.icon,
    this.haveIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context,designSize: Size(360, 690));

    return Container(
      alignment: Alignment.topCenter,
      width: width,
      height: height,
      child: Center(
          child: Text(
            text,
            textAlign: TextAlign.left,
            //overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: textColor,
              fontSize: size  ,
              fontWeight: FontWeight.bold
            ),
              softWrap: this.softWrap
          ),
        ),
      decoration: BoxDecoration(
        color: backgroundColor,
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
      ),
    );
  }
}
