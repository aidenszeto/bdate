import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:bdate/common/widgets/widgets.dart';
import 'package:bdate/pages/app.dart';
import 'package:bdate/pages/create/verify_code.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bdate/common/api/post_user.dart';
import 'package:bdate/common/entity/user.dart';

import 'dart:io';

class CreateOptionalPage extends StatefulWidget {
  CreateOptionalPage({Key? key, @required required this.newUser})
      : super(key: key);
  CreateUser newUser = CreateUser(
    firstName: "",
    lastName: "",
    email: "",
    password: "",
    age: 0,
    gender: "",
    ethnicity: "",
    height: "",
    year: "",
    location: "",
    major: "",
    photo: "",
    smoke: false,
    drink: false,
  );

  @override
  State<StatefulWidget> createState() {
    return CreateOptionalPageState();
  }
}

class CreateOptionalPageState extends State<CreateOptionalPage> {
  final TextEditingController _instagram = TextEditingController();
  final TextEditingController _snapchat = TextEditingController();
  final TextEditingController _imageURL = TextEditingController();
  bool specifyImage = false;
  bool errorText = false;
  bool isPosted = false;
  List<TextEditingController> optional_controllers = [];

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            color: Colors.white,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildInputForm(context),
                    errorText ? _errorText() : Container(),
                    _buildSignIn(context),
                  ],
                ),
              ),
            )));
  }

  Widget _buildInputForm(context) {
    optional_controllers = [_instagram, _snapchat];

    return Container(
      width: w(303),
      margin: EdgeInsets.only(top: h(50)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Text(
              "Optional",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                fontSize: f(30),
                height: 1,
              ),
            ),
          ),
          Container(
            child: optionalFields(optional_controllers),
          ),
          Container(
            height: h(60),
            margin: EdgeInsets.only(top: h(15)),
            decoration: BoxDecoration(
              color: AppColors.secondaryElement,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextFormField(
              controller: _imageURL,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Profile Picture URL",
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
            ),
          ),
          Container(
            width: w(303),
            margin: EdgeInsets.only(top: h(23)),
            child: TextButton(
              onPressed: () async {
                widget.newUser.instagram = _instagram.text;
                widget.newUser.snapchat = _snapchat.text;
                widget.newUser.photo = _imageURL.text;
                var res = await PostUser.createAccount(widget.newUser);
                if (res != null) {
                  User curUser = res;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VerifyCodePage(
                              code: res.verificationNumber,
                              email: res.email,
                            )),
                  );
                  setState(() {
                    isPosted = true;
                  });
                } else if (isPosted == false) {
                  setState(() {
                    errorText = true;
                  });
                }
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)))),
              child: Text(
                "Create Account",
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: f(25),
                ),
              ),
            ),
          ),
          Container(
            height: h(22),
            margin: EdgeInsets.only(top: h(5)),
          ),
        ],
      ),
    );
  }

  Widget _buildSignIn(context) {
    return Container(
        margin: EdgeInsets.only(bottom: h(38)),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/login");
          },
          child: Text(
            "Sign in",
            style: TextStyle(color: AppColors.primaryText, fontSize: f(18)),
          ),
        ));
  }

  Widget _errorText() {
    return const Center(
        child: Text(
      "Invalid email format",
      style: TextStyle(color: Colors.red),
    ));
  }
}
