import 'package:exam_month3_/common/utils/app_colors.dart';
import 'package:exam_month3_/common/utils/app_images.dart';
import 'package:exam_month3_/presentations/screens/login_screen.dart';
import 'package:exam_month3_/presentations/screens/onboarding2.dart';
import 'package:exam_month3_/presentations/widgets/bold_text.dart';
import 'package:exam_month3_/presentations/widgets/custom_container.dart';
import 'package:exam_month3_/presentations/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding3 extends StatefulWidget {
  const Onboarding3({super.key});

  @override
  State<Onboarding3> createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              width: double.infinity,
              AppImages.image3,
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
                        "it back, and enjoy the convenience of our drivers delivering your order to your doorstep",
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
                          builder: (context) => Onboarding2(),
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
                          onTap: () async {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setBool("isFirstTimer", false);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
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
