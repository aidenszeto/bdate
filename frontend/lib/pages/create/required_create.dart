import 'package:bdate/common/api/post_user.dart';
import 'package:bdate/pages/create/optional_create.dart';
import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:bdate/common/widgets/widgets.dart';
import 'package:bdate/common/entity/user.dart';

String gender = "Male";

class CreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreatePageState();
  }
}

class CreatePageState extends State<CreatePage> {
  PrimitiveWrapper _doesDrink = new PrimitiveWrapper(false);
  PrimitiveWrapper _doesSmoke = new PrimitiveWrapper(false);
  List<TextEditingController> required_controllers = [];

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
                    buildHeadTitle(),
                    _buildInputForm(context),
                    _buildSignIn(context),
                  ],
                ),
              ),
            )));
  }

  Widget _buildInputForm(context) {
    final TextEditingController _email = TextEditingController();
    final TextEditingController _paswd = TextEditingController();
    final TextEditingController _firstName = TextEditingController();
    final TextEditingController _lastName = TextEditingController();
    final TextEditingController _age = TextEditingController();
    final TextEditingController _ethnicity = TextEditingController();
    final TextEditingController _height = TextEditingController();
    final TextEditingController _year = TextEditingController();
    final TextEditingController _location = TextEditingController();
    final TextEditingController _major = TextEditingController();
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

    return Container(
      width: w(303),
      margin: EdgeInsets.only(top: h(50)),
      child: Column(
        children: [
          requiredFields(required_controllers),
          gendersWidget(),
          optionsWidget("Do you drink?", _doesDrink),
          optionsWidget("Do you smoke?", _doesSmoke),
          Container(
            width: w(303),
            margin: EdgeInsets.only(top: h(23)),
            child: TextButton(
              onPressed: () {
                CreateUser user = CreateUser(
                  firstName: _firstName.text,
                  lastName: _lastName.text,
                  email: _email.text,
                  password: _paswd.text,
                  age: int.parse(_age.text),
                  gender: gender,
                  ethnicity: _ethnicity.text,
                  height: _height.text,
                  year: _year.text,
                  location: _location.text,
                  major: _major.text,
                  smoke: _doesSmoke.value,
                  drink: _doesDrink.value,
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateOptionalPage(
                        newUser: user,
                      ),
                    ));
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
          ),
          Container(
            height: h(22),
            margin: EdgeInsets.only(top: h(20)),
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
}

class gendersWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new gendersWidgetState();
  }
}

class gendersWidgetState extends State<gendersWidget> {
  @override
  Widget build(BuildContext context) {
    var genders = ["Male", "Female", "Other"];
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
              "Gender",
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
            child: DropdownButton(
              value: gender,
              items: genders.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    gender = newValue;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
