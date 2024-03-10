import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/screens/detailPage/detail_product.dart';
import 'package:shoes_shop/shared/style_ui.dart';
import 'package:gap/gap.dart';
import 'package:shoes_shop/widgets/card_product.dart';
import 'package:shoes_shop/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<String>> product = [
      ["Air Max 200 SE", "20.99", "shoe5.png"],
      ["Air Max 97", "20.99", "shoe1.png"],
      ["React Presto", "25.99", "shoe2.png"],
      ["Nike Invincible 3", "20.99", "shoe3.png"],
      ["Air Max 97", "20.99", "shoe4.png"],
    ];
    List<String> category = ["All", "Running", "Sneakers", "Formal", "Casual"];
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(62),
          child: Container(
            margin: const EdgeInsets.only(top: 26),
            padding:
                const EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
            child: Row(
              children: [
                PrimaryMiniButton(
                  image: 'icon_menu.png',
                  ontap: () {},
                ),
                const Gap(15),
                Image.asset('assets/icon_nike.png'),
                const Spacer(),
                PrimaryMiniButton(
                  image: 'icon_cart.png',
                  ontap: () {},
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppMargin.defaultMargin),
                  child: Container(
                    width: width,
                    margin: const EdgeInsets.only(top: 32),
                    padding: const EdgeInsets.fromLTRB(26, 31, 26, 10),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: AppTextStyles.customStyle.copyWith(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '20% ',
                                    style: AppTextStyles.customStyle.copyWith(
                                      fontSize: 30,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Discount\n',
                                    style: AppTextStyles.customStyle.copyWith(
                                      fontSize: 20,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'on your first purchase',
                                    style: AppTextStyles.bodyText.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Gap(16),
                            const CTAButton(
                              titleButton: "Shop Now",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(190, 20),
                  child: Image.asset(
                    "assets/shoe7.png",
                    width: 200,
                  ),
                )
              ],
            ),
            const Gap(20),
            SizedBox(
              width: double.infinity,
              height: 32,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.normal,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? AppMargin.defaultMargin : 0,
                        right: index == category.length - 1
                            ? AppMargin.defaultMargin
                            : 0),
                    child: CTAButton(
                      titleButton: category[index],
                      isActive: index == 0 ? true : false,
                    ),
                  );
                },
              ),
            ),
            const Gap(30),
            SizedBox(
              height: height * .5,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppMargin.defaultMargin),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: product.length,
                  padding: const EdgeInsets.all(0),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 26,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 237,
                  ),
                  itemBuilder: (context, index) {
                    return CardProduct(
                      titleProduct: product[index][0],
                      price: product[index][1],
                      image: product[index][2],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
