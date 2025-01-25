import 'package:exam_month3_/common/utils/app_colors.dart';
import 'package:exam_month3_/providers/provide.dart';
import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final TextEditingController passwordController;
  final FurnitureProvider furnitureProvider;
  const PasswordTextFormField({
    super.key,
    required this.passwordController,
    required this.furnitureProvider,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: furnitureProvider.isVisible,
      decoration: InputDecoration(
        fillColor: AppColors.whiteColor,
        filled: true,
        prefixIcon: const Icon(Icons.lock),
        labelText: 'Password',
        border: const OutlineInputBorder(),
        hintText: 'Enter your password',
        suffixIcon: IconButton(
          icon: Icon(
            furnitureProvider.isVisible
                ? Icons.visibility
                : Icons.visibility_off,
          ),
          onPressed: () {
            furnitureProvider.toggleVisibility();
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }
        return null;
      },
    );
  }
}
