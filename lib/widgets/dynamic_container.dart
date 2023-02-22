


import 'package:flutter/material.dart';

class DynamicContainer extends StatelessWidget {
  DynamicContainer({
    Key? key,
    required this.h,
    required this.w,
    required this.title,
    required this.value,
    this.titleSize,
    this.valueSize,
    this.matrixType,
    this.borderType

  }) : super(key: key);

  final double h;
  final double w;
  final String title;
  final String value;
  double? titleSize;
  double? valueSize;
  String? matrixType;
  double? borderType;

  @override
  Widget build(BuildContext context) {
    return Container(height: h,width: w,


      child: (matrixType == "C") ? Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: (h / 2) - borderType!,
            width: w - borderType!,
            decoration: BoxDecoration(
              borderRadius: (borderType!=0) ? BorderRadius.circular(5) : null,
              color: (borderType==0) ? Colors.white : null,
            ),
            child:  Text(
              title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: (h / 2) - borderType!,
            width: w - borderType!,
            decoration: BoxDecoration(
              borderRadius: (borderType!=0) ? BorderRadius.circular(5) : null,
              color: (borderType==0) ? Colors.white : null,
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize: valueSize,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ) :
      Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: h - borderType!,
            width: (w/2) - borderType!,
            decoration: BoxDecoration(
              borderRadius: (borderType!=0) ? BorderRadius.circular(5) : null,
              color: (borderType==0) ? Colors.white : null,
            ),
            child:  Text(
              title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: h - borderType!,
            width: (w/2) - borderType!,
            decoration: BoxDecoration(
              borderRadius: (borderType!=0) ? BorderRadius.circular(5) : null,
              color: (borderType==0) ? Colors.white : null,
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize: valueSize,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}