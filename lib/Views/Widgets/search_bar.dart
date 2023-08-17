import 'package:audio/Helpers/Constants/navigate.dart';

import '../../Helpers/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/search_view.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    this.onTap,
    this.onChanged,
  }) : super(key: key);
  final void Function()? onTap;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextField(
        onTap: onTap ??
            () {
              navigateToPSearch(const SearchView(), context);
            },
        onChanged: onChanged ?? (value) {},
        style: const TextStyle(color: cBlack),
        cursorColor: cMain,
        decoration: InputDecoration(
          prefixIcon:
              // Lottie.asset('assets/images/94375-search-new.json',width: 5),
              const Icon(
            CupertinoIcons.search,
            color: cMain,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: cMain, width: 1.5),
            borderRadius: BorderRadius.circular(20),
          ),
          suffixIcon:
              Icon(CupertinoIcons.mic_fill, color: cBlack.withOpacity(.7)),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: "Search",
          hintStyle: const TextStyle(color: Colors.black),
          filled: true,
          fillColor: cWhite,
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, color: cMain),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
