import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:bdate/common/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  List<TextEditingController> required_controllers = [];
  List<TextEditingController> optional_controllers = [];
  PrimitiveWrapper _doesDrink = PrimitiveWrapper(false);
  PrimitiveWrapper _doesSmoke = PrimitiveWrapper(false);
  bool _specifyImage = false;
  File _chosenImage = File('');
  final NetworkImage _defaultImage = const NetworkImage(
      "https://180dc.org/wp-content/uploads/2018/05/empty.png");
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
                    _title(),
                    _buildInputForm(context),
                  ],
                ),
              ),
            )));
  }

  Widget _title() {
    return Container(
      margin: EdgeInsets.only(top: h(50)),
      child: Text(
        "Profile",
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

  Widget _buildInputForm(context) {
    final TextEditingController _email = TextEditingController();
    final TextEditingController _paswd = TextEditingController();
    final TextEditingController _name = TextEditingController();
    final TextEditingController _age = TextEditingController();
    final TextEditingController _ethnicity = TextEditingController();
    final TextEditingController _height = TextEditingController();
    final TextEditingController _year = TextEditingController();
    final TextEditingController _location = TextEditingController();
    final TextEditingController _major = TextEditingController();
    final TextEditingController _instagram = TextEditingController();
    final TextEditingController _snapchat = TextEditingController();
    required_controllers = [
      _email,
      _paswd,
      _name,
      _age,
      _ethnicity,
      _height,
      _year,
      _location,
      _major
    ];
    optional_controllers = [_instagram, _snapchat];

    return Container(
      width: w(303),
      margin: EdgeInsets.only(top: h(30)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: _specifyImage == false
                    ? DecorationImage(image: _defaultImage, fit: BoxFit.fill)
                    : DecorationImage(
                        image: FileImage(_chosenImage), fit: BoxFit.fill),
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(300))),
            height: h(300),
            width: w(400),
          ),
          TextButton(
            onPressed: () {
              _imgFromGallery(_picker);
            },
            child: Text(
              "Change Profile Picture",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: f(20),
                height: 1,
              ),
            ),
          ),
          requiredFields(required_controllers),
          optionalFields(optional_controllers),
          optionsWidget("Do you drink?", _doesDrink),
          optionsWidget("Do you smoke?", _doesSmoke),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
            child: TextButton(
              onPressed: () {
                // will send put request to update the profile
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)))),
              child: Text(
                "Update Profile",
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: f(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _imgFromGallery(ImagePicker _picker) async {
    XFile? fileName = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _specifyImage = true;
      _chosenImage = File(fileName!.path);
    });
  }
}
