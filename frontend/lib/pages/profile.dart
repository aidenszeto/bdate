import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:bdate/common/widgets/widgets.dart';
import 'package:bdate/common/entity/user.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

class profilePage extends StatefulWidget {
  profilePage({Key? key, @required required this.curUser}) : super(key: key);
  User curUser = User(
    id: "",
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
    smoke: false,
    drink: false,
    photo: "",
    instagram: "",
    snapchat: "",
    likedBy: [],
    dislikedBy: [],
    matches: [],
    v: 0,
    verified: false,
  );

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
    _email.text = widget.curUser.email;
    final TextEditingController _paswd = TextEditingController();
    _paswd.text = widget.curUser.password;
    final TextEditingController _firstName = TextEditingController();
    _firstName.text = widget.curUser.firstName;
    final TextEditingController _lastName = TextEditingController();
    _lastName.text = widget.curUser.lastName;
    final TextEditingController _age = TextEditingController();
    _age.text = widget.curUser.age.toString();
    final TextEditingController _ethnicity = TextEditingController();
    _ethnicity.text = widget.curUser.ethnicity;
    final TextEditingController _height = TextEditingController();
    _height.text = widget.curUser.height;
    final TextEditingController _year = TextEditingController();
    _year.text = widget.curUser.year;
    final TextEditingController _location = TextEditingController();
    _location.text = widget.curUser.location;
    final TextEditingController _major = TextEditingController();
    _major.text = widget.curUser.major;
    final TextEditingController _instagram = TextEditingController();
    _instagram.text =
        (widget.curUser.instagram != null) ? widget.curUser.instagram! : "";
    final TextEditingController _snapchat = TextEditingController();
    _snapchat.text =
        (widget.curUser.snapchat != null) ? widget.curUser.snapchat! : "";
    required_controllers = [
      _firstName,
      _lastName,
      _email,
      _paswd,
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
      _chosenImage =
          File(fileName!.path); // this is absolute path on user's simulator
    });
  }
}
