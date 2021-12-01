import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bdate/common/widgets/widgets.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(375, 812),
    );
    return Scaffold(
      body: Center(
        child: Container(
            child: Column(
          children: <Widget>[
            buildHeadTitle(),
            _buildStartButton(context),
          ],
        )
      ),
      ),
    );
  }
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
            child: Text(
              "Create account",
              style: TextStyle(
                  color: AppColors.primaryElementText, fontSize: f(24)),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/signup");
            },
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/login");
          },
          child: Text(
            "Sign in",
            style: TextStyle(color: AppColors.primaryText, fontSize: f(24)),
          ),
        )
      ],
    ),
  );
}
