import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/shared/style_ui.dart';
import 'package:shoes_shop/widgets/custom_button.dart';

class DetailPage extends StatefulWidget {
  final String productName;
  final String price;
  final String image;
  const DetailPage({
    super.key,
    required this.image,
    required this.productName,
    required this.price,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isShoeInBox = false;
  bool onDrag = false;
  int cartItemCount = 0;

  @override
  Widget build(BuildContext context) {
    Image shoe = Image.asset("assets/shoe9.png");
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(62),
          child: Container(
            margin: const EdgeInsets.only(top: 26),
            padding:
                const EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryMiniButton(
                    image: 'icon_back.png',
                    ontap: () {
                      Get.back();
                    }),
                Text(widget.productName, style: AppTextStyles.heading),
                CartButton(
                  image: 'icon_cart.png',
                  ontap: () {},
                  cartItemCount: cartItemCount,
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
          child: Stack(
            children: [
              Center(
                child: Transform.translate(
                  offset: const Offset(0, -110),
                  child: Image.asset(
                    "assets/nike.png",
                    width: 120,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            Gap(height * .1),
                            Text(
                              "Size",
                              style: AppTextStyles.bodyText,
                            ),
                            const SizeProductButton(size: "UK 6"),
                            const SizeProductButton(size: "UK 7"),
                            const SizeProductButton(size: "UK 8"),
                            const SizeProductButton(size: "UK 9"),
                            const Gap(100),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Draggable<Image>(
                          data: shoe,
                          feedback: Image.asset(
                            "assets/${widget.image}",
                            width: width * .6,
                          ),
                          childWhenDragging: Transform.translate(
                            offset: const Offset(-10, 430),
                            child: Center(
                              child: FadeInUp(
                                from: 100,
                                curve: Curves.easeInBack,
                                duration: const Duration(milliseconds: 300),
                                child: ZoomIn(
                                  from: 1,
                                  curve: Curves.easeIn,
                                  duration: const Duration(milliseconds: 400),
                                  child:
                                      Image.asset("assets/box.png", width: 270),
                                ),
                              ),
                            ),
                          ),
                          child: Image.asset(
                            "assets/${widget.image}",
                            width: width * .6,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Gap(height * .1),
                            PrimaryMiniButton(
                              image: "icon_boormark.png",
                              ontap: () {},
                              isActive: true,
                            ),
                            const Gap(96),
                            Text(
                              "Color",
                              style: AppTextStyles.bodyText,
                            ),
                            const ColorButton(
                                color: AppColors.redColor, isActive: true),
                            const ColorButton(color: AppColors.blueColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      style: AppTextStyles.customStyle.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\$',
                          style: AppTextStyles.customStyle.copyWith(
                            fontSize: 18,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: widget.price,
                          style: AppTextStyles.customStyle.copyWith(
                            fontSize: 24,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "10% OFF",
                    style: AppTextStyles.customStyle.copyWith(
                      color: AppColors.redColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(6),
                  ZoomIn(
                    from: 1,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 200),
                    child: Center(
                      child: isShoeInBox
                          ? Column(
                              children: [
                                Text(
                                  "Click to clear the box",
                                  style: AppTextStyles.customStyle.copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              "Swipe down to add",
                              style: AppTextStyles.customStyle.copyWith(
                                color: AppColors.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                  const Gap(8),
                  Stack(
                    children: [
                      DragTarget<Widget>(
                        onAcceptWithDetails: (details) {
                          setState(() {
                            isShoeInBox = true;
                          });
                        },
                        builder: (context, candidateData, rejectedData) {
                          return Center(
                            child: isShoeInBox
                                ? GestureDetector(
                                    onDoubleTap: () {
                                      setState(() {
                                        cartItemCount++;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: Image.asset(
                                          "assets/shoe_in_box.png",
                                          width: 280),
                                    ),
                                  )
                                : const SizedBox(width: 280, height: 280),
                          );
                        },
                      ),
                      isShoeInBox
                          ? ZoomIn(
                              from: 1,
                              curve: Curves.easeInOut,
                              duration: const Duration(milliseconds: 200),
                              child: Stack(
                                children: [
                                  Text(
                                    "Double click the box to add\nto cart",
                                    style: AppTextStyles.customStyle.copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 40),
                                    child: Image.asset(
                                        "assets/information_line.png",
                                        width: 40),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                      Center(
                        child: isShoeInBox
                            ? ZoomIn(
                                from: 1,
                                curve: Curves.easeInOut,
                                duration: const Duration(milliseconds: 200),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isShoeInBox = false;
                                    });
                                  },
                                  child: Container(
                                    width: 42,
                                    height: 42,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.redColor,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: AppColors.whiteColor,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              )
                            : Draggable<Image>(
                                data: shoe,
                                feedback: Image.asset(
                                  "assets/icon_swipe.png",
                                  width: 34,
                                ),
                                axis: Axis.vertical,
                                childWhenDragging: Transform.translate(
                                  offset: const Offset(-10, 30),
                                  child: Center(
                                    child: FadeInUp(
                                      from: 100,
                                      curve: Curves.easeInBack,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: ZoomIn(
                                        from: 1,
                                        curve: Curves.easeIn,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        child: Image.asset("assets/box.png",
                                            width: 270),
                                      ),
                                    ),
                                  ),
                                ),
                                child: ZoomIn(
                                  from: 1,
                                  curve: Curves.easeInOut,
                                  duration: const Duration(milliseconds: 200),
                                  child: Image.asset(
                                    "assets/icon_swipe.png",
                                    width: 34,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
