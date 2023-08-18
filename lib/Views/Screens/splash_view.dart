import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:audio/Helpers/Constants/colors.dart';
import 'package:audio/Views/Screens/home_view.dart';
import 'package:audio/Views/Screens/signin_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.white,
        childWidget: SizedBox(
          height: 200.sp,
          width: 250.sp,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Lottie.asset('assets/images/Splash.json', width: 400),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Melo',
                    style: TextStyle(
                      color: cBlack,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 25.sp,
                    ),
                  ),
                  Text(
                    'dics',
                    style: TextStyle(
                      color: cMain,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 25.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        defaultNextScreen: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomeView();
            } else {
              return const SigninView();
            }
          },
        ));
  }
}
