import 'package:flutter/material.dart';

// Widget XText(
//   String text,
//   double size, weight,
//   FontWeight fontWeight,
//   {Color color = const Color(0xff1b1b1b)}
// ){
//   return Text(
//     text,
//     style: TextStyle(
//       fontSize: size,
//       fontFamily: "Poppins",
//       // fontWeight: fontWeight,
//       color: color,
//     ),
//   );
// }

class XText extends StatelessWidget {
  final double size;
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final bool isLight;
  final bool isCenter;

  const XText(
      {super.key,
      this.text = "text",
      this.size = 12,
      this.fontWeight = FontWeight.w500,
      this.isLight = false,
      this.isCenter = false,
      this.color = const Color(0xff1b1b1b),
      
      });

  @override
  Widget build(BuildContext context) {
    Color lightColor = Color(0xff1b1b1b).withOpacity(0.6);
    return Text(
      text,
      textAlign: isCenter ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontSize: size,
        fontFamily: "Poppins",
        fontWeight: fontWeight,
        
        color: isLight ? lightColor : color,
      ),
    );
  }
}
