import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/model/Movie.dart';
import 'package:flutter_netflix_clone/screen/DetailScreen.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie>? movies;
  CarouselImage({this.movies});

  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  List<Movie>? movies;
  List<Widget>? images;
  List<String>? keywords;
  List<bool>? likes;
  int _currentPage = 0;
  String _currentKeyword = "";

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies?.map((m) => Image.network(m.poster)).toList();
    keywords = movies?.map((m) => m.keyword).toList();
    likes = movies?.map((m) => m.like).toList();
    _currentKeyword = keywords![0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(padding: EdgeInsets.all(20)),
        CarouselSlider(
          items: images,
          options: CarouselOptions(
              autoPlay: false,
              onPageChanged: (index, reasone) {
                setState(() {
                  _currentPage = index;
                  _currentKeyword = keywords![_currentPage];
                });
              }),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword,
              style: TextStyle(fontSize: 11),
            )),
        Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Column(
                  children: <Widget>[
                    likes![_currentPage]
                        ? IconButton(
                            onPressed: () {
                              likes![_currentPage] = !likes![_currentPage];
                              movies![_currentPage]
                                  .reference
                                  .update({'like': likes![_currentPage]});
                            },
                            icon: Icon(Icons.check))
                        : IconButton(
                            onPressed: () {
                              likes![_currentPage] = !likes![_currentPage];
                              movies![_currentPage]
                                  .reference
                                  .update({'like': likes![_currentPage]});
                            },
                            icon: Icon(Icons.add)),
                    Text('Like content', style: TextStyle(fontSize: 11))
                  ],
                )),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.play_arrow, color: Colors.black),
                        Padding(padding: EdgeInsets.all(3)),
                        Text('Play', style: TextStyle(color: Colors.black))
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute<Null>(
                              fullscreenDialog: true,
                              builder: (BuildContext context) {
                                return DetailScreen(
                                    movie: movies![_currentPage]);
                              }));
                        },
                        icon: Icon(Icons.info)),
                    Text(
                      'info',
                      style: TextStyle(fontSize: 11),
                    )
                  ]),
                )
              ]),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: makeIndicator(likes!, _currentPage),
          ),
        )
      ],
    ));
  }
}

List<Widget> makeIndicator(List<bool> list, int _currentPage) {
  List<Widget> result = [];
  for (int i = 0; i < list.length; ++i) {
    result.add(Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == i
              ? Color.fromRGBO(255, 255, 255, 0.9)
              : Color.fromRGBO(255, 255, 255, 0.4)),
    ));
  }

  return result;
}
