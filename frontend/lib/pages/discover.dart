import 'package:bdate/common/api/get_user.dart';
import 'package:bdate/common/entity/user.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
class discoverPage extends StatefulWidget {
  const discoverPage({ Key? key }) : super(key: key);

  @override
  _discoverPageState createState() => _discoverPageState();
}

class _discoverPageState extends State<discoverPage> {

  User? user;

  @override
  void initState() {
    _loadUser().whenComplete((){setState(() {});});
    super.initState();

  }

  _loadUser() async {
    user = await GetUser.getUser();
    if(mounted){
      setState(() {});
    }
  }

  VoidCallback handleLike() {
    return () => setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            // _buildLogo(),
            card(user),
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