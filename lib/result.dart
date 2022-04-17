// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  int weight;
  int height;
  int age;
  Result(
      {Key? key, required this.weight, required this.height, required this.age})
      : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String result = '';
  String condition = '';
  String interpretation = '';

  void calculateBMI(int height, int weight) {
    double resultBMI = weight / (height * height / 10000);
    String bmi = resultBMI.toStringAsFixed(2);
    String cond = '';
    String inter = '';

    if (resultBMI >= 30) {
      cond = 'Obesity';
      inter = 'You have too much fat in your body. Try to exercise more and reduce the meat.';
    } else if (resultBMI >= 25){
      cond = 'Overweight';
      inter = 'You have high fat ratio in your body. Try to exercise more.';
    } else if (resultBMI > 18.5) {
      cond = 'Normal';
      inter = 'You have normal fat ratio in your body. Good job!';
    } else {
      cond = 'Underweight';
      inter = 'You have too low fat ratio in your body. Try to eating more';
    }

    setState(() {
      result = bmi;
      condition = cond;
      interpretation = inter;
    });
  }

  @override
  void initState() {
    calculateBMI(widget.height, widget.weight);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.lightBlue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      condition,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                  Text(
                      result,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),
                  ),

                  Text(
                    interpretation,
                    style: TextStyle(
                      fontSize: 10,
                      color: CupertinoColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.lightBlueAccent,
              width: double.infinity,
              height: 60,
              child: Text(
                "CALCULATE AGAIN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
