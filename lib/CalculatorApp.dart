import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  static const Color topSection = Color(0xFF050f15);
  static const Color bottomSection = Color(0xFF0a1d29);

  double firstNum = 0.00;
  double secondNum = 0.00;
  var input = "";
  var output = "";
  var operator = "";

  onButtonClick(value){
    if(value == "C"){
      input = "";
      output = "";
    }
    else if(value == "="){
      var userInput = input;
      userInput = input.replaceAll("X", "*");
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
    }
    else{
      input = input + value;
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bottomSection,
      appBar: AppBar(
        backgroundColor: topSection,
        title: Text("Calculator", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),),
        centerTitle: true,
        elevation: 0,
      ),


      ///Result & Input Area
      body: Column(
        children: [
          Expanded(
              child: Container(
                width: double.infinity,
                color: topSection,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                   Text(input, style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),),
                   SizedBox(height: 150,),
                   Text(output, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
                    SizedBox(height: 20,),
                  ],
                ),
              )
          ),

          ///Button Area

          Row(
            children: [
              button(text: "C"),
              button(text: "("),
              button(text: ")"),
              button(text: "/"),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "X"),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "-"),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(text: "+"),
            ],
          ),
          Row(
            children: [
              button(text: "0"),
              button(text: "%"),
              button(text: "."),
              button(text: "=", buttonBackgroundColor: Color(0xFF15445b)),
            ],
          ),
        ],
      )
    );
  }

  ///Button Widget

  Widget button({text, buttonBackgroundColor}){
    return Expanded(
        child: GestureDetector(
          onTap: ()=> onButtonClick(text),
          child: Container(
            color: buttonBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
              child: Center(
                  child: Text(text, style: TextStyle(fontSize:28, fontWeight:FontWeight.w700 ,color: Colors.white,),)
              ),
            ),
          ),
        )
    );
  }
}
