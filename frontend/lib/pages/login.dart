import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:bdate/common/widgets/widgets.dart';
import 'package:bdate/common/api/post_user.dart';
import 'package:bdate/common/entity/user.dart';
import 'package:bdate/pages/app.dart';

final TextEditingController _email = TextEditingController();
final TextEditingController _paswd = TextEditingController();

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  bool isErrorVisible = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _paswd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            // _buildLogo(),
            buildHeadTitle(),
            _buildInputForm(context),
            isErrorVisible ? _errorText() : Container(),
            Spacer(),
            _buildSignUp(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInputForm(context) {
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
              width: w(303),
              margin: EdgeInsets.only(top: h(23)),
              child: TextButton(
                onPressed: () async {
                  LoginUser user =
                      LoginUser(email: _email.text, password: _paswd.text);
                  var res = await PostUser.login(user);
                  if (res != null) {
                    User curUser = res;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppPage(
                            curUser: curUser,
                          ),
                        ));
                  } else {
                    setState(() {
                      isErrorVisible = true;
                    });
                  }
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue)))),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: f(25),
                  ),
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

Widget _errorText() {
  return const Center(
      child: Text(
    "Invalid username or password",
    style: TextStyle(color: Colors.red),
  ));
}
