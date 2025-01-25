import 'package:exam_month3_/common/utils/app_colors.dart';
import 'package:exam_month3_/common/utils/app_images.dart';
import 'package:exam_month3_/presentations/screens/onboarding1.dart';
import 'package:exam_month3_/presentations/screens/onboarding3.dart';
import 'package:exam_month3_/presentations/widgets/bold_text.dart';
import 'package:exam_month3_/presentations/widgets/custom_container.dart';
import 'package:exam_month3_/presentations/widgets/normal_text.dart';
import 'package:flutter/material.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              width: double.infinity,
              AppImages.image2,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  BoldText(
                    text: "Delivery Right to Your Doorstep",
                    textColor: AppColors.blackColor,
                    fontsize: 32,
                  ),
                  NormalText(
                    text:
                        "Sit back, and enjoy the convenience of our drivers delivering your order to your doorstep",
                    textColor: AppColors.grayColor,
                    fontsize: 18,
                  ),
                  // Spacer(),
                  SizedBox(
                    height: 100,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Onboarding1(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        CustomContainer(
                          color: AppColors.backgroundColor,
                          fontSize: 16,
                          height: 50,
                          text: "Back",
                          textColor: AppColors.mainColor,
                          width: 90,
                          bordercolor: AppColors.whiteColor,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Onboarding3(),
                              ),
                            );
                          },
                          child: CustomContainer(
                            color: AppColors.mainColor,
                            fontSize: 16,
                            height: 50,
                            text: "Next",
                            textColor: AppColors.whiteColor,
                            width: 223,
                            bordercolor: AppColors.mainColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
