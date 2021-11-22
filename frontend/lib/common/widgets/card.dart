import 'package:bdate/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:bdate/common/entity/entity.dart';
import 'package:bdate/common/utils/utils.dart';
Widget card() {
  return Container(
    margin: EdgeInsets.only(top: h(60)),
    width: w(267),
    height: h(536),
    child: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ClipRRect(borderRadius: BorderRadius.all(Radius.circular(15)), child: Image.network('https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg', fit: BoxFit.fitHeight,)),   
        SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: h(435)),
              Container(child: Text("First Last", style: TextStyle(color: AppColors.primaryElementText, fontSize: f(32), fontWeight: FontWeight.w500),), margin: EdgeInsets.only(left: h(13)),),
              SizedBox(height: h(83)),
              Container(child: Text("DOB\nEth", style: TextStyle(color: AppColors.primaryElementText, fontSize: f(18)),), margin: EdgeInsets.only(left: h(24)),),
            ],
          ),
        )
      ],

    ),
  );
}
