import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/screen/HomeScreen.dart';
import 'package:flutter_netflix_clone/screen/MoreScreen.dart';
import 'package:flutter_netflix_clone/widget/BottomBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'netflix-clone',
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.black,
            accentColor: Colors.white),
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    HomeScreen(),
                    Container(child: Center(child: Text('Search'))),
                    Container(child: Center(child: Text('Save'))),
                    MoreScreen()
                  ]),
              bottomNavigationBar: BottomBar(),
            )));
  }
}
