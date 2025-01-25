import 'dart:ui';

import 'package:exam_month3_/presentations/widgets/bold_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final String? imagePath;
  final Color color, textColor, bordercolor;
  final double height, width, fontSize;
  final bool isLoading;

  const CustomContainer({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.height,
    required this.width,
    required this.fontSize,
    required this.bordercolor,
    this.imagePath,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: bordercolor),
        ),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      imagePath != null ? Image.asset(imagePath!) : SizedBox(),
                      SizedBox(width: 4.w),
                      BoldText(
                          text: text, textColor: textColor, fontsize: fontSize),
                    ],
                  )));
  }
}
