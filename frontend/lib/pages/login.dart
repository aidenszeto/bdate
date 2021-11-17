import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:bdate/common/widgets/widgets.dart';

final TextEditingController _email = TextEditingController();
final TextEditingController _paswd = TextEditingController();

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            // _buildLogo(),
            buildHeadTitle(),
            _buildInputForm(),
            Spacer(),
            _buildSignUp(context),
          ],
        ),
      ),
    );
  }
}

// _handleSignUp() {
//   Navigator.pushNamed(context, "/signup");
// }

// _handleSignIn() {
//   if (!checkEmail(_email.value.text)) {
//     toastInfo(msg: 'Please enter the correct email');
//     return;
//   }
//   if (!checkStringLength(_paswd.value.text, 6)) {
//     toastInfo(msg: 'Password should be longer than 6 bits');
//     return;
//   }
//   Navigator.pushNamed(context, "/app");
// }

Widget _buildInputForm() {
  return Container(
    width: w(303),
    margin: EdgeInsets.only(top: h(207)),
    child: Column(
      children: [
        InputTextEdit(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            hintText: "Your Email",
            marginTop: 0),
        InputTextEdit(
            controller: _paswd,
            keyboardType: TextInputType.visiblePassword,
            hintText: "Password",
            isPassword: true),
        Container(
          width: w(303),
          margin: EdgeInsets.only(top: h(23)),
          child: Container(
            child: Row(
              children: <Widget>[
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: f(32),
                  ),
                ),
                Spacer(),
                forwardRoundButton(45, 45),
              ],
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

Widget _buildSignUp(context) {
  return Container(
      margin: EdgeInsets.only(bottom: h(48)),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, "/signup");
        },
        child: Text(
          "Sign up",
          style: TextStyle(color: AppColors.primaryText, fontSize: f(18)),
        ),
      ));
}
