import 'package:bdate/common/entity/user.dart';
import 'package:flutter/material.dart';
import 'package:bdate/common/api/api.dart';
import 'package:bdate/pages/app.dart';
import 'dart:convert';

import 'package:bdate/common/widgets/widgets.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class matchesPage extends StatefulWidget {
  List<String> matchesIds;

  matchesPage({Key? key, required matches})
      : matchesIds = matches,
        super(key: key);
  @override
  _matchesPageState createState() => _matchesPageState();
}

class _matchesPageState extends State<matchesPage> {
  List<User> new_list = [];
  List<String> ids = [];

  //User? user;

  initState() {
    ids = widget.matchesIds;
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
    //var response = await GetUser.getUser('619ae978dd241249abd866fc');
    //new_list.add(response);
    //new_list.add(response);
    //print(response.firstName);
    //print(new_list[0].firstName);

    /*var jsonUsr = jsonEncode((response));

    var usr = await GetUser.getUser('619ae978dd241249abd866fc');
    List matchesArray = [];
    var matchesIdArray = response.matches;

    for (int i = 0; i < matchesIdArray.length; i++) {
      print(matchesIdArray[i]);
      var getMatch = await GetUser.getUser(matchesIdArray[i]);
      var person = match(getMatch.firstName, getMatch.lastName, getMatch.email,
          getMatch.instagram, getMatch.snapchat);
      matchesArray.add(person);
    }
    for (int j = 0; j < matchesArray.length; j++) {
      matchesArray[j].displayData();
    }
    /*for (int i = 0; i < matchesArray.length; i++) {
      print(matchesIdArray[i]);
      var response = await GetUser.getUser(matchesIdArray[i]);
      print(response.firstName);
      var person = match(response.firstName, response.lastName, response.email,
          response.instagram, response.snapchat);

      matchesArray.add(person);*/
    }*/
    //print(matchesArray);
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
      children: getList(_title(), new_list),
    ))));
  }
}

List<Widget> getList(Widget w, List<User> users) {
  List<Widget> childs = [];
  childs.add(w);
  for (var i = 0; i < users.length; i++) {
    childs.add(card(users[i]));
  }
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

/*class matchesPage extends StatelessWidget {
  List<User> new_list = [];

  matchesPage({Key? key}) : super(key: key);

  _getMatchesData() async {
    var response = await GetUser.getUser('619ae978dd241249abd866fc');
    new_list.add(response);
  }

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        _getMatchesData().then((value) {
          print('Async done');
          print(new_list[0].firstName);
          child:
          Container();
        });
      },
      child: Container(
          child: Column(
        children: <Widget>[_title(), card(new_list[0])],
      )),
    );
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(375, 812),
    );
    return Scaffold(
      body: Center(
        child: Container(
            child: Column(
          children: <Widget>[_title(), for (var usr in new_list) card(usr)],
        )),
      ),
    );
  }
}

class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;
  const StatefulWrapper({required this.onInit, required this.child});
  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

Widget _title() {
  return Container(
      //margin: EdgeInsets.only(top: h(50)),
      child: const Text("Matches",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 30,
            height: 1,
          )));
}
*/
