import 'package:bdate/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:bdate/common/entity/entity.dart';
import 'package:bdate/common/utils/utils.dart';
Widget card(String first, String last, String url) {
  return Container(
    margin: EdgeInsets.only(top: h(60)),
    width: w(267),
    height: h(536),
    child: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ClipRRect(borderRadius: BorderRadius.all(Radius.circular(15)), child: Image.network(url, fit: BoxFit.fitHeight,)),   
        SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: h(435)),
              Container(child: Text(first+" "+last, style: TextStyle(color: AppColors.primaryElementText, fontSize: f(32), fontWeight: FontWeight.w500, shadows: [Shadow(offset: Offset(2,2), color: Colors.grey, blurRadius: 1)] ),), margin: EdgeInsets.only(left: h(13)),),
              SizedBox(height: h(83)),
              Container(child: Text("DOB\nEth", style: TextStyle(color: AppColors.primaryElementText, fontSize: f(18)),), margin: EdgeInsets.only(left: h(24)),),
            ],
          ),
        )
      ],

    ),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 2,
        offset: Offset(4, 8), // Shadow position
      ),
    ],
  ),
  );
}
