import 'package:flutter/material.dart';

class UserContainer extends StatelessWidget {
  UserContainer({
    Key? key,this.width,this.borderColor,this.backgroudColor,required this.child,this.onTap
  }) : super(key: key);
  //double higth;
  final Function? onTap;
  double? width;
  Color? borderColor;
  Color? backgroudColor;
  Widget child;
  @override
  Widget build(BuildContext context) {
    if(onTap != null) {
      return GestureDetector(
        onTap: () {
          if(onTap != null){
            onTap!();
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: Size(
                  width!,
                  (width! * 0.5)
                      .toDouble()),
              //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(borderColor!),
            ),
            CustomPaint(
              size: Size(
                  width! - 20,
                  ((width! - 50) * 0.5)
                      .toDouble()),
              //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(backgroudColor!),
            ),
            child
          ],
        ),
      );
    }
    else
      return Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(
                width!,
                (width! * 0.5)
                    .toDouble()),
            //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(borderColor!),
          ),
          CustomPaint(
            size: Size(
                width! - 20,
                ((width! - 50) * 0.5)
                    .toDouble()),
            //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(backgroudColor!),
          ),
          child
        ],
      );
  }
}

class RPSCustomPainter extends CustomPainter {
  RPSCustomPainter(this.myColor);
  late Color myColor;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = myColor //Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0008333, size.height * 0.5000000);
    path0.quadraticBezierTo(size.width * 0.0406167, size.height * 0.3537167,
        size.width * 0.0566250, size.height * 0.3040833);
    path0.cubicTo(
        size.width * 0.0725500,
        size.height * 0.2457167,
        size.width * 0.0839917,
        size.height * 0.1664833,
        size.width * 0.1668083,
        size.height * 0.1666667);
    path0.quadraticBezierTo(size.width * 0.2501062, size.height * 0.1666667,
        size.width * 0.5000000, size.height * 0.1666667);
    path0.quadraticBezierTo(size.width * 0.7500312, size.height * 0.1667917,
        size.width * 0.8333750, size.height * 0.1668333);
    path0.cubicTo(
        size.width * 0.9156250,
        size.height * 0.1672000,
        size.width * 0.9297917,
        size.height * 0.2679500,
        size.width * 0.9422833,
        size.height * 0.3037333);
    path0.quadraticBezierTo(size.width * 0.9574917, size.height * 0.3492167,
        size.width, size.height * 0.5002000);
    path0.quadraticBezierTo(size.width * 0.9579417, size.height * 0.6702667,
        size.width * 0.9424333, size.height * 0.7224833);
    path0.cubicTo(
        size.width * 0.9246917,
        size.height * 0.7725667,
        size.width * 0.9159333,
        size.height * 0.8336667,
        size.width * 0.8335000,
        size.height * 0.8335000);
    path0.quadraticBezierTo(size.width * 0.7501250, size.height * 0.8335000,
        size.width * 0.5000000, size.height * 0.8335000);
    path0.quadraticBezierTo(size.width * 0.2501375, size.height * 0.8334250,
        size.width * 0.1668500, size.height * 0.8334000);
    path0.cubicTo(
        size.width * 0.0836083,
        size.height * 0.8324667,
        size.width * 0.0768500,
        size.height * 0.7794000,
        size.width * 0.0562000,
        size.height * 0.7211000);
    path0.quadraticBezierTo(size.width * 0.0439750, size.height * 0.6843333,
        size.width * 0.0008333, size.height * 0.5000000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}