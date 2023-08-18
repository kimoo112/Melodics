import '../../Helpers/Constants/assets.dart';
import '../../Helpers/Constants/colors.dart';
import 'logo.dart';
import 'package:flutter/material.dart';

class LogoWithPicture extends StatelessWidget {
  const LogoWithPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.iconsLogo,width: 40,),
        const Padding(
          padding: EdgeInsets.only(left:8.0),
          child: Logo(
            color: cBlack,
            fontsize: 19.05,
          ),
        )
      ],
    );
  }
}
