import 'package:bdate/common/api/api.dart';
import 'package:bdate/common/entity/entity.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



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
  int index = 0;
  int n = 0;

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
    n = list_user.length;
    print(list_user);
    user = await GetUser.getUser(list_user[index].id);
    if(mounted){
      setState(() {});
    }
  }

  // _loadUser() async {
  //   user = await GetUser.getUser(list_user[1].id);
  //   if(mounted){
  //     setState(() {});
  //   }
  // }

  Future<VoidCallback> handleLike() async {
    print(index);
    if(index <= n-1) {
      var new_user = await GetUser.getUser(list_user[index].id);
      setState(() {
        user = new_user;
      });
      index += 1;
    }
    else {
      AlertDialog alert = const AlertDialog(content: Text("You reached the end of the world"),);
      showDialog(context: context, builder: (BuildContext context) {return alert;});
    }
    return () => setState(() {
    });
  }


  Future<VoidCallback> handleDisLike() async {
    print(index);
    if(index <= n-1) {
      var new_user = await GetUser.getUser(list_user[index].id);
      setState(() {
        user = new_user;
      });
      index += 1;
    }
    return () => setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            card(user),
            Container(
              margin: EdgeInsets.only(top: h(15)),
              width: h(261),
              child: Row(
              children: <Widget>[
                dislikeButton(handleDisLike),
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