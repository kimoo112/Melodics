// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../Helpers/Constants/colors.dart';

class RegisterEmail extends ChangeNotifier {
  register(emailAddress, password, context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showTopSnackBar(
          snackBarPosition: SnackBarPosition.bottom,
          displayDuration: const Duration(milliseconds: 500),
          animationDuration: const Duration(milliseconds: 1000),
          Overlay.of(context),
          const CustomSnackBar.error(
            backgroundColor: cHappy,
            message: "The password is weak!",
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        showTopSnackBar(
          snackBarPosition: SnackBarPosition.bottom,
          displayDuration: const Duration(milliseconds: 500),
          animationDuration: const Duration(milliseconds: 1000),
          Overlay.of(context),
          const CustomSnackBar.error(
            backgroundColor: cHappy,
            message: "The account already exists for that email.",
          ),
        );
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
