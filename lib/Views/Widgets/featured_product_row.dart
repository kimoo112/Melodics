import 'package:flutter/material.dart';

import '../../Helpers/Constants/colors.dart';

class FeaturedProductsRow extends StatelessWidget {
  const FeaturedProductsRow({
    super.key,
    this.name = "Featured Products",
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "See All",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: cMain),
            ),
          ),
        ],
      ),
    );
  }
}
