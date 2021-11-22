import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:bdate/common/widgets/widgets.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class CreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreatePageState();
  }
}

class CreatePageState extends State<CreatePage> {
  bool specifyImage = false;

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
    final TextEditingController _name = TextEditingController();
    final TextEditingController _age = TextEditingController();
    final TextEditingController _ethnicity = TextEditingController();
    final TextEditingController _height = TextEditingController();
    final TextEditingController _year = TextEditingController();
    final TextEditingController _location = TextEditingController();
    final TextEditingController _major = TextEditingController();

    return Container(
      width: w(303),
      margin: EdgeInsets.only(top: h(50)),
      child: Column(
        children: [
          InputTextEdit(
            controller: _name,
            keyboardType: TextInputType.name,
            hintText: "Your Name",
            marginTop: 0,
          ),
          InputTextEdit(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            hintText: "Your Email",
          ),
          InputTextEdit(
              controller: _paswd,
              keyboardType: TextInputType.visiblePassword,
              hintText: "Password",
              isPassword: true),
          InputTextEdit(
            controller: _age,
            keyboardType: TextInputType.number,
            hintText: "Age",
          ),
          InputTextEdit(
            controller: _ethnicity,
            keyboardType: TextInputType.name,
            hintText: "Ethnicity",
          ),
          InputTextEdit(
            controller: _height,
            keyboardType: TextInputType.name,
            hintText: "Height",
          ),
          InputTextEdit(
            controller: _year,
            keyboardType: TextInputType.number,
            hintText: "Graduation Year",
          ),
          InputTextEdit(
            controller: _location,
            keyboardType: TextInputType.name,
            hintText: "Location",
          ),
          InputTextEdit(
            controller: _major,
            keyboardType: TextInputType.name,
            hintText: "Major",
          ),
          _optionsWidget("Do you drink?"),
          _optionsWidget("Do you smoke?"),
          Container(
            width: w(303),
            margin: EdgeInsets.only(top: h(23)),
            child: Row(
              children: <Widget>[
                Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: f(32),
                  ),
                ),
                Spacer(),
                forwardRoundButton(45, 45, context, "/optional_create"),
              ],
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

Widget _optionsWidget(String inputText) {
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
            onTap: (selected) {},
          ),
        ),
      ],
    ),
  );
}
