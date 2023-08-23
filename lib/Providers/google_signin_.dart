import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../Helpers/Constants/colors.dart';
import '../Helpers/Constants/navigate.dart';
import '../Views/Screens/home_view.dart';

class GoogleSignin extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  Future signInWithGoogle(context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return showTopSnackBar(
        snackBarPosition: SnackBarPosition.top,
        displayDuration: const Duration(milliseconds: 500),
        animationDuration: const Duration(milliseconds: 1000),
        Overlay.of(context),
         CustomSnackBar.error(
          backgroundColor: cBlack,
          icon: Icon(Icons.error_outline, color: cGrey.withOpacity(.3), size: 120),
          message: "Please select a Google account to proceed."
        ),
      );
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    notifyListeners();
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    return navigateToPR(const HomeView(), context);
  }

  logout() async {
    googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
