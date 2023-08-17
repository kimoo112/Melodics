import 'package:flutter/material.dart';

import '../../Helpers/Constants/colors.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, this.color = cWhite,  this.fontsize=33}) : super(key: key);
  final Color color;
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Text(
      'Melodics',
      style: TextStyle(
          letterSpacing: 1.5,
          color: color,
          fontSize: fontsize,
          fontWeight: FontWeight.w700),
    );
  }
}
