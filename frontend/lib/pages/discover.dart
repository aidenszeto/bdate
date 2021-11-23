import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
class discoverPage extends StatefulWidget {
  const discoverPage({ Key? key }) : super(key: key);

  @override
  _discoverPageState createState() => _discoverPageState();
}

class _discoverPageState extends State<discoverPage> {
  late String first;
  late String last;
  late String photo;
  @override
  void initState() {
    super.initState();
    first = "first";
    last = "last";
    photo = "https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg";
  }

  VoidCallback handleLike() {
    return () => setState(() {
      first = "Joe";
      last = "Bruin";
      photo = "https://scontent-lax3-1.xx.fbcdn.net/v/t39.30808-6/256226769_306626027952781_4469855532132233091_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=jsco4hu_vuQAX93DMQ6&_nc_ht=scontent-lax3-1.xx&oh=99e25287c426395415b6c2b629e6c183&oe=61A11718";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            // _buildLogo(),
            card(first, last, photo),
            Container(
              margin: EdgeInsets.only(top: h(15)),
              width: h(231),
              child: Row(
              children: <Widget>[
                dislikeButton(),
                Spacer(),
                likeButton(handleLike)
              ],
            )
          )

          ],
        ),
      ),
    );
  }
}