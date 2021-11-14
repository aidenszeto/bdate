import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Bdate",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 45.0,
                  )),
              Column(
                children: [
                  SizedBox(
                    height: 40.0,
                    width: 175.0,
                    child: TextButton(
                      onPressed: () => {Navigator.pushNamed(context, '/login')},
                      child: const Text("Login",
                          style: TextStyle(color: Colors.black)),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      height: 40.0,
                      width: 175.0,
                      child: TextButton(
                        onPressed: () =>
                            {Navigator.pushNamed(context, '/create')},
                        child: const Text("Create",
                            style: TextStyle(color: Colors.black)),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange)),
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
