import 'package:audio/Helpers/Constants/colors.dart';
import 'package:audio/Helpers/Constants/size.dart';
import 'package:audio/Providers/cart.dart';
import 'package:audio/Views/Widgets/checkout_container.dart';
import 'package:audio/Views/Widgets/checkout_textfield.dart';
import 'package:audio/Views/Widgets/custom_button_without_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Helpers/Constants/navigate.dart';
import 'checkout_done.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  /// Build a list of what the user is buying
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode validate = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Checkout',
            style: TextStyle(fontSize: 25),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: Stack(
          children: [
            Consumer<TheCart>(
                builder: (BuildContext context, cart, Widget? child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: KHeight(context) * .5,
                      child: ListView.builder(
                        itemCount: cart.cartProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CheckoutContainer(
                              image: cart.cartProducts[index].image,
                              name: cart.cartProducts[index].name,
                              price: cart.cartProducts[index].price);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    checkOutForm(cart, context),
                  ],
                ),
              );
            }),
          ],
        ));
  }


  Form checkOutForm(TheCart cart, BuildContext context) {
    return Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CheckoutTextField(
                          controller: _nameController,
                          labelText: 'Name',
                          autovalidateMode: validate,
                        ),
                        CheckoutTextField(
                          controller: _emailController,
                          labelText: 'Email',
                          autovalidateMode: validate,
                        ),
                        CheckoutTextField(
                          controller: _addressController,
                          labelText: 'Address',
                          autovalidateMode: validate,
                        ),
                        CheckoutTextField(
                          controller: _cityController,
                          labelText: 'City',
                          autovalidateMode: validate,
                        ),
                        CheckoutTextField(
                          controller: _stateController,
                          labelText: 'State',
                          autovalidateMode: validate,
                        ),
                        CheckoutTextField(
                          controller: _zipCodeController,
                          labelText: 'Zip Code',
                          autovalidateMode: validate,
                        ),
                        CheckoutTextField(
                          controller: _phoneController,
                          labelText: 'Phone',
                          autovalidateMode: validate,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total Price With Dlivery',
                                style: TextStyle(fontWeight: FontWeight.w600
                                  ,fontSize: 16,),
                              ),
                              Text(
                                '\$ ${cart.priceOfProducts+20}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: cMain,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        CustomButton2(
                          name: 'Confirm Checkout',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              navigateToPR(
                                  CheckOutDone(
                                    name: _nameController.text.toUpperCase(),
                                  ),
                                  context);
                              cart.deleteAllFromCart();
                            } else {
                              validate = AutovalidateMode.always;
                              setState(() {});
                            }
                          },
                        )
                      ],
                    ),
                  );
  }
}
