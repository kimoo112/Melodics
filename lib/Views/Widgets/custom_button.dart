import 'package:flutter/material.dart';

import '../../Helpers/Constants/colors.dart';
import '../../Helpers/Constants/size.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.formKey,
    this.name = "Sign In",
    this.onTap,
  });

  final GlobalKey<FormState> formKey;
  final String name;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onTap,
          splashColor: cBlack,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: KWidth(context),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cMain,
            ),
            child: Center(
                child: Text(
              name,
              style: const TextStyle(color: cWhite, fontSize: 20),
            )),
          ),
        ));
  }
}
