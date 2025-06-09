import 'package:flutter/material.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CounterHomePage extends StatefulWidget {
  @override
  _CounterHomePageState createState() => _CounterHomePageState();
}

class _CounterHomePageState extends State<CounterHomePage> {
  int _counter = 0;
  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Counter App'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter Value', style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _decrement, child: Text('Decrement')),
                SizedBox(width: 20),
                ElevatedButton(onPressed: _increment, child: Text('Increment')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
