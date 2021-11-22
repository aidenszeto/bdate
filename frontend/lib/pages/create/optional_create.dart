import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:bdate/common/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import 'dart:io';

class CreateOptionalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CreateOptionalPageState();
  }
}

class CreateOptionalPageState extends State<CreateOptionalPage> {
  bool specifyImage = false;
  File _image = File("");
  final ImagePicker _picker = ImagePicker();

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
    final TextEditingController _instagram = TextEditingController();
    final TextEditingController _snapchat = TextEditingController();

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
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: InputTextEdit(
              controller: _instagram,
              keyboardType: TextInputType.name,
              hintText: "Instagram Account",
            ),
          ),
          InputTextEdit(
            controller: _snapchat,
            keyboardType: TextInputType.name,
            hintText: "Snapchat Account",
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
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
            child: Row(
              children: <Widget>[
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: f(32),
                  ),
                ),
                Spacer(),
                forwardRoundButton(45, 45, context, '/application'),
              ],
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
          onPressed: () {},
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
