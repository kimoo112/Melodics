// ignore_for_file: unnecessary_import, file_names, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:audio/Helpers/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWi extends StatelessWidget {
  const TextFieldWi({
    Key? key,
    required this.errorName,
    required this.hintText,
    required this.icon,
    required this.icon2,
    required this.type,
    this.password = false, required this.controller,
  }) : super(key: key);
  final hintText;
  final icon;
  final Widget icon2;
  final errorName;
  final bool password;
  final TextInputType type;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: 
         TextFormField(
          controller:controller ,
          scrollPadding: EdgeInsets.all(55),
          cursorColor: cMain,
          autofocus: false,
          validator: (value) {
            if (value!.isEmpty) {
              return errorName;
            } else if (value.length < 6) {
              return "You should't add less than 6";
            } else {
              return null;
            }
          },
          style: TextStyle(color: cBlack),
          keyboardType: type,
          obscureText: password,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            disabledBorder: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: cMain.withOpacity(.7))),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            hintStyle: TextStyle(color: cBlack),
            fillColor: cWhite.withOpacity(.9),
            suffixIcon: icon2,
            filled: true,
            prefixIcon: Icon(
              icon,
              color: cMain,
            ),
          ),
        ),
    );
  }
}
