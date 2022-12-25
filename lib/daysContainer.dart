

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DaysContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final double size;
  final double radius;
  final double borderWidth;
  //double zeroRadius;
  IconData? icon;
  bool? haveIcon;


  DaysContainer({Key? key,
    required this.height,
    required this.width,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,

    required this.text,
    required this.size,
  required this.radius,
    required this.borderWidth,

    this.icon,
    this.haveIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius),
            topLeft: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
            bottomLeft: Radius.circular(radius),
          ),
    border: Border.all(color: borderColor,width: borderWidth)

        ),
        child: Column(

            children: [
              Container(
                width: width,
        height: height * 0.3,
        decoration: BoxDecoration(
        color: Colors.red,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius-5.0),
            topLeft: Radius.circular(radius-5.0),

          ),
        ),
                child: Text(
                    "Days",
                    textAlign: TextAlign.center,
                    //overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size  ,
                        fontWeight: FontWeight.bold
                    ),

                ),
              ),
              SizedBox(height: 8,),
              Container(
                //alignment: Alignment.topCenter,
               // padding: EdgeInsets.fromLTRB(2, 10, 2, 2),
                //margin: EdgeInsets.only(top: 20),
                width: width,
                //height: 30,
                decoration: BoxDecoration(
                  color: backgroundColor
                ),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: size  ,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
      ),

    );
  }
}
