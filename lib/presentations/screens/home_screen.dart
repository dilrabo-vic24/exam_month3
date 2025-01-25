import 'dart:developer';

import 'package:exam_month3_/common/utils/app_colors.dart';
import 'package:exam_month3_/presentations/widgets/banner_widget.dart';
import 'package:exam_month3_/presentations/widgets/bold_text.dart';
import 'package:exam_month3_/presentations/widgets/furniture_card.dart';
import 'package:exam_month3_/presentations/widgets/normal_text.dart';
import 'package:exam_month3_/providers/provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  int? _currentIndex;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async {
        await Provider.of<FurnitureProvider>(context, listen: false)
            .fetchFurnitureList();
        await Provider.of<FurnitureProvider>(context, listen: false)
            .fetchBanner();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Consumer<FurnitureProvider>(
        builder: (context, furnitureProvider, child) {
          if (furnitureProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: AppColors.whiteColor,
                      filled: true,
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search candles',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.camera_alt_outlined),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 230,
                  child: PageView.builder(
                    itemCount: furnitureProvider.productBannerData.length,
                    itemBuilder: (context, index) {
                      log("nimadir");
                      return BannerWidget(
                          productBanner:
                              furnitureProvider.productBannerData[index]);
                    },
                    onPageChanged: (value) {
                      setState(() {
                        _currentIndex = value;
                      });
                    },
                    controller: pageController,
                  ),
                ),
                if (_currentIndex != 3)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SmoothPageIndicator(
                      axisDirection: Axis.horizontal,
                      effect: const JumpingDotEffect(
                          activeDotColor: AppColors.mainColor,
                          dotHeight: 10,
                          dotWidth: 10),
                      controller: pageController,
                      count: 3,
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoldText(
                          text: "Special Offers",
                          textColor: AppColors.blackColor,
                          fontsize: 24.sp),
                      NormalText(
                          text: "See More",
                          textColor: AppColors.mainColor,
                          fontsize: 14.sp),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: furnitureProvider.furnitureList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: FurnitureCard(
                          furnitureData: furnitureProvider.furnitureList[index],
                        ),
                      );
                    },
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                //   child: Row(
                //     children: [
                //       BoldText(
                //           text: "Shop by Categories",
                //           textColor: AppColors.blackColor,
                //           fontsize: 28.sp),
                //       const SizedBox.shrink()
                //     ],
                //   ),
                // )
              ],
            ),
          );
        },
      )),
    );
  }
}
