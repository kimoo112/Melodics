import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Helpers/Constants/size.dart';
import '../../Model/featured_product_model.dart';
import 'featured_product_container.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: KWidth(context),
      height: 240.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: featuredList.length,
        itemBuilder: (BuildContext context, int index) {
          return FeaturedProductContainer(
            name: featuredList[index].name,
            price: featuredList[index].price,
            image: featuredList[index].image, index: index, rate: featuredList[index].rate,
          );
        },
      ),
    );
  }
}
