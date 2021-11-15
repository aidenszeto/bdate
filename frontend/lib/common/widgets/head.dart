import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';

Widget _buildHeadTitle() {
      return Container(
      margin: EdgeInsets.only(top: h(164)),
      child: Text(
        "Bdate",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: f(30),
          height: 1,
        ),
      ),
    );
}