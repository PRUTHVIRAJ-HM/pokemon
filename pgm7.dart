import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Stopwatch stopwatch;
  late Timer t;
  void handleStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;
    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(
      2,
      "0",
    ); // this is for the second
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(
      2,
      "0",
    ); // this is for the minute
    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            // this is the column
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {
                  handleStartStop();
                },
                padding: EdgeInsets.all(0),
                child: Container(
                  height: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // this one is use for make the
                    border: Border.all(color: Color(0xff0395eb), width: 4),
                  ),
                  child: Text(
                    returnFormattedText(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              CupertinoButton(
                // this the cupertino button and here we perform all
                onPressed: () {
                  stopwatch.reset();
                },
                padding: EdgeInsets.all(0),
                child: Text(
                  "Reset",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
