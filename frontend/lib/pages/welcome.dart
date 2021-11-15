import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);
  @override
  _WelcomePageState createState() => _WelcomePageState();
}


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

Widget _buildStartButton(BuildContext context) {
      return Container(
      width: w(303),
      height: h(130),
      margin: EdgeInsets.only(top: h(398)),
      child: Column(
        children: [
          Container(
            width: w(303),
            height: h(60),
            child: TextButton(
              style: tStyle.buttonStyle,
              child: Text("Create account", style: TextStyle(color: AppColors.primaryElementText, fontSize: f(24)),),
              onPressed: () {
                Navigator.pushNamed(context, "/signup");
              },
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/login");
            }, 
            child: Text("Sign in", style: TextStyle(color: AppColors.primaryText, fontSize: f(24)),),)
        ],
      ),
    );
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(375, 812),);
    return Scaffold(
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                _buildHeadTitle(),
                // _buildHeadDetail(),
                // _buildFeatureItem("feature1", "Keep tract of every big and new events going on in the crypto space", 86),
                // _buildFeatureItem("feature2", "Share thoughts in the community and get rewards", 40),
                // _buildFeatureItem("feature3", "Customized sources all for your, make reading news an enjoyment ", 40),
                // Spacer(),
                _buildStartButton(context),
            ],)
        ),
      ),
    );
  }
}