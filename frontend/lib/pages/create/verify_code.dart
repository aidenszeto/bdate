import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:bdate/common/widgets/widgets.dart';
import 'package:bdate/pages/app.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bdate/common/api/post_user.dart';
import 'package:bdate/common/entity/user.dart';

import 'dart:io';

class VerifyCodePage extends StatefulWidget {
  VerifyCodePage(
      {Key? key, @required required this.email, @required required this.code})
      : super(key: key);
  String email = "";
  int code = -1;

  @override
  State<StatefulWidget> createState() {
    return VerifyCodePageState();
  }
}

class VerifyCodePageState extends State<VerifyCodePage> {
  bool isValid = true;
  final TextEditingController _code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildHeadTitle(),
            verificationCode(),
            ContinueButton(),
            isValid ? Container() : _errorText(),
          ],
        ),
      ),
    ));
  }

  Widget ContinueButton() {
    return Container(
      width: w(303),
      margin: EdgeInsets.only(top: h(23)),
      child: TextButton(
        onPressed: () async {
          if (int.tryParse(_code.text) != null) {
            int verifyCode = int.parse(_code.text);
            if (verifyCode == widget.code) {
              VerifyUser verifyUser = VerifyUser(
                  email: widget.email, verificationNumber: verifyCode);
              var res = await PostUser.verify(verifyUser);
              if (res != null) {
                User curUser = res;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppPage(
                        curUser: curUser,
                      ),
                    ));
              } else {}
            } else {
              setState(() {
                isValid = false;
              });
            }
          } else {
            setState(() {
              isValid = false;
            });
          }
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)))),
        child: Text(
          "Continue",
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: f(25),
          ),
        ),
      ),
    );
  }

  Widget verificationCode() {
    return Container(
      height: h(60),
      width: w(300),
      margin: EdgeInsets.only(top: h(150)),
      decoration: BoxDecoration(
        color: AppColors.secondaryElement,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: _code,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Enter 6-digit verification code",
          contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
          border: InputBorder.none,
        ),
        validator: (input) {},
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Avenir",
          fontWeight: FontWeight.w500,
          fontSize: f(18),
        ),
        maxLines: 1,
        autocorrect: false,
      ),
    );
  }
}

Widget _errorText() {
  return const Center(
      child: Text(
    "Invalid verification code",
    style: TextStyle(color: Colors.red),
  ));
}
