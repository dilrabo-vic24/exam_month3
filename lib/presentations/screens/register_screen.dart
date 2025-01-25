import 'package:exam_month3_/common/utils/app_colors.dart';
import 'package:exam_month3_/common/utils/app_images.dart';
import 'package:exam_month3_/presentations/screens/home_screen.dart';
import 'package:exam_month3_/presentations/widgets/bold_text.dart';
import 'package:exam_month3_/presentations/widgets/custom_container.dart';
import 'package:exam_month3_/presentations/widgets/custom_text_field.dart';
import 'package:exam_month3_/presentations/widgets/normal_text.dart';
import 'package:exam_month3_/presentations/widgets/or_widget.dart';
import 'package:exam_month3_/presentations/widgets/password_text_form_field.dart';
import 'package:exam_month3_/providers/provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Consumer<FurnitureProvider>(
          builder: (context, furnitureProvider, child) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoldText(
                        text: "Create Account",
                        textColor: AppColors.blackColor,
                        fontsize: 32.sp),
                    NormalText(
                        text:
                            "Fill in your details below to get started on a seamless shopping experience.",
                        textColor: AppColors.grayColor,
                        fontsize: 16.sp),
                    SizedBox(height: 30.h),
                    CustomFormField(
                        hintText: "Enter your firstName",
                        labelText: "FirstName",
                        massage: "Please enter",
                        suffixIcon: Icons.person_2_outlined,
                        controller: firstName),
                    SizedBox(height: 10.h),
                    CustomFormField(
                        hintText: "Enter your LastName",
                        labelText: "LastName",
                        massage: "Please enter",
                        suffixIcon: Icons.person_2_outlined,
                        controller: lastName),
                    SizedBox(height: 10.h),
                    CustomFormField(
                        hintText: "Enter your phone",
                        labelText: "Phone Number",
                        massage: "Please enter",
                        suffixIcon: Icons.phone,
                        controller: phone),
                    SizedBox(height: 10.h),
                    PasswordTextFormField(
                        furnitureProvider: furnitureProvider,
                        passwordController: password),
                    SizedBox(height: 10.h),
                    NormalText(
                        text:
                            "By clicking Create Account, you acknowledge you have read and agreed to our Terms of Use and Privacy Policy",
                        textColor: Colors.grey,
                        fontsize: 16.sp),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: () async {
                        final result = await furnitureProvider.register(
                          phone.text.trim(),
                          password.text.trim(),
                        );
                        if (result) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        }
                      },
                      child: CustomContainer(
                          isLoading: furnitureProvider.isLoading,
                          text: "Create Account",
                          color: AppColors.mainColor,
                          textColor: AppColors.whiteColor,
                          height: 50,
                          width: 343,
                          fontSize: 16,
                          bordercolor: AppColors.mainColor),
                    ),
                    SizedBox(height: 20.h),
                    const OrWidget(),
                    SizedBox(height: 20.h),
                    InkWell(
                        onTap: () {},
                        child: const CustomContainer(
                            text: "Log In with Google",
                            color: AppColors.backgroundColor,
                            textColor: AppColors.mainColor,
                            height: 50,
                            width: 343,
                            fontSize: 16,
                            bordercolor: AppColors.mainColor,
                            imagePath: AppImages.google)),
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: () {},
                      child: const CustomContainer(
                        text: "Log In with Facebook",
                        color: AppColors.backgroundColor,
                        textColor: AppColors.mainColor,
                        height: 50,
                        width: 343,
                        fontSize: 16,
                        bordercolor: AppColors.mainColor,
                        imagePath: AppImages.facebook,
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
