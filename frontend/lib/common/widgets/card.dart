import 'package:bdate/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:bdate/common/entity/entity.dart';
import 'package:bdate/common/utils/utils.dart';

Widget card(User? user) {
  String smoke = user?.smoke ?? false ? "Smokes" : "Doesn't Smoke";
  String drink = user?.drink ?? false ? "Drinks" : "Doesn't Drink";
  String joebruinpic =
      "https://images2.minutemediacdn.com/image/fetch/c_fill,g_auto,f_auto,h_560,w_850/https%3A%2F%2Fgojoebruin.com%2Fwp-content%2Fuploads%2Fgetty-images%2F2018%2F03%2F930139338-ucla-v-arizona.jpg.jpg";
  return Container(
    margin: EdgeInsets.only(top: h(60)),
    width: w(287),
    height: h(536),
    child: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Image.network(
              "${user?.photo ?? joebruinpic}",
              fit: BoxFit.fitHeight,
            )),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: h(435)),
              Container(
                child: Row(
                  children: [
                    Flexible(
                        child: Text(
                      "${user?.firstName ?? "Joe"} ${user?.lastName ?? "Bruin"} ",
                      style: TextStyle(
                          color: AppColors.primaryElementText,
                          fontSize: f(28),
                          fontWeight: FontWeight.w500,
                          shadows: [
                            Shadow(
                                offset: Offset(2, 2),
                                color: Colors.grey,
                                blurRadius: 1)
                          ]),
                    )),
                    user?.verified ?? true
                        ? Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                  ],
                ),
                margin: EdgeInsets.only(left: h(13)),
              ),
              SizedBox(height: h(83)),
              Container(
                child: Text(
                  "${user?.age ?? 97} years old\n${user?.gender ?? "Female"}\n${user?.ethnicity ?? "bear"}\n${user?.height ?? "mystery"}\n${user?.year ?? "idk which"} year\nLives at ${user?.location ?? "anywhere in UCLA"}\n${user?.major ?? "fun"} major\n$smoke\n$drink\n",
                  style: TextStyle(
                      color: AppColors.primaryElementText,
                      fontSize: f(18),
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                            offset: Offset(2, 2),
                            color: Colors.grey,
                            blurRadius: 1)
                      ]),
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
