import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shoes_shop/shared/style_ui.dart';

class PrimaryMiniButton extends StatelessWidget {
  final String image;
  final Function() ontap;
  final bool isActive;
  const PrimaryMiniButton({
    super.key,
    required this.image,
    required this.ontap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 36,
        height: 34,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive
                ? AppColors.primaryColor
                : AppColors.accentTextColor.withOpacity(.3),
            width: 2,
          ),
        ),
        child: Image.asset(
          'assets/$image',
        ),
      ),
    );
  }
}

class SizeProductButton extends StatelessWidget {
  final String size;
  const SizeProductButton({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 34,
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.accentTextColor.withOpacity(.3),
          width: 2,
        ),
      ),
      child: Text(
        size,
        style: AppTextStyles.bodyText,
      ),
    );
  }
}

class CTAButton extends StatelessWidget {
  final String titleButton;
  final bool isActive;
  const CTAButton({super.key, required this.titleButton, this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        padding: const EdgeInsets.all(0),
      ),
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: isActive ? AppColors.primaryColor : AppColors.transparent,
        ),
        child: Center(
          child: Text(
            titleButton,
            style: AppTextStyles.contentText.copyWith(
              color:
                  isActive ? AppColors.whiteColor : AppColors.secondayTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class ColorButton extends StatelessWidget {
  final Color color;
  final bool isActive;
  const ColorButton({super.key, required this.color, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isActive
              ? AppColors.primaryColor
              : AppColors.accentTextColor.withOpacity(.3),
          width: 2,
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: color,
        ),
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  final String image;
  final Function() ontap;
  final int cartItemCount;
  const CartButton({
    super.key,
    required this.image,
    required this.ontap,
    this.cartItemCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 36,
        height: 34,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.accentTextColor.withOpacity(.3),
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            cartItemCount != 0
                ? Transform.translate(
                    offset: const Offset(-17, -12),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          cartItemCount.toString(),
                          style: AppTextStyles.bodyText.copyWith(
                              color: AppColors.whiteColor, fontSize: 10),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            Image.asset(
              'assets/$image',
            ),
          ],
        ),
      ),
    );
  }
}
