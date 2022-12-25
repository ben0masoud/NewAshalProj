

import 'package:ashal_ver_3/widgets/custom_container.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class GcSummaryContainer extends StatelessWidget {
  GcSummaryContainer(
      {Key? key,required this.child, this.height, this.width, this.color,this.radius,this.borderColor,this.borderWidth}): super(key: key);
 // final Function? onTap;
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final double? radius;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(text: "GC",size: 20,color: Colors.blueAccent,fontwdth: FontWeight.w200,),
        SizedBox(height: 8,),
        CustomContainer(
            height: 20,
            width: double.infinity,
            child: CustomText(text: "GC value",size: 15,color: Colors.black,fontwdth: FontWeight.bold,),
            borderColor: Colors.black,
            borderWidth: 1,
            radius: 5,
            color: Colors.white,
        ),
        SizedBox(height: 8,),
        Row(
          children: [
            CustomContainer(
              height: 20,
              width: 80,
              child: CustomText(text: "Connection Date",size: 15,color: Colors.black,fontwdth: FontWeight.bold,),
              borderColor: Colors.black,
              borderWidth: 1,
              radius: 5,
              color: Colors.white,
            ),
            SizedBox(width: 8,),
            CustomContainer(
              height: 20,
              width: 100,
              child: CustomText(text: "Connection Date",size: 15,color: Colors.black,fontwdth: FontWeight.bold,),
              borderColor: Colors.black,
              borderWidth: 1,
              radius: 5,
              color: Colors.white,
            ),
          ],
        )

      ],
    );
  }
}
