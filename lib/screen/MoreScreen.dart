import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('images/logo.png'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'flutter-netflex-clone',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 140,
            height: 5,
            color: Colors.red,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Linkify(
              onOpen: (link) async {
                if (await canLaunchUrl(Uri.parse(link.url))) {
                  await launchUrl(Uri.parse(link.url));
                }
              },
              text: "https://github.com/yeosu0107",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              linkStyle: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.edit, color: Colors.white),
                  Padding(padding: EdgeInsets.all(3)),
                  Text('Edit Profile', style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
