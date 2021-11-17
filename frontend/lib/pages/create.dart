import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:bdate/common/widgets/widgets.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

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
                  _buildInputForm(),
                  _buildSignIn(context),
                ],
              ),
            )));
  }
}

Widget _buildInputForm() {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _paswd = TextEditingController();
  final TextEditingController _name = TextEditingController();
  return Container(
    width: w(303),
    margin: EdgeInsets.only(top: h(125)),
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
        Container(
          width: w(280),
          margin: EdgeInsets.only(top: h(23)),
          child: Row(
            children: <Widget>[
              Text(
                "Create Account",
                style: TextStyle(
                  fontSize: f(28),
                ),
              ),
              Spacer(),
              forwardRoundButton(45, 45),
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
      margin: EdgeInsets.only(bottom: h(58)),
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
