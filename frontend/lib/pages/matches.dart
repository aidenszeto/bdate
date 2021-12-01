import 'package:bdate/common/entity/user.dart';
import 'package:flutter/material.dart';
import 'package:bdate/common/api/api.dart';
import 'package:bdate/common/widgets/matchcard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class matchesPage extends StatefulWidget {
  List<String> matchesIds;

  matchesPage({Key? key, @required required this.curUser})
      : matchesIds = curUser.matches,
        super(key: key);

  User curUser = User(
    id: "",
    firstName: "",
    lastName: "",
    email: "",
    password: "",
    age: 0,
    gender: "",
    ethnicity: "",
    height: "",
    year: "",
    location: "",
    major: "",
    smoke: false,
    drink: false,
    photo: "",
    instagram: "",
    snapchat: "",
    likedBy: [],
    dislikedBy: [],
    matches: [],
    v: 0,
    verified: false,
    verificationNumber: -1,
  );
  @override
  _matchesPageState createState() => _matchesPageState();
}

class _matchesPageState extends State<matchesPage> {
  List<User> new_list = [];
  List<String> ids = [];
  //User? u;

  //User? user;

  initState() {
    ids = widget.curUser.matches;
    //u = widget.curUser;
    super.initState();
    _getUserData().then((value) {
      setState(() {});
    });
  }

  _getUserData() async {
    for (var i in ids) {
      var response = await GetUser.getUser(i);
      new_list.add(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(375, 812),
    );
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Column(
      children: getList(new_list, context, widget.curUser),
    ))));
  }
}

List<Widget> getList(List<User> users, BuildContext b, User usr) {
  List<Widget> childs = [];
  childs.add(_title());
  for (var i = 0; i < users.length; i++) {
    childs.add(matchcard(users[i]));
  }
  if (childs.length == 1) {
    childs.add(Text('You have no matches'));
  }
  //childs.add(_buildButtons(b, usr));
  return childs;
}

Widget _data() {
  return Container(child: const Text('Hell'));
}

Widget _title() {
  return Container(
      margin: EdgeInsets.only(top: 50),
      child: const Text("Matches",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 30,
            height: 1,
            color: Colors.black,
          )));
}
