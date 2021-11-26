import 'package:bdate/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:bdate/common/entity/entity.dart';
import 'package:bdate/common/utils/utils.dart';
Widget card(User? user) {
  String smoke = user?.smoke ?? false ? "Smokes" : "Doesn't Smoke";
  String drink = user?.drink ?? false ? "Drinks" : "Doesn't Drink";
  String jb = "https://scontent-lax3-1.xx.fbcdn.net/v/t39.30808-6/256226769_306626027952781_4469855532132233091_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=lV4tn-5rt6gAX_7NwGl&_nc_ht=scontent-lax3-1.xx&oh=936888099a717f23d920bebe709c05ea&oe=61A50B98";
  return Container(
    margin: EdgeInsets.only(top: h(60)),
    width: w(267),
    height: h(536),
    child: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ClipRRect(borderRadius: BorderRadius.all(Radius.circular(15)), child: Image.network("${user?.photo ?? jb}", fit: BoxFit.fitHeight,)),   
        SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: h(435)),
              Container(
                child: Text(
                  "${user?.firstName ?? "Joe"} ${user?.lastName ?? "Bruin"} ", 
                  style: TextStyle(color: AppColors.primaryElementText, fontSize: f(32), fontWeight: FontWeight.w500, shadows: [Shadow(offset: Offset(2,2), color: Colors.grey, blurRadius: 1)] ),
                ), 
                margin: EdgeInsets.only(left: h(13)),
              ),
              SizedBox(height: h(83)),
              Container(
                child: Text(
                  "${user?.age ?? 97}\n${user?.gender ?? "female"}\n${user?.ethnicity ?? "bear"}\n${user?.height ?? "mystery"}\n${user?.year ?? "have a guess"}\n${user?.location ?? "anywhere in UCLA"}\n${user?.major ?? "fun"}\n$smoke\n$drink\n", 
                  style: TextStyle(color: AppColors.primaryElementText, fontSize: f(18), fontWeight: FontWeight.w500, shadows: [Shadow(offset: Offset(2,2), color: Colors.grey, blurRadius: 1)]),
                  ), 
                margin: EdgeInsets.only(left: h(24)),
              ),
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
