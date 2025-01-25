import 'dart:developer';

import 'package:exam_month3_/data/models/furniture_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FurnitureCard extends StatelessWidget {
  final FurnitureData furnitureData;
  const FurnitureCard({
    super.key,
    required this.furnitureData,
  });

  @override
  Widget build(BuildContext context) {
    log("${(1 - furnitureData.discount! / 100) * furnitureData.price!}");
    final discountPrice =
        ((1 - furnitureData.discount! / 100) * furnitureData.price!).round();
    return Container(
      width: 160.w,
      // height: 210.h,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 255, 221, 221).withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  "https://e-commerce.birnima.uz${furnitureData.image![0]}",
                  height: 120.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 0, 0, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '${furnitureData.discount}% OFF',
                    style: TextStyle(
                        color: const Color(0xFFFFFFFF), fontSize: 12.sp),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  furnitureData.name.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                // SizedBox(height: 4),
                Text(
                  '\$${((1 - furnitureData.discount! / 100) * furnitureData.price!).toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),

                Text(
                  '\$${furnitureData.price}',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 61, 61, 61),
                    fontSize: 12.sp,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 19, 19),
                      size: 16.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '${furnitureData.rating} (${furnitureData.ratingCount})',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color.fromARGB(255, 141, 141, 141),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
