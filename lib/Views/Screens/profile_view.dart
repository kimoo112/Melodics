import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Helpers/Constants/colors.dart';
import '../../Helpers/Constants/navigate.dart';
import '../../Providers/google_signin_.dart';
import 'Login/signin_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile ',
          style: TextStyle(letterSpacing: .6, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(55.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 63,
                  backgroundColor: cMain,
                  child: Hero(
                    tag: 'profile',
                    child: CircleAvatar(
                        radius: 60,
                        backgroundImage: Image.network(
                                '${FirebaseAuth.instance.currentUser?.photoURL}')
                            .image),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '${FirebaseAuth.instance.currentUser?.displayName}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${FirebaseAuth.instance.currentUser?.email}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: cMain,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: cGrey,
            thickness: 1.3,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'General',
                  style: TextStyle(
                      color: cGrey,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Edit Profile',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Notifications',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Wishlist',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.h),
                const Divider(
                  color: cGrey,
                  thickness: 1.3,
                ),
                SizedBox(height: 15.h),
                Text(
                  'Legal',
                  style: TextStyle(
                      color: cGrey,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Terms of Use',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Privacy Policy',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.h),
                const Divider(
                  color: cGrey,
                  thickness: 1.3,
                ),
                SizedBox(height: 15.h),
                Text(
                  'Personal',
                  style: TextStyle(
                      color: cGrey,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Report a Bug',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<GoogleSignin>(
              builder: (BuildContext context, signin, Widget? child) {
                return TextButton(
                  onPressed: () {
                    signin.logout();
                  navigateToPR(const SigninView(), context);

                  },
                  child: Text(
                    'Logout',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
