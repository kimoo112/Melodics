// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../Helpers/Constants/colors.dart';
import '../../Providers/cart.dart';

class AddToCartIcon extends StatelessWidget {
  const AddToCartIcon({
    Key? key,
    required this.index,
    required this.list,
    this.size = 25,
  }) : super(key: key);

  final dynamic index;
  final List list;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Consumer<TheCart>(
      builder: (BuildContext context, addToCart, Widget? child) {
        return IconButton(
          onPressed: () {
            addToCart.addToCart(list[index]);
            showTopSnackBar(
              snackBarPosition: SnackBarPosition.bottom,
              displayDuration: const Duration(milliseconds: 500),
              animationDuration: const Duration(milliseconds: 1000),
              Overlay.of(context),
              const CustomSnackBar.success(
                backgroundColor: cHappy,
                message:
                    "Item added to cart. You're one step closer to checkout!",
              ),
            );
          },
          icon: Icon(CupertinoIcons.cart_badge_plus, size: size),
        );
      },
    );
  }
}
