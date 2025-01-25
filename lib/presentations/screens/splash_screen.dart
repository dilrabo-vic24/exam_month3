import 'package:exam_month3_/common/utils/app_colors.dart';
import 'package:exam_month3_/common/utils/app_images.dart';
import 'package:exam_month3_/presentations/screens/home_screen.dart';
import 'package:exam_month3_/presentations/screens/onboarding1.dart';
import 'package:exam_month3_/presentations/widgets/bold_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTimer = prefs.getBool("isFirstTimer") ?? true;

    if (isFirstTimer) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Onboarding1()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.home),
            BoldText(
              text: "HomeHaven",
              fontsize: 36,
              textColor: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
