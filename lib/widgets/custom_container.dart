import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatefulWidget {
  CustomContainer(
      {required this.child, this.height, this.width, this.onTap, this.color,this.radius,this.borderColor,this.borderWidth});
  final Function? onTap;
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final double? radius;
  final Color? borderColor;
  final double? borderWidth;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context,designSize: const Size(360,690));
    if(widget.onTap != null)
      return GestureDetector(
        onTap: () {
          if(widget.onTap != null){
            widget.onTap!();
          }
        },
        child: Container(
          height: widget.height ?? null,
          width: widget.width ?? null,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: widget.color ?? Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 0)),
            border:(widget.borderWidth != 0) ?
            Border.all(width: widget.borderWidth ?? 0,color: widget.borderColor ?? Colors.black) : null,

          ),


          child: widget.child,
        ),
      );
      else
       return Container(
          height: widget.height ?? null,
          width: widget.width ?? null,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: widget.color ?? Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 0)),
            border:(widget.borderWidth != 0) ?
            Border.all(width: widget.borderWidth ?? 0,color: widget.borderColor ?? Colors.black) : null,

          ),


          child: widget.child,
        );


  }
}