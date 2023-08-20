import '../Widgets/cart_with_badge.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../Helpers/Constants/colors.dart';
import '../../Helpers/Constants/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Providers/google_signin_.dart';
import '../Widgets/custom_drawer.dart';
import '../Widgets/featured_product_row.dart';
import '../Widgets/logo_with_picture.dart';
import '../Widgets/product_container.dart';
import '../Widgets/product_list_view.dart';
import '../Widgets/search_bar.dart';
import '../Widgets/tab_bar_widget.dart';
import '../Widgets/welcome_user.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          drawer: const CustomDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: 8.0, right: 8, bottom: 2, top: 30.sp),
                  child: buildAppBar(
                    context,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WelcomeUser(),
                      SizedBox(height: 20.h),
                      const Hero(tag: 'null', child: CustomSearchBar()),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: KHeight(context),
                      width: KWidth(context),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(22),
                            topRight: Radius.circular(22)),
                        color: cLightGrey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child:
                                  TabBarWidget(tabController: _tabController),
                            ),
                            const SizedBox(height: 10),
                            const ProductContainer(),
                            const FeaturedProductsRow(),
                            const ProductListView()
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

Widget buildAppBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Consumer<GoogleSignin>(
        builder: (BuildContext context, signin, Widget? child) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(CupertinoIcons.list_bullet_indent, color: cMain));
        },
      ),
      const LogoWithPicture(),
      const CartWIthBadge(
        icColor: cBlack,
      )
    ],
  );
}
