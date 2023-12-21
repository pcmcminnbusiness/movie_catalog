import 'package:flutter/material.dart';
import 'package:movie_catalog/movieCard.dart';
import 'package:movie_catalog/movieInfo.dart';
import 'package:movie_catalog/requests.dart' as requests;
import 'package:movie_catalog/tokens.js' as tokens;

class MovieCatalogPage extends StatelessWidget {
  const MovieCatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MovieCatalogs(),
    );
  }
}

class MovieCatalogs extends StatefulWidget {
  const MovieCatalogs({super.key});

  @override
  State<MovieCatalogs> createState() => MovieCatalogsState();
}

class MovieCatalogsState extends State<MovieCatalogs> {
  var popularMovieList = [];
  var trendingMovieList = [];

  @override
  void initState() {
    super.initState();
    createPopularMovieCards();
    createTrendingMovieCards();
  }

  createPopularMovieCards() async {
    var temp = await requests.getAllPopularMovies(tokens.APIReadAccessToken);
    temp = temp['results'];

    for (var movie in temp) {
      movieInfo tempMovie = movieInfo(movie['id'], movie['poster_path'],
          movie['title'], movie['overview'], movie['vote_average']);
      MovieCard tempMovieCard = MovieCard(daMovieInfo: tempMovie);
      popularMovieList.add(tempMovieCard);
    }

    setState(() {});
  }

  createTrendingMovieCards() async {
    var temp = await requests.getAllTrendingMovies(tokens.APIReadAccessToken);
    temp = temp['results'];

    for (var movie in temp) {
      movieInfo tempMovie = movieInfo(movie['id'], movie['poster_path'],
          movie['title'], movie['overview'], movie['vote_average']);
      MovieCard tempMovieCard = MovieCard(daMovieInfo: tempMovie);
      trendingMovieList.add(tempMovieCard);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Catalogs"),
      ),
      body: Center(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                "Popular Movies",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 400,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [...popularMovieList],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                "Trending Movies",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 400,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [...trendingMovieList],
              ),
            )
          ],
        ),
      ),
    );
  }
}
