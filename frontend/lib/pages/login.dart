import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:bdate/common/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _paswd = TextEditingController();

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

  Widget _buildHeadTitle() {
      return Container(
      margin: EdgeInsets.only(top: h(164)),
      child: Text(
        "Bdate",
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

  Widget _buildInputForm() {
    return Container(
      width: w(303),
      margin: EdgeInsets.only(top: h(207)),
      child: Column(
        children: [
          InputTextEdit(controller: _email, keyboardType: TextInputType.emailAddress, hintText: "Your Email", marginTop: 0),
          InputTextEdit(controller: _paswd, keyboardType: TextInputType.visiblePassword, hintText: "Password", isPassword: true),
          Container(
            width: w(280),
            
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
                  Container(
                    width: w(64),
                    height: w(64),
                    child: TextButton(
                      
                      onPressed: () {}, 
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryElement, 
                        shape: CircleBorder()), 
                      child: Icon(Icons.arrow_forward_rounded, size: 24, color: AppColors.primaryElementText,)),
                  ),
                  
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


  Widget _buildSignUp() {
    return Container(
      margin: EdgeInsets.only(bottom: h(48)),
      child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/signup");
            }, 
            child: Text("Sign up", style: TextStyle(color: AppColors.primaryText, fontSize: f(18)),),)
    );  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            // _buildLogo(),
            _buildHeadTitle(),
            _buildInputForm(),
            Spacer(),
            _buildSignUp(),
          ],
        ),
      ),
    );
  }
}