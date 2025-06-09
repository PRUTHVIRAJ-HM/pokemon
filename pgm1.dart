import 'package:flutter/material.dart'; 
 
void main() { 
  runApp(MyApp()); 
} 
 
class MyApp extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      debugShowCheckedModeBanner: false, 
      home: Scaffold( 
        appBar: AppBar(title: Text('Flutter App')), 
        body: Center( 
          child: Text( 
            'Hello world and Hello Flutter', 
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), 
          ), 
        ), 
      ), 
    ); 
  } 
}