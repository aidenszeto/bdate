import 'package:bdate/common/api/api.dart';
import 'package:bdate/common/entity/entity.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
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
    drink: true, 
    smoke: true
  ); // will change to true & true later
  User? user;
  late List<User> list_user;
  int index = 0;
  int n = 0;
  final TextEditingController _place = TextEditingController();
  final TextEditingController _year = TextEditingController();
  final TextEditingController _gender = TextEditingController();


  @override
  void initState() {
    _loadFilter().whenComplete((){setState(() {});});
    // _loadUser().whenComplete((){setState(() {});});
    super.initState();

  }

  @override
  void dispose() {
    _place.dispose();
    super.dispose();
  }

  _loadFilter() async {
    list_user = await GetFilter.getFilter(filter);
    if(mounted){
      setState(() {});
    }
    n = list_user.length;
    if(n != 0) {
      user = await GetUser.getUser(list_user[index].id);
      if(mounted){
        setState(() {});
      }
    }
    else {
      AlertDialog alert = const AlertDialog(content: Text("No user can be found; try switching options"),);
      showDialog(context: context, builder: (BuildContext context) {return alert;});
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
      // post like
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
    return () => setState(() {});
  }

  Future<VoidCallback> handleDisLike() async {
    print(index);
    if(index <= n-1) {
      // post dislike
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
    return () => setState(() {});
  }

  VoidCallback handleSetting() {
    showDialog(
      context: context, 
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              actions: <Widget>[
                Container(
                  width: w(350),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Your search preferences",
                        style: TextStyle(fontSize: f(20), fontWeight: FontWeight.w500, color: AppColors.primaryText),
                      ),
                      Container(
                        margin: EdgeInsets.all(h(5)),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryElement,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CheckboxListTile(
                          value: filter.drink,
                          title: Text("Smoking", style: TextStyle(fontSize: f(16), fontWeight: FontWeight.w400, color: AppColors.primaryText),),
                          secondary:  Icon(Icons.smoke_free,),
                          onChanged: (value){
                            setState(() {
                              filter.drink=value;
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(h(5)),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryElement,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CheckboxListTile(
                          value: filter.smoke,
                          title: Text("Drinking", style: TextStyle(fontSize: f(16), fontWeight: FontWeight.w400, color: AppColors.primaryText),), 
                          secondary:  Icon(Icons.local_drink),
                          onChanged: (value){
                            setState(() {
                              filter.smoke=value;
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(h(5)),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryElement,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: _place,
                          autocorrect: false,
                          decoration: InputDecoration(
                            hintText: "Add a place you want to date",
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: f(12),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(h(5)),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryElement,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: _year,
                          autocorrect: false,
                          decoration: InputDecoration(
                            hintText: "Add a year you want to date",
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: f(12),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(h(5)),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryElement,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: _gender,
                          autocorrect: false,
                          decoration: InputDecoration(
                            hintText: "Add a gender you want to date",
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: f(12),
                          ),
                        ),
                      ),
                      Container(
                        width: w(200),
                        child: Row(
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                index=0;
                                filter.location = [];
                                if(_place.text != "") {
                                  filter.location.add(_place.text);
                                }
                                filter.year = [];
                                if(_year.text != "") {
                                  filter.year.add(_year.text);
                                }
                                filter.whoToDate = [];
                                if(_gender.text != "") {
                                  filter.whoToDate.add(_gender.text);
                                }
                                _loadFilter();
                                Navigator.of(context).pop();
                              }, 
                              child: Text("save", style: TextStyle(fontSize: f(16), fontWeight: FontWeight.w400, color: AppColors.primaryElement),),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).pop();
                                });
                              }, 
                              child: Text("cancel", style: TextStyle(fontSize: f(16), fontWeight: FontWeight.w400, color: AppColors.primaryElement),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                )
              ],
            );
          }
        );
      }
    );
    return () => setState(() {});
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
                setButton(handleSetting),
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