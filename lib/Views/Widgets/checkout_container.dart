import 'package:audio/Helpers/Constants/colors.dart';
import 'package:flutter/material.dart';

class CheckoutContainer extends StatelessWidget {
  const CheckoutContainer(
      {super.key,
      required this.image,
      required this.name,
      required this.price});
  final dynamic image;
  final String name;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22), color: cLightGrey),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(image,width: 120,),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '\$ $price',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color: cMain),
            )
          ],
        ),
      ),
    );
  }
}
