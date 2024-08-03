//hello everyone this is me sapna a junior flutter developer and this is a simple calculator app that i build as an interneee (task 1) for prodigy info tech .


import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = "0";
  String _result = "0";
  String _expression = "";
  String _operation = "";
  double _num1 = 0;
  double _num2 = 0;

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      _result = "0";
      _expression = "";
      _num1 = 0;
      _num2 = 0;
      _operation = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
      _num1 = double.parse(_output);
      _operation = buttonText;
      _result = "";
      _expression = _num1.toString() + " " + buttonText + " ";
    } else if (buttonText == ".") {
      if (_result.contains(".")) {
        return;
      } else {
        _result = _result + buttonText;
      }
    } else if (buttonText == "=") {
      _num2 = double.parse(_output);

      switch (_operation) {
        case "+":
          _result = (_num1 + _num2).toString();
          break;
        case "-":
          _result = (_num1 - _num2).toString();
          break;
        case "*":
          _result = (_num1 * _num2).toString();
          break;
        case "/":
          _result = (_num1 / _num2).toString();
          break;
      }

      _expression = _expression + _num2.toString() + " = " + _result;
      _operation = "";
    } else {
      if (_result == "0") {
        _result = buttonText;
      } else {
        _result = _result + buttonText;
      }
      _expression = _expression ;
    }

    setState(() {
      double parsedResult = double.parse(_result);
      _output = parsedResult == parsedResult.roundToDouble()
          ? parsedResult.toStringAsFixed(0)
          : parsedResult.toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.width / 4, // Set height equal to the width divided by 4 to make the buttons square
        margin:const EdgeInsets.all(6.0), // Adding margin for spacing between buttons
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.deepPurple[100], // Light violet background color
            side: BorderSide(color: Colors.deepPurple[900]!), // Dark violet border color
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple[900], // Dark violet text color
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(
          child: Text(
            'Calculator',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.deepPurple, // Violet background color
      ),
      body: Container(
        color: Colors.white, // White background color
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding:const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _expression,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    _output,
                    style:const  TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Black color for the output
                    ),
                  ),
                ],
              ),
            ),
           const  Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("*"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("C"),
                    buildButton("="),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
