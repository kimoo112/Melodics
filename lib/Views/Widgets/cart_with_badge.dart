import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Helpers/Constants/colors.dart';
import '../../Helpers/Constants/navigate.dart';
import '../../Providers/cart.dart';
import 'package:badges/badges.dart' as badges;

import '../Screens/cart_view.dart';

class CartWIthBadge extends StatelessWidget {
  const CartWIthBadge({
    super.key,
    this.icColor = cMain,
  });
  final Color icColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          navigateToP(const CartView(), context);
        },
        child: badges.Badge(
          badgeAnimation: const badges.BadgeAnimation.scale(
            animationDuration: Duration(seconds: 1),
            colorChangeAnimationDuration: Duration(microseconds: 100),
            loopAnimation: true,
            curve: Curves.elasticInOut,
            colorChangeAnimationCurve: Curves.bounceIn,
          ),
          badgeContent: Consumer<TheCart>(
            builder: (BuildContext context, countOfProducts, Widget? child) {
              return Text('${countOfProducts.cartProducts.length}');
            },
          ),
          child: Icon(CupertinoIcons.cart, color: icColor ),
        ),
      ),
    );
  }
}
