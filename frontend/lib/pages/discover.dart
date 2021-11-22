import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
class discoverPage extends StatefulWidget {
  const discoverPage({ Key? key }) : super(key: key);

  @override
  _discoverPageState createState() => _discoverPageState();
}

class _discoverPageState extends State<discoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            // _buildLogo(),
            card(),
            Container(
              margin: EdgeInsets.only(top: h(15)),
              width: h(231),
              child: Row(
              children: <Widget>[
                dislikeButton(),
                Spacer(),
                likeButton()
              ],
            )
          )

          ],
        ),
      ),
    );
  }
}