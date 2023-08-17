import 'package:flutter/material.dart';

import '../../Helpers/Constants/colors.dart';
import '../../Helpers/Constants/size.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({super.key, required this.name, this.onTap});
  final String name;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onTap ??() {},
          splashColor: cBlack,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: KWidth(context),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cMain.withOpacity(.8),
            ),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: .5,
                        color: cWhite,
                        fontSize: 20),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: cWhite,
                  )
                ],
              ),
            )),
          ),
        ));
  }
}
