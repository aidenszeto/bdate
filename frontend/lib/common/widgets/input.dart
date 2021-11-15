import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';

Widget InputTextEdit({
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  required String hintText,
  bool isPassword = false,
  double marginTop = 15}) {
    return Container(
    height: h(60),
    margin: EdgeInsets.only(top: h(marginTop)),
    decoration: BoxDecoration(
      color: AppColors.secondaryElement,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: AppColors.primaryText,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w500,
        fontSize: f(18),
      ),
      maxLines: 1,
      autocorrect: false, 
      obscureText: isPassword,
    ),
  );

}