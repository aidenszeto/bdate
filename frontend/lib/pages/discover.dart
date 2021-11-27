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
                      CheckboxListTile(
                        value: filter.drink,
                        title: Text("Smoking", style: TextStyle(fontSize: f(16), fontWeight: FontWeight.w400, color: AppColors.primaryText),),
                        subtitle: const Text("Want others smoke?"),
                        secondary: const Icon(Icons.smoke_free),
                        onChanged: (value){
                          setState(() {
                            filter.drink=value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        value: filter.smoke,
                        title: Text("Drinking?", style: TextStyle(fontSize: f(16), fontWeight: FontWeight.w400, color: AppColors.primaryText),), 
                        subtitle: const Text("Want others drink?"),
                        secondary: const Icon(Icons.local_drink),
                        onChanged: (value){
                          setState(() {
                            filter.smoke=value;
                          });
                        },
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Material(
                            elevation: 5.0,
                            color: Colors.blue[900],
                            child: MaterialButton(
                              padding: EdgeInsets.fromLTRB(
                                  10.0, 5.0, 10.0, 5.0),
                              onPressed: () {
                                _loadFilter();
                                index=0;
                                },
                              child: Text("Save",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  )),
                            ),
                          ),
                          Material(
                            elevation: 5.0,
                            color: Colors.blue[900],
                            child: MaterialButton(
                              padding: EdgeInsets.fromLTRB(
                                  10.0, 5.0, 10.0, 5.0),
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("Cancel",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  )),
                            ),
                          ),
                          Material(
                            elevation: 5.0,
                            color: Colors.blue[900],
                            child: MaterialButton(
                              padding: EdgeInsets.fromLTRB(
                                  10.0, 5.0, 10.0, 5.0),
                              onPressed: () {},
                              child: Text("Select All",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  )),
                            ),
                          ),
                        ],
                      )
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