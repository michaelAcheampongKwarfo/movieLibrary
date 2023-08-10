import 'package:flutter/material.dart';
import 'package:movie_library/widgets/app_colors.dart';

class AppText extends StatelessWidget {
  final String data;
  final double fontsize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  const AppText(
      {super.key,
      required this.data,
      required this.fontsize,
      this.fontWeight,
      this.color,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: fontsize,
        color: color ?? whiteColor,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontFamily: 'Times New Roman',
      ),
      textAlign: TextAlign.justify,
    );
  }
}
