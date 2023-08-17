import 'package:audio/Helpers/Constants/colors.dart';
import 'package:audio/Helpers/Constants/size.dart';
import 'package:audio/Views/Widgets/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widgets/cart_with_badge.dart';
import '../Widgets/details_tab_bar.dart';
import '../Widgets/feature_tab.dart';
import '../Widgets/overview_tab.dart';
import '../Widgets/review_tab.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
      {Key? key,
      required this.name,
      this.image,
      required this.price,
      required this.rate})
      : super(key: key);
  final String name;
  final dynamic image;
  final int price;
  final double rate;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SizedBox(
          width: KWidth(context),
          child: Padding(
            padding:
                EdgeInsets.only(left: 8.0, right: 8, bottom: 2, top: 30.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildAppbar(context),
                _productTitle(),
                SizedBox(height: 10.h),
                DetailsTabBar(tabController: tabController),
                Expanded(
                  child: TabBarView(controller: tabController, children: [
                    OverviewTab(widget: widget),
                    const FeatureTab(),
                    const ReviewsTab(),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _productTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "USD ${widget.price}",
            style: const TextStyle(
                color: cMain, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 10.h),
          Text(
            widget.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: 10.h),
          StarsRating(
            starsValue: widget.rate,
          )
        ],
      ),
    );
  }
}

Widget _buildAppbar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_outlined,
          color: cMain,
        ),
      ),
      const CartWIthBadge()
    ],
  );
}
