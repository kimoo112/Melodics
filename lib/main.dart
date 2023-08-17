import 'package:audio/Providers/cart.dart';
import 'package:audio/Providers/google_signin_.dart';
import 'package:audio/Providers/register.dart';
import 'package:audio/auth_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Helpers/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (BuildContext context) {
                  return TheCart();
                },
              ),
              ChangeNotifierProvider(
                create: (BuildContext context) {
                  return GoogleSignin();
                },
              ),
              ChangeNotifierProvider(
                create: (BuildContext context) {
                  return RegisterEmail();
                },
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Audio',
              theme: ThemeData(
                scaffoldBackgroundColor: cWhite,
                appBarTheme: const AppBarTheme(backgroundColor: cWhite),
                colorScheme: ColorScheme.fromSeed(seedColor: cMain),
                useMaterial3: true,
                fontFamily: "DMSans",
                textTheme: Theme.of(context).textTheme.apply(
                      fontFamily: 'DMSans',
                      bodyColor: cBlack,
                    ),
              ),
              home: const AuthCheck(),
            ),
          );
        });
  }
}
