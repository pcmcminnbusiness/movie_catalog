import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_catalog/Navigation.dart';
import 'package:movie_catalog/requests.dart' as request;
import 'package:movie_catalog/tokens.js' as token;

void main() {
  runApp(const daNavigationBarApp()); // was const MyApp()
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Movie Catalog App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _counter = 0;
  double _storedNumber = 0;
  int _mathState =
      0; // mathState tells what operation to perform when the equal
  // button is pressed 0 is nothing, 1 is divide, 2 is multiply,
  // 3 is minus, and 4 is plus

  void _pressNumber(int daNum) {
    setState(() {
      _counter = _counter * 10;
      _counter = _counter + daNum;
    });
  }

  void _pressDivide() {
    _storedNumber = _counter;
    _counter = 0;
    _mathState = 1;
  }

  void _pressMultiply() {
    _storedNumber = _counter;
    _counter = 0;
    _mathState = 2;
  }

  void _pressMinus() {
    _storedNumber = _counter;
    _counter = 0;
    _mathState = 3;
  }

  void _pressDecimal() {
    setState(() {
      _counter = 9;
    });
  }

  void _pressEqual() {
    switch (_mathState) {
      case 0:
        break;
      case 1:
        _counter = _storedNumber / _counter;
        break;
      case 2:
        _counter = _storedNumber * _counter;
        break;
      case 3:
        _counter = _storedNumber - _counter;
        break;
      case 4:
        _counter = _storedNumber + _counter;
    }
    setState(() {});
    _storedNumber = _counter;
    _mathState = 0;
    //_counter = 0;
  }

  void _pressPlus() {
    _storedNumber = _counter;
    _counter = 0;
    _mathState = 4;
  }

  void _pressClear() {
    setState(() {
      _counter = 0;
      _mathState = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => _pressNumber(1),
                  child: const Icon(Icons.looks_one),
                ),
                FloatingActionButton(
                  onPressed: () => _pressNumber(2),
                  child: const Icon(Icons.looks_two),
                ),
                FloatingActionButton(
                  onPressed: () => _pressNumber(3),
                  child: const Icon(Icons.looks_3),
                ),
                FloatingActionButton(
                  onPressed: _pressDivide,
                  child: const Icon(CupertinoIcons.divide),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => _pressNumber(4),
                  child: const Icon(Icons.looks_4),
                ),
                FloatingActionButton(
                  onPressed: () => _pressNumber(5),
                  child: const Icon(Icons.looks_5),
                ),
                FloatingActionButton(
                  onPressed: () => _pressNumber(6),
                  child: const Icon(Icons.looks_6),
                ),
                FloatingActionButton(
                  onPressed: _pressMultiply,
                  child: const Icon(CupertinoIcons.multiply),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => _pressNumber(7),
                  child: const Icon(Icons.looks_one),
                ),
                FloatingActionButton(
                  onPressed: () => _pressNumber(8),
                  child: const Icon(Icons.looks_two),
                ),
                FloatingActionButton(
                  onPressed: () => _pressNumber(9),
                  child: const Icon(Icons.looks_3),
                ),
                FloatingActionButton(
                  onPressed: _pressMinus,
                  child: const Icon(CupertinoIcons.minus),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => _pressNumber(0),
                  child: const Icon(Icons.exposure_zero),
                ),
                FloatingActionButton(
                  onPressed: _pressDecimal,
                  child: const Icon(Icons.looks_two),
                ),
                FloatingActionButton(
                  onPressed: _pressEqual,
                  child: const Icon(CupertinoIcons.equal),
                ),
                FloatingActionButton(
                  onPressed: _pressPlus,
                  child: const Icon(CupertinoIcons.plus),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => request.getAllPopularMovies(
                      token.APIReadAccessToken), //_pressClear,
                  child: const Icon(Icons.exposure_zero),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
