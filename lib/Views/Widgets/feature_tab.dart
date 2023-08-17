import 'package:audio/Model/featured_product_model.dart';
import 'package:audio/Providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Helpers/Constants/assets.dart';
import '../../Helpers/Constants/colors.dart';
import '../../Helpers/Constants/size.dart';

class FeatureTab extends StatelessWidget {
  const FeatureTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Highly Detailed Audio",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. ",
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. ",
              style: TextStyle(
                  color: cMain, fontWeight: FontWeight.w500, fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(Assets.imagesHeadPhone1Details3),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "APTX HD WIRELESS AUDIO",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        "The Aptx® HD codec transmits 24-bit hi-res audio,\n equal to or better than CD\n quality.",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(Assets.imagesHeadPhone1Details4),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ULTRA SOFT \nWITH ALCANTARA",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        "Alcantara® is a highly innovative material offering an unrivalled combination of",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        maxLines: 3,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 10.h),
            Consumer<TheCart>(
              builder: (BuildContext context, addToCart, Widget? child) {
                return InkWell(
                  borderRadius: BorderRadius.circular(20.r),
                  splashColor: cBlack,
                  onTap: () {
                    
  addToCart.addToCart(featuredList[1]);
                  },
                  child: Container(
                    height: 50,
                    width: KWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.r),
                      color: cMain.withOpacity(.8),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                          fontSize: 22,
                          color: cWhite,
                          letterSpacing: .5,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
