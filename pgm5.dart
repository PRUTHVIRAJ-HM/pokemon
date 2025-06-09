import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  String output = '0';
  String currentInput = '';
  double num1 = 0;
  String operator = '';
  void handleButtonClick(String value) {
    setState(() {
      if (value == 'C') {
        output = '0';
        currentInput = '';
        num1 = 0;
        operator = '';
      } else if (['+', '-', '×', '÷'].contains(value)) {
        output = value;
        num1 = double.tryParse(currentInput) ?? 0;
        operator = value;
        currentInput = '';
      } else if (value == '=') {
        double num2 = double.tryParse(currentInput) ?? 0;
        switch (operator) {
          case '+':
            output = (num1 + num2).toString();
            break;
          case '-':
            output = (num1 - num2).toString();
            break;
          case '×':
            output = (num1 * num2).toString();
            break;
          case '÷':
            output = num2 != 0 ? (num1 / num2).toString() : 'Error';
            break;
        }
        currentInput = output;
        operator = '';
      } else {
        currentInput += value;
        output = currentInput;
      }
    });
  }

  Widget buildButton(String value) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => handleButtonClick(value),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          value,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(16),
              child: Text(
                output,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('÷'),
            ],
          ),
          Row(
            children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('×'),
            ],
          ),
          Row(
            children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          Row(
            children: [
              buildButton('C'),
              buildButton('0'),
              buildButton('='),
              buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }
}
