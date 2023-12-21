//import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

//Future<dynamic>
getAllPopularMovies(String apiKey) async {
  const String url =
      'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1'; //language=en-US&page=1';
  final Map<String, String> headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  try {
    final http.Response response =
        await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    }
  } catch (error) {
    return error;
  }
}

getAllTrendingMovies(String apiKey) async {
  const String url =
      'https://api.themoviedb.org/3/trending/movie/day?'; //language=en-US&page=1';
  final Map<String, String> headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  try {
    final http.Response response =
        await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    }
  } catch (error) {
    return error;
  }
}
