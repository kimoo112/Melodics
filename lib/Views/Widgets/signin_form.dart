import 'package:audio/Helpers/Constants/colors.dart';
import 'package:flutter/material.dart';

import 'text_field.dart';
import 'package:flutter/cupertino.dart';

class SigninViewForm extends StatefulWidget {
  const SigninViewForm({
    super.key,
    required this.formKey,
    required this.passController,
    required this.emailController,
  });
  final TextEditingController passController;
  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;

  @override
  State<SigninViewForm> createState() => _SigninViewFormState();
}

class _SigninViewFormState extends State<SigninViewForm> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFieldWi(
              controller: widget.emailController,
              errorName: " you Should input You Email ",
              hintText: "Email",
              icon: CupertinoIcons.mail,
              icon2: const SizedBox(),
              type: TextInputType.emailAddress),
          TextFieldWi(
            errorName: " you Should input You password ",
            hintText: "Password",
            icon: CupertinoIcons.lock,
            icon2: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: isVisible
                  ? const Icon(
                      Icons.remove_red_eye_outlined,
                      color: cMain,
                    )
                  : const Icon(
                      Icons.visibility_off_outlined,
                      color: cMain,
                    ),
            ),
            password: isVisible,
            type: TextInputType.emailAddress,
            controller: widget.passController,
          ),
        ],
      ),
    );
  }
}
