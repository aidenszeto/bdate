import 'package:flutter/material.dart';
import 'package:bdate/common/values/values.dart';

class tStyle {
  static final buttonStyle = TextButton.styleFrom(
    backgroundColor: AppColors.primaryElement,
    shape: const RoundedRectangleBorder(
       borderRadius: BorderRadius.all(Radius.circular(20)),
     ),
  );
}