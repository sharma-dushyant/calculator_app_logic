// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator App",
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int firstnum;
  late int secondnum;
  String textToDisplay = " ";
  late String res;
  late String operatortoperform;

  void buttonclicked(String buttonValue) {
    if (buttonValue == "c") {
      textToDisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    } else if (buttonValue == "+" ||
        buttonValue == "-" ||
        buttonValue == "x" ||
        buttonValue == "/") {
      firstnum = int.parse(textToDisplay);
      res = "";
      operatortoperform = buttonValue;
    } else if (buttonValue == "=") {
      secondnum = int.parse(textToDisplay);
      if (operatortoperform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operatortoperform == "-") {
        res = (firstnum + secondnum).toString();
      }
      if (operatortoperform == "x") {
        res = (firstnum + secondnum).toString();
      }
      if (operatortoperform == "/") {
        res = (firstnum + secondnum).toString();
      }
    } else {
      res = int.parse(textToDisplay + buttonValue).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  Widget custombutton(String buttonValue) {
    return Expanded(
        child: OutlineButton(
      padding: const EdgeInsets.all(25),
      onPressed: () => buttonclicked(buttonValue),
      child: Text(
        " $buttonValue",
        style: const TextStyle(fontSize: 25),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(25),
              alignment: Alignment.bottomRight,
              child: Text(
                " $textToDisplay",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            )),
            Row(
              children: [
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            Row(
              children: [
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: [
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("x"),
              ],
            ),
            Row(
              children: [
                custombutton("c"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
