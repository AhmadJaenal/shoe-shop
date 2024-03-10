import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/screens/detailPage/detail_product.dart';
import 'package:shoes_shop/shared/style_ui.dart';
import 'package:shoes_shop/widgets/custom_button.dart';

class CardProduct extends StatelessWidget {
  final String titleProduct;
  final String image;
  final String price;
  const CardProduct({
    super.key,
    required this.titleProduct,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            DetailPage(image: image, productName: titleProduct, price: price));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/$image",
              fit: BoxFit.cover,
            ),
            const Spacer(),
            Text(
              titleProduct,
              style: AppTextStyles.headerText,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$$price",
                  style: AppTextStyles.headerText,
                ),
                PrimaryMiniButton(image: "icon_arrow.png", ontap: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
