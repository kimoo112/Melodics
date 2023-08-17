import 'package:audio/Helpers/Constants/colors.dart';
import 'package:audio/Providers/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CartedPruductsWidget extends StatelessWidget {
  const CartedPruductsWidget(
      {super.key,
      required this.name,
      required this.price,
      required this.image,
      required this.index});
  final String name;
  final int price;
  final dynamic image;
  final dynamic index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(image),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "USD $price",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: cMain),
                    ),
                  ],
                ),
                Consumer<TheCart>(
                  builder:
                      (BuildContext context, deleteFromCart, Widget? child) {
                    return IconButton(
                      onPressed: () {
                        deleteFromCart
                            .deleteFromCart(deleteFromCart.cartProducts[index]);
                        showTopSnackBar(
                          displayDuration: const Duration(milliseconds: 500),
                          animationDuration: const Duration(milliseconds: 1000),
                          Overlay.of(context),
                          const CustomSnackBar.info(
                            backgroundColor: cSad,
                            message:
                                "Product successfully removed. Thanks for shopping with us!",
                          ),
                        );
                      },
                      icon: const Icon(CupertinoIcons.trash_fill, color: cMain),
                    );
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
