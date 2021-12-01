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

final TextEditingController _instagram = TextEditingController();
final TextEditingController _snapchat = TextEditingController();

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
  bool specifyImage = false;
  File _image = File("");
  final ImagePicker _picker = ImagePicker();
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
          Text(
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
          Container(
            child: optionalFields(optional_controllers),
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            child: Center(
              child: Text("Profile Picture",
                  style:
                      TextStyle(color: AppColors.primaryText, fontSize: f(24))),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(350))),
            height: h(300),
            width: w(400),
            child: specifyImage == false ? _choosePicture() : _displayPicture(),
          ),
          Container(
            width: w(303),
            margin: EdgeInsets.only(top: h(23)),
            child: TextButton(
              onPressed: () async {
                widget.newUser.instagram = _instagram.text;
                widget.newUser.snapchat = _snapchat.text;
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
                } else {}
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

  _imgFromGallery(ImagePicker _picker) async {
    XFile? fileName = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(fileName!.path);
      specifyImage = true;
    });
  }

  Widget _choosePicture() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(300))),
        height: h(300),
        width: w(400),
        child: TextButton(
          onPressed: () => {
            _imgFromGallery(_picker),
          },
          child: Text("Choose photo",
              style: TextStyle(
                fontSize: 14,
              )),
        ));
  }

  Widget _displayPicture() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: FileImage(_image), fit: BoxFit.fill),
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(300))),
      height: h(300),
      width: w(400),
    );
  }
}
