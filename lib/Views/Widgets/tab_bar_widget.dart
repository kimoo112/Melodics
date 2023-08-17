import 'package:flutter/material.dart';

import '../../Helpers/Constants/colors.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        labelColor: cMain,
        dividerColor: cLightGrey,
        indicatorWeight: 1,
        indicatorColor: cMain,
        indicatorSize: TabBarIndicatorSize.label,
        splashBorderRadius: BorderRadius.circular(22),
        controller: _tabController,
        tabs: const [
          Tab(
            text: "Featured",
          ),
          Tab(text: "HeadBand"),
          Tab(text: "EarPads"),
        ]);
  }
}
