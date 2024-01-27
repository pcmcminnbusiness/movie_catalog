import 'package:flutter/material.dart';
import 'package:movie_catalog/movieInfo.dart';

class InfoScreen extends StatefulWidget {
  final movieInfo daMovieInfo;

  InfoScreen({Key? key, required this.daMovieInfo}) : super(key: key);

  @override
  InfoScreenState createState() => InfoScreenState();
}

class InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(children: [
            Container(
              alignment: Alignment.topLeft,
              height: 40,
              width: 40,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back),
              ),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width - 50),
            )
          ]),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width / 9),
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: (MediaQuery.of(context).size.width / 3)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 350,
                    ),
                    Text(
                      'Title: ${widget.daMovieInfo.title}',
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Description: ${widget.daMovieInfo.description}',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Rating: ${widget.daMovieInfo.rating.toString()}',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width / 9),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width / 3),
                child: Image.network(
                    'https://image.tmdb.org/t/p/w500${widget.daMovieInfo.daImage}'),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width / 9),
              )
            ],
          )
        ],
      ),
    );
  }
}
