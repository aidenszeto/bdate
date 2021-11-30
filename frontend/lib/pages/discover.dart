import 'package:bdate/common/api/api.dart';
import 'package:bdate/common/entity/entity.dart';
import 'package:bdate/common/utils/utils.dart';
import 'package:bdate/common/values/values.dart';
import 'package:bdate/common/widgets/widgets.dart';
import 'package:flutter/material.dart';



class discoverPage extends StatefulWidget {
  discoverPage({ Key? key , required this.curUser}) : super(key: key);
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
  );
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
  ); 
  User? user;
  late List<User> listuser;
  int index = 0;
  int n = 0;
  final TextEditingController _place = TextEditingController();
  final TextEditingController _year = TextEditingController();
  final TextEditingController _gender = TextEditingController();


  @override
  void initState() {
    _loadFilter().whenComplete((){setState(() {});});
    super.initState();
  }

  @override
  void dispose() {
    _place.dispose();
    _gender.dispose();
    _year.dispose();
    super.dispose();
  }

  _loadFilter() async {
    listuser = await GetFilter.getFilter(filter);
    if(mounted){
      setState(() {});
    }
    n = listuser.length;
    if(n != 0) {
      user = await GetUser.getUser(listuser[index].id);
      if(mounted){
        setState(() {});
      }
    }
    else {
      AlertDialog alert = const AlertDialog(content: Text("No user can be found with your current options.\nTry switching options"),);
      showDialog(context: context, builder: (BuildContext context) {return alert;});
    }
  }

  _putLike() async {
    print(widget.curUser.id + " " + user!.id);
    var updated = await PutLike.putLike(widget.curUser, user!);
    widget.curUser = await GetUser.getUser(widget.curUser.id);
  }

  _putDisLike() async {
    print(widget.curUser.id + " " + user!.id);
    var updated = await PutDisLike.putDisLike(widget.curUser, user!);
    widget.curUser = await GetUser.getUser(widget.curUser.id);
  }

  Future<VoidCallback> handleLike() async {
    _putLike();
    if(index <= n-1) {
      var newuser = await GetUser.getUser(listuser[index].id);
      setState(() {
        user = newuser;
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
    _putDisLike();
    if(index <= n-1) {
      var newuser = await GetUser.getUser(listuser[index].id);
      setState(() {
        user = newuser;
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
                          secondary:  const Icon(Icons.smoke_free,),
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
                          secondary:  const Icon(Icons.local_drink),
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
                          decoration: const InputDecoration(
                            hintText: "Add a place you want to date",
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: f(12),
                            color: AppColors.primaryText
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
                          decoration: const InputDecoration(
                            hintText: "Add a year you want to date",
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: f(12),
                            color: AppColors.primaryText,
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
                          decoration: const InputDecoration(
                            hintText: "Add a gender you want to date",
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: f(12),
                            color: AppColors.primaryText
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