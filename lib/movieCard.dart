import 'package:flutter/material.dart';
import 'package:movie_catalog/movieInfo.dart';
import 'package:movie_catalog/infoScreen.dart';

class MovieCard extends StatefulWidget {
  final movieInfo daMovieInfo;

  MovieCard({Key? key, required this.daMovieInfo}) : super(key: key);

  @override
  MovieCardState createState() => MovieCardState();
}

class MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InfoScreen(
                            daMovieInfo: widget.daMovieInfo,
                          )));
            },
            child: SizedBox(
                width: 200,
                //height: 400,
                child: Image.network(
                    'https://image.tmdb.org/t/p/w500${widget.daMovieInfo.daImage}')),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 200,
          child: Text(
            textAlign: TextAlign.center,
            widget.daMovieInfo.title,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
