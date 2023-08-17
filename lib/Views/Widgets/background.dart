import '../../Helpers/Constants/assets.dart';
import '../../Helpers/Constants/size.dart';
import 'package:flutter/material.dart';

class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:KWidth(context),
      height:KHeight(context),

        decoration: const BoxDecoration(
            image: DecorationImage(
      image: AssetImage(Assets.imagesBackgound),
      fit: BoxFit.cover,
    )));
  }
}
