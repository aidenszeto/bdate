import 'package:flutter/material.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:bdate/common/controller/controller.dart';

Widget forwardRoundButton(double width, double height, context, String route) {
  return Container(
    width: w(width),
    height: w(height),
    child: TextButton(
        onPressed: () {
          // _handlesign()
          Navigator.pushNamed(context, route);
        },
        style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryElement, shape: CircleBorder()),
        child: Icon(
          Icons.arrow_forward_rounded,
          size: 24,
          color: AppColors.primaryElementText,
        )),
  );
}

Widget likeButton(Function handleLike) {
  return Container(
    width: h(78),
    height: h(78),
    child: TextButton(
      onPressed: handleLike(),
      style: TextButton.styleFrom(backgroundColor: AppColors.primaryElement, shape: CircleBorder()),
      child: Icon(
        Icons.favorite,
        color: AppColors.primaryElementText,
        size: 35,
      ),
    ),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100),
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

Widget dislikeButton() {
  return Container(
    width: h(78),
    height: h(78),
    child: TextButton(
      onPressed: (){},
      style: TextButton.styleFrom(backgroundColor: AppColors.primaryElementText, shape: CircleBorder()),
      child: Icon(
        Icons.close,
        color: AppColors.primaryElement,
        size: 35,
      ),
    ),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100),
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

Widget setButton(BuildContext context) {
  return Container(

    child: TextButton(
      onPressed: (){
        Navigator.pushNamed(context, "/setting");
      },
      style: TextButton.styleFrom(shape: CircleBorder()),
      child: Icon(
        Icons.settings,
        color: Colors.grey,
        size: 24,
      ),
    ),
  );
}