import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/screen/HomeScreen.dart';
import 'package:flutter_netflix_clone/screen/MoreScreen.dart';
import 'package:flutter_netflix_clone/screen/SearchScreen.dart';
import 'package:flutter_netflix_clone/widget/BottomBar.dart';

//firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
                    SearchScreen(),
                    Container(child: Center(child: Text('Save'))),
                    MoreScreen()
                  ]),
              bottomNavigationBar: BottomBar(),
            )));
  }
}
