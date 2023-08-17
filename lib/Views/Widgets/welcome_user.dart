import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Helpers/Constants/colors.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
          children: [
            const TextSpan(
              text: "Hi , ",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DMSans',
                  color: cMain),
            ),
            TextSpan(
              text: '${FirebaseAuth.instance.currentUser?.displayName}',
              style: const TextStyle(
                color: cMain,
                letterSpacing: .2,
                fontWeight: FontWeight.bold,
                fontFamily: 'DMSans',
                fontSize: 20,
              ),
            ),
          ],
        )),
        const SizedBox(
          height: 10,
        ),
        Text(
          "What are you looking for today?",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
