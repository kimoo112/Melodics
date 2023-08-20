import '../../Helpers/Constants/assets.dart';
import 'featured_product_row.dart';
import 'product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Helpers/Constants/colors.dart';
import '../Screens/details_view.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({
    super.key,
    required this.widget,
  });

  final DetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.all(7),
                    width: 284,
                    height: 391,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: cLightGrey,
                    ),
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.fitWidth,
                    )),
                Image.asset(Assets.imagesHeadPhone1Details1),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const FeaturedProductsRow(
            name: 'Another Products',
          ),
          const ProductListView()
        ],
      ),
    );
  }
}
