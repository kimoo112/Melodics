import '../../../Helpers/Constants/colors.dart';
import '../../../Helpers/Constants/navigate.dart';
import '../../../Helpers/Constants/size.dart';
import '../../Widgets/background.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/logo.dart';
import '../../Widgets/signin_form.dart';
import '../home_view.dart';
import 'signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final formKey = GlobalKey<FormState>();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const BackGroundWidget(),
        SizedBox(
          width: KWidth(context),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                const Logo(),
                SizedBox(height: 10.h),
                const Text(
                  "It's modular and designed to last",
                  style: TextStyle(color: cWhite),
                ),
                SizedBox(height: 200.h),
                SigninViewForm(
                  formKey: formKey,
                  emailController: emailController,
                  passController:passController,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot your password",
                          style: TextStyle(color: cWhite),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomButton(
                  formKey: formKey,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      navigateToPR(const HomeView(), context);
                    }
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Didn’t have any account?',
                        style: TextStyle(
                          color: cWhite,
                        )),
                    TextButton(
                      onPressed: () {
                        navigateToPR(const SignupView(), context);
                      },
                      child: const Text('Sign Up Here!',
                          style: TextStyle(
                            color: cMain,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
