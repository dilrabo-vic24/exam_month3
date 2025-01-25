import 'package:exam_month3_/common/utils/app_colors.dart';
import 'package:exam_month3_/data/models/product_banner_model.dart';
import 'package:exam_month3_/presentations/widgets/bold_text.dart';
import 'package:exam_month3_/presentations/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerWidget extends StatelessWidget {
  final ProductBannerData productBanner;
  const BannerWidget({
    super.key,
    required this.productBanner,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://e-commerce.birnima.uz${productBanner.image!}"),

          fit: BoxFit
              .cover, // Rasmni konteynerga to'g'ri kelish usulini belgilaydi
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment(0.00, 0.00),
            end: Alignment(0.4, 0.5),
            colors: [Color(0xEF156650), Color(0xAA156650), Color(0x00156650)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SizedBox(
                width: 180.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoldText(
                        text: productBanner.title!,
                        textColor: AppColors.whiteColor,
                        fontsize: 20.sp),
                    NormalText(
                        text: productBanner.shortDescription!,
                        textColor: AppColors.whiteColor,
                        fontsize: 18.sp),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.whiteColor),
                          onPressed: () {},
                          child: BoldText(
                              text: "Shop Now",
                              textColor: AppColors.mainColor,
                              fontsize: 18.sp)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
