import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:bdate/common/widgets/widgets.dart';

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

    return Container(
      width: w(303),
      margin: EdgeInsets.only(top: h(50)),
      child: Column(
        children: [
          requiredFields(required_controllers),
          optionsWidget("Do you drink?", _doesDrink),
          optionsWidget("Do you smoke?", _doesSmoke),
          InputTextEdit(
            controller: _instagram,
            keyboardType: TextInputType.name,
            hintText: "Instagram Account",
          ),
          InputTextEdit(
            controller: _snapchat,
            keyboardType: TextInputType.name,
            hintText: "Snapchat Account",
          ),
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
