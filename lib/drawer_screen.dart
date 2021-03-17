import 'package:demo/pages/login_pages/login.dart';
import 'package:demo/pages/login_pages/login_componant.dart';
import 'package:demo/widget/drawer_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width * 0.85,
              child: DrawerHeader(
                  //  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        child: Text(
                          'A',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        backgroundColor: Colors.pinkAccent[100],
                      ),
                      SizedBox(
                        height: 110,
                      ),
                      Text(
                        'user name',
                      )
                    ],
                  )
                  //Text("Header"),
                  ),
            ),
            Container(
              height: 600,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  DrawerWidget(
                    icon: Icon(Icons.home),
                    title: 'home',
                  ),
                  DrawerWidget(
                    icon: Icon(Icons.home),
                    title: 'home',
                  ),
                  DrawerWidget(
                    icon: Icon(Icons.home),
                    title: 'home',
                  ),
                  DrawerWidget(
                    icon: Icon(Icons.home),
                    title: 'home',
                  ),
                  DrawerWidget(
                    icon: Icon(Icons.home),
                    title: 'home',
                  ),
                  DrawerWidget(
                    icon: Icon(Icons.home),
                    title: 'home',
                  ),
                  DrawerWidget(
                    icon: Icon(Icons.home),
                    title: 'home',
                  ),
                  DrawerWidget(
                    icon: Icon(Icons.home),
                    title: 'home',
                  ),
                  DrawerWidget(
                    icon: Icon(Icons.home),
                    title: 'home',
                  ),
                  DrawerWidget(
                    icon: Icon(Icons.home),
                    title: 'home',
                  ),
                  DrawerWidget(
                    icon: Icon(Icons.home),
                    title: 'home',
                  ),
                ],
              ),
            ),
            Container(
              height: 75,
              child: InkWell(
                onTap: () {
                  final out = FirebaseAuth.instance.signOut();
                  if (out != null) {
                    Navigator.pushNamed(context, LogInComponantPage.id);
                  }
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.replay_circle_filled,
                      size: 45,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'SignOut',
                    )
                  ],
                ),
              ),
              color: Colors.red[100],
            )
          ],
        ),
      ),
    );
  }
}
