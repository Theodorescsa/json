import 'dart:convert';

import 'package:flutter/material.dart';
import 'json.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  List<String> jsonList = [
    jsonlist1,
    jsonlist2,
    jsonlist3,
    jsonlist4,
    jsonlist5,
    jsonlist6,
    jsonlist7
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;

      if (_counter <= jsonList.length) {
        var scores = jsonDecode(jsonList[_counter]);
        print(scores);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String decodedJson = '';

    if (_counter <= jsonList.length) {
      decodedJson = jsonList[_counter];
    }

    var decodedData = jsonDecode(decodedJson);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: decodedData is List && decodedData.isNotEmpty
                    ? Text(
                        decodedData[0].toString(),
                        style: TextStyle(fontSize: 16.0),
                      )
                    : Text(
                        'Empty List',
                        style: TextStyle(fontSize: 16.0),
                      ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
