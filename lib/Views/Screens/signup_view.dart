import 'package:audio/Providers/google_signin_.dart';
import 'package:audio/Providers/register.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../Helpers/Constants/colors.dart';
import '../../Helpers/Constants/navigate.dart';
import '../../Helpers/Constants/size.dart';
import 'home_view.dart';
import 'signin_view.dart';
import '../Widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Helpers/Constants/assets.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/logo.dart';
import '../Widgets/signin_form.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
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
                SizedBox(height: 150.h),
                SigninViewForm(
                  formKey: formKey,
                  emailController: emailController,
                  passController: passController,
                ),
                const SizedBox(height: 10),
                Consumer<RegisterEmail>(
                  builder: (BuildContext context, register, Widget? child) {
                    return CustomButton(
                      formKey: formKey,
                      name: 'Sign Up',
                      onTap: () {
                        register.register(emailController.toString().trim(),
                            passController.toString().trim(), context);
                        if (formKey.currentState!.validate()) {
                          navigateToPR(const HomeView(), context);
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 15.h),
                const ThePlatformContainers(),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Didn’t have any account?',
                        style: TextStyle(
                          color: cWhite,
                        )),
                    TextButton(
                      onPressed: () {
                        navigateToPR(const SigninView(), context);
                      },
                      child: const Text('Sign In Here!',
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

class PlatformContainer extends StatelessWidget {
  const PlatformContainer({super.key, required this.image, this.onTap});
  final dynamic image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        width: 65,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: cWhite),
        alignment: Alignment.center,
        child: Image.asset(image),
      ),
    );
  }
}

class ThePlatformContainers extends StatelessWidget {
  const ThePlatformContainers({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<GoogleSignin>(
          builder: (BuildContext context, signinWithGoogle, Widget? child) {
            return PlatformContainer(
              image: Assets.iconsApple,
              onTap: () {
                signinWithGoogle.signInWithGoogle().then((googleSignInAccount) {
                  if (googleSignInAccount.credential == null
                      ) {
                    showTopSnackBar(
                      snackBarPosition: SnackBarPosition.bottom,
                      displayDuration: const Duration(milliseconds: 500),
                      animationDuration: const Duration(milliseconds: 1000),
                      Overlay.of(context),
                      const CustomSnackBar.error(
                        backgroundColor: cSad,
                        message:
                            "You should choose an account to continue to the App",
                      ),
                    );
                  } else {
                    navigateToPR(const HomeView(), context);
                  }
                });
              },
            );
          },
        ),
        SizedBox(width: 30.w),
        const PlatformContainer(
          image: Assets.iconsFacebook,
        ),
        SizedBox(width: 30.w),
        Consumer<GoogleSignin>(
          builder: (BuildContext context, signinWithGoogle, Widget? child) {
            return PlatformContainer(
              image: Assets.iconsGoogle,
              onTap: () {
                signinWithGoogle.signInWithGoogle().whenComplete(
                    () => navigateToPR(const HomeView(), context));
              },
            );
          },
        ),
      ],
    );
  }
}
