import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class matchesPage extends StatelessWidget {
  matchesPage({Key? key}) : super(key: key);

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
            _title(),
          ],
        )),
      ),
    );
  }
}

Widget _title() {
  return Container(
      margin: EdgeInsets.only(top: h(50)),
      child: const Text("Matches",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 30,
            height: 1,
          )));
}
