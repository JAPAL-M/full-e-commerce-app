import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../style/colors.dart';

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

void navigateto(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Widget defaultTextFormField(
        {required var controller,
        String? hint,
        required var type,
        IconData? perfixicon,
        IconButton? suffixicon,
        required var validator,
        dynamic color = Colors.grey,
        bool obscureText = false,
        onFieldSubmitted}) =>
    TextFormField(
      onChanged: onFieldSubmitted,
      obscureText: obscureText,
      validator: validator,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint,
        hintStyle: TextStyle(color: color),
        suffixIcon: suffixicon,
        prefixIcon: Icon(perfixicon),
      ),
    );

Widget defaultButton({
  required VoidCallback? onPressed,
  required String text,
}) =>
    Container(
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
        ),
        color: PrimaryColor,
        textColor: Colors.white,
      ),
      width: double.infinity,
      height: 50,
    );

void showToast({required String text, required var color, var textColor}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: color,
        textColor: textColor == null ? Colors.white : textColor,
        fontSize: 16.0);

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

void ShowMotionToastSuccess(context, String description) {
  MotionToast.success(
    title: Text(
      "Success",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    description: Text(description),
    animationType: AnimationType.fromLeft,
    position: MotionToastPosition.top,
    borderRadius: 10,
    width: 300,
    height: 65,
  ).show(context);
}

void ShowMotionToastError(context, String description) {
  MotionToast.error(
    title: Text(
      "Error",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    description: Text(description),
    animationType: AnimationType.fromLeft,
    position: MotionToastPosition.top,
    borderRadius: 10,
    width: 300,
    height: 65,
  ).show(context);
}

void ShowMotionToastWarning(context, String description) {
  MotionToast.warning(
    title: Text(
      "Warning",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    description: Text(description),
    animationType: AnimationType.fromLeft,
    position: MotionToastPosition.top,
    borderRadius: 10,
    width: 300,
    height: 65,
  ).show(context);
}

Widget myDivider() => Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    );

Widget CustomText(
        {required String text,
        double fontSize = 14,
        dynamic color = Colors.black,
        fontWeight = FontWeight.normal,
        allign = Alignment.topLeft}) =>
    Align(
      child: Text(text,
          style: TextStyle(
              fontSize: fontSize, fontWeight: fontWeight, color: color)),
      alignment: allign,
    );

// const packages:

//  flutter_bloc: ^8.1.1
// bloc: ^8.1.0
// dio: ^4.0.6
// conditional_builder_null_safety: ^0.0.6
// shared_preferences: ^2.0.15
// fluttertoast: ^8.1.2
// motion_toast: ^2.6.4
// icon_broken: ^1.1.0
