import 'package:audio/Helpers/Constants/navigate.dart';
import 'package:audio/Views/Screens/home_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Helpers/Constants/colors.dart';

class CheckOutDone extends StatelessWidget {
  const CheckOutDone({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Lottie.asset(
                  'assets/images/Done.json',
                  width: 350,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      ' Check Out is Done Thank you ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: cMain),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            child: IconButton(
              onPressed: () {
                navigateToPR(const HomeView(), context);
              },
              icon: const Icon(
                Icons.home_filled,
                color: cMain,
              ),
            ),
          )
        ],
      ),
    );
  }
}
