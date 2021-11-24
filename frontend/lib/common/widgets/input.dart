import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class PrimitiveWrapper {
  var value;
  PrimitiveWrapper(this.value);
}

Widget InputTextEdit(
    {required TextEditingController controller,
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

Widget requiredFields(List<TextEditingController> controllers) {
  return Container(
      width: w(303),
      margin: EdgeInsets.only(top: h(50)),
      child: Column(children: [
        InputTextEdit(
          controller: controllers[0],
          keyboardType: TextInputType.name,
          hintText: "Your Name",
          marginTop: 0,
        ),
        InputTextEdit(
          controller: controllers[1],
          keyboardType: TextInputType.emailAddress,
          hintText: "Your Email",
        ),
        InputTextEdit(
            controller: controllers[2],
            keyboardType: TextInputType.visiblePassword,
            hintText: "Password",
            isPassword: true),
        InputTextEdit(
          controller: controllers[3],
          keyboardType: TextInputType.number,
          hintText: "Age",
        ),
        InputTextEdit(
          controller: controllers[4],
          keyboardType: TextInputType.name,
          hintText: "Ethnicity",
        ),
        InputTextEdit(
          controller: controllers[5],
          keyboardType: TextInputType.name,
          hintText: "Height",
        ),
        InputTextEdit(
          controller: controllers[6],
          keyboardType: TextInputType.number,
          hintText: "Graduation Year",
        ),
        InputTextEdit(
          controller: controllers[7],
          keyboardType: TextInputType.name,
          hintText: "Location",
        ),
        InputTextEdit(
          controller: controllers[8],
          keyboardType: TextInputType.name,
          hintText: "Major",
        ),
      ]));
}

Widget optionalFields(List<TextEditingController> controllers) {
  return Container(
      width: w(303),
      child: Column(children: [
        InputTextEdit(
          controller: controllers[0],
          keyboardType: TextInputType.name,
          hintText: "Instagram Account",
        ),
        InputTextEdit(
          controller: controllers[1],
          keyboardType: TextInputType.name,
          hintText: "Snapchat Account",
        ),
      ]));
}

Widget optionsWidget(String inputText, PrimitiveWrapper option) {
  return Container(
    height: h(60),
    margin: EdgeInsets.only(top: h(10)),
    decoration: BoxDecoration(
      color: AppColors.secondaryElement,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 9),
          child: Text(
            inputText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
              fontSize: f(18),
              height: 1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: RoundCheckBox(
            onTap: (selected) {
              option.value = selected;
            },
          ),
        ),
      ],
    ),
  );
}
