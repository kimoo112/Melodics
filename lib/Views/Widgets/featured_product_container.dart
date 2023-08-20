import '../../Helpers/Constants/navigate.dart';
import '../../Model/featured_product_model.dart';
import '../Screens/details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Helpers/Constants/assets.dart';
import '../../Helpers/Constants/colors.dart';
import 'add_to_cart_icon.dart';

class FeaturedProductContainer extends StatelessWidget {
  const FeaturedProductContainer(
      {super.key,
      this.name = "TMA-2 HD Wireless",
      this.price = 350,
      this.image = Assets.imagesFeaturedHeadPhone1,
      required this.index,
      required this.rate});
  final String name;
  final int price;
  final dynamic image;
  final double rate;
  final dynamic index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              navigateToP(
                  DetailsScreen(
                    price: price,
                    name: name,
                    image: image,
                    rate: rate,
                  ),
                  context);
            },
            child: Container(
                height: 213.h,
                width: 155.w,
                decoration: BoxDecoration(
                  color: cWhite,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0.sp),
                          child: Image.asset(image),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                " USD $price",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: cMain,
                                    letterSpacing: .5),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      child: AddToCartIcon(
                        index: index,
                        list: featuredList,
                      ),
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
