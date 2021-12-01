import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:bdate/common/widgets/widgets.dart';
import 'package:bdate/common/entity/user.dart';
import 'package:bdate/common/api/update_user.dart';
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
    verificationNumber: -1,
  );

  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  List<TextEditingController> required_controllers = [];
  List<TextEditingController> optional_controllers = [];
  bool _doesDrink = false;
  bool _doesSmoke = false;
  bool _specifyImage = false;
  File _chosenImage = File('');
  final NetworkImage _defaultImage = const NetworkImage(
      "https://180dc.org/wp-content/uploads/2018/05/empty.png");
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _doesDrink = widget.curUser.drink;
    _doesSmoke = widget.curUser.smoke;
  }

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
    final formGlobalKey = GlobalKey<FormState>();
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
          TextButton(child: Icon(Icons.logout, color:Colors.amber), onPressed: () {Navigator.pushNamed(context, "/welcome");},),
          Form(
              key: formGlobalKey,
              child: Column(children: [
                requiredFields(required_controllers),
                optionalFields(optional_controllers),
              ])),
          Container(
            height: h(60),
            margin: EdgeInsets.only(top: h(15)),
            decoration: BoxDecoration(
              color: AppColors.secondaryElement,
              borderRadius: BorderRadius.circular(20),
            ),
            child: CheckboxListTile(
              value: _doesSmoke,
              title: Text(
                "Smoking",
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w500,
                  fontSize: f(18),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _doesSmoke = value!;
                });
              },
            ),
          ),
          Container(
            height: h(60),
            margin: EdgeInsets.only(top: h(15)),
            decoration: BoxDecoration(
              color: AppColors.secondaryElement,
              borderRadius: BorderRadius.circular(20),
            ),
            child: CheckboxListTile(
              value: _doesDrink,
              title: Text(
                "Drinking",
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w500,
                  fontSize: f(18),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _doesDrink = value!;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
            child: TextButton(
              onPressed: () async {
                if (formGlobalKey.currentState != null &&
                    formGlobalKey.currentState!.validate()) {
                  formGlobalKey.currentState!.save();
                  UpdateUser user = UpdateUser(
                    firstName: _firstName.text,
                    lastName: _lastName.text,
                    email: _email.text,
                    password: _paswd.text,
                    age: int.parse(_age.text),
                    ethnicity: _ethnicity.text,
                    height: _height.text,
                    year: _year.text,
                    location: _location.text,
                    major: _major.text,
                    smoke: _doesSmoke,
                    drink: _doesDrink,
                    instagram: _instagram.text,
                    snapchat: _snapchat.text,
                  );
                  var res =
                      await ReviseUser.updateUser(widget.curUser.id, user);
                  if (res != null) {
                    setState(() {
                      widget.curUser = res;
                    });
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog(context, true),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog(context, false),
                    );
                  }
                }
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

Widget _buildPopupDialog(BuildContext context, bool isSuccess) {
  return AlertDialog(
    title: Center(
        child: Text(
      isSuccess ? 'Profile Saved' : 'Profile Not Saved',
      style: TextStyle(fontSize: 25),
    )),
    /*
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Hello"),
      ],
    ),
    */
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}
