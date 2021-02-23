import 'package:demo/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                        child: CircleAvatar(
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
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'user name',
                      )
                    ],
                  )
                  //Text("Header"),
                  ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ListView(
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
          Expanded(
            flex: 1,
            child: Container(
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
                    'mode',
                  )
                ],
              ),
              color: Colors.red[100],
            ),
          )
        ],
      ),
    );
  }
}
