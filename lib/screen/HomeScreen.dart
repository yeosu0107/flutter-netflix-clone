import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/model/Movie.dart';
import 'package:flutter_netflix_clone/widget/BoxSlider.dart';
import 'package:flutter_netflix_clone/widget/CarouselSlider.dart';
import 'package:flutter_netflix_clone/widget/CircleSlider.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지1',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지2',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지3',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지4',
      'poster': 'test_movie_1.png',
      'like': false
    })
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[CarouselImage(movies: movies), TopBar()],
        ),
        CircleSlider(movies: movies),
        BoxSlider(movies: movies)
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.asset('images/logo.png', fit: BoxFit.contain, height: 25),
        Container(
          padding: EdgeInsets.only(right: 1),
          child: Text(
            'TV Programs',
            style: TextStyle(fontSize: 14),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 1),
          child: Text(
            'Movie',
            style: TextStyle(fontSize: 14),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 1),
          child: Text(
            'Picking Contents',
            style: TextStyle(fontSize: 14),
          ),
        )
      ]),
    );
  }
}
