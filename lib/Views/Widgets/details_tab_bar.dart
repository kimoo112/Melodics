import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Helpers/Constants/colors.dart';

class DetailsTabBar extends StatelessWidget {
  const DetailsTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TabBar(
        labelColor: cBlack,
        dividerColor: cWhite,
        splashBorderRadius: BorderRadius.circular(25.r),
        labelStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
        indicatorWeight: 1,
        indicatorColor: cMain,
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: const [Text("Overview"), Text("Features"), Text("Reviews")],
      ),
    );
  }
}
