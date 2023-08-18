import 'package:audio/Helpers/Constants/navigate.dart';
import 'package:audio/Helpers/Constants/size.dart';
import 'package:audio/Views/Screens/cart_view.dart';
import 'package:audio/Views/Screens/profile_view.dart';
import 'package:audio/Views/Screens/search_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Helpers/Constants/colors.dart';
import '../../Providers/google_signin_.dart';
import '../Screens/signin_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: KWidth(context) * .5,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(55),
              bottomRight: Radius.circular(55),
            ),
            color: cWhite),
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 65,
              backgroundColor: cMain,
              child: CircleAvatar(
                  radius: 60,
                  backgroundImage: Image.network(
                          '${FirebaseAuth.instance.currentUser?.photoURL}')
                      .image),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${FirebaseAuth.instance.currentUser?.email}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${FirebaseAuth.instance.currentUser?.displayName}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: cMain,
                fontSize: 10.sp,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Hero(
              tag: 'profile',
              child: customListTile(Icons.person_2, 'Profile', true, () {
                navigateToP(const ProfileView(), context);
              }),
            ),
            const SizedBox(
              height: 40,
            ),
            customListTile(
                Icons.shopping_cart_checkout_outlined, 'The Cart', true, () {
              navigateToP(const CartView(), context);
            }),
            const SizedBox(
              height: 40,
            ),
            customListTile(Icons.shopping_cart_checkout_outlined,
                'Search for Products', true, () {
              navigateToP(const SearchView(), context);
            }),
            const Spacer(),
            Consumer<GoogleSignin>(
              builder: (BuildContext context, signin, Widget? child) {
                return customListTile(Icons.logout, 'Logout', false, () {
                  signin.logout();
                  navigateToPR(const SigninView(), context);
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget customListTile(
      IconData icon, String title, bool isTraining, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        child: ListTile(
            leading: Icon(
              icon,
              color: cMain,
              size: 30,
            ),
            title: Text(
              title,
              style:  TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
            ),
            trailing: isTraining
                ? const Icon(Icons.double_arrow_rounded, color: cMain)
                : const SizedBox(
                    height: 0.0,
                  )),
      ),
    );
  }
}
