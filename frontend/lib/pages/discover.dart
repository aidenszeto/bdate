import 'package:bdate/common/api/api.dart';
import 'package:bdate/common/api/get_user.dart';
import 'package:bdate/common/entity/entity.dart';
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
  Filter filter = Filter(
    whoToDate: [], 
    year: [], 
    location: [], 
    drink: false, 
    smoke: false
  ); // will change to true & true later
  User? user;
  late List<User> list_user;

  @override
  void initState() {
    _loadFilter().whenComplete((){setState(() {});});
    // _loadUser().whenComplete((){setState(() {});});
    super.initState();

  }
  _loadFilter() async {
    list_user = await GetFilter.getFilter(filter);
    if(mounted){
      setState(() {});
    }
    print(list_user);
    user = await GetUser.getUser(list_user[1].id);
    if(mounted){
      setState(() {});
    }
  }

  _loadUser() async {
    user = await GetUser.getUser(list_user[1].id);
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
              width: h(261),
              child: Row(
              children: <Widget>[
                dislikeButton(),
                Spacer(),
                setButton(context),
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