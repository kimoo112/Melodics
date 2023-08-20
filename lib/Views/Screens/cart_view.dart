import '../../Helpers/Constants/colors.dart';
import '../../Helpers/Constants/navigate.dart';
import '../../Helpers/Constants/size.dart';
import '../../Providers/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../Widgets/carted_product.dart';
import '../Widgets/custom_button_without_form.dart';
import 'Checkout/check_out.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  bool isEmpty = true;
  GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(fontWeight: FontWeight.bold, color: cBlack),
        ),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: cMain),
        ),
        actions: [
          Consumer<TheCart>(
            builder: (BuildContext context, removeAll, Widget? child) {
              isEmpty = removeAll.cartProducts.isEmpty;

              return isEmpty
                  ? const SizedBox()
                  : IconButton(
                      onPressed: () {
                        removeAll.deleteAllFromCart();
                        showTopSnackBar(
                          displayDuration: const Duration(milliseconds: 500),
                          animationDuration: const Duration(milliseconds: 1000),
                          Overlay.of(context),
                          CustomSnackBar.info(
                            backgroundColor: cSoSad,
                            icon: Icon(
                                Icons.sentiment_very_dissatisfied_rounded,
                                color: cLightGrey.withOpacity(.3),
                                size: 120),
                            message: "All Products Are Removed from the Cart",
                          ),
                        );
                      },
                      icon: const Icon(CupertinoIcons.trash_slash_fill,
                          color: cMain),
                    );
            },
          ),
        ],
      ),
      body: Consumer<TheCart>(
        builder: (BuildContext context, addtocart, Widget? child) {
          isEmpty = addtocart.cartProducts.isEmpty;
          return isEmpty
              ? isEmptyWidget()
              : Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: KHeight(context) * .86,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: addtocart.cartProducts.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CartedPruductsWidget(
                                  name: addtocart.cartProducts[index].name,
                                  price: addtocart.cartProducts[index].price,
                                  image: addtocart.cartProducts[index].image,
                                  index: index);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Positioned(
                        bottom: 65,
                        right: 0.h,
                        left: 0.h,
                        child: totalAndPrice()),
                    Positioned(
                      bottom: 2.h,
                      right: 0.h,
                      left: 0.h,
                      child: CustomButton2(
                        name: 'Proceed to Checkout',
                        onTap: () {
                          navigateToP(const CheckOutView(), context);
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  } 
  //*Todo: make a app icon and App name 
  Consumer<TheCart> totalAndPrice() {
    return Consumer<TheCart>(
      builder: (BuildContext context, itemsAndPrice, Widget? child) {
        return Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  const Text(
                    'Total Items',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  Text(
                    ' ${itemsAndPrice.cartProducts.length} ',
                    style: const TextStyle(
                        color: cMain,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'USD ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  Text(
                    '${itemsAndPrice.priceOfProducts}',
                    style: const TextStyle(
                        color: cMain,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget isEmptyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/images/Empty.json'),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "your cart ".toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 18.sp,
                  color: cMain,
                ),
              ),
              Text(
                "is empty".toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 18.sp,
                  color: cBlack,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
