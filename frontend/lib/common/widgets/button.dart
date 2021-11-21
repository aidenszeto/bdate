import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';

Widget forwardRoundButton(double width, double height, context) {
  return Container(
    width: w(width),
    height: w(height),
    child: TextButton(
        onPressed: () {
          // _handlesign()
          Navigator.pushNamed(context, "/application");
        },
        style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryElement, shape: CircleBorder()),
        child: Icon(
          Icons.arrow_forward_rounded,
          size: 24,
          color: AppColors.primaryElementText,
        )),
  );
}
