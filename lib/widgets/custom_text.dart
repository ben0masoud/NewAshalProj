import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {required this.text, this.size, this.color, this.fontwdth,this.textAlign});

  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? fontwdth;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text!,textAlign: textAlign,style: TextStyle(fontSize: size ?? 10,fontWeight: fontwdth ?? null,color: color ?? Colors.black),);
  }
}