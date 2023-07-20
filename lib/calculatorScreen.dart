import 'dart:math';

import 'package:calculator/CalculatorButton.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName = 'calculator';

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resTextView='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(child: Container(
            alignment: Alignment.centerLeft,
            child: Text('$resTextView',style: TextStyle(
              fontSize: 36,
            ),),
          )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton('Sqr',onOperatorClick),
                CalculatorButton('Power',onOperatorClick),
                CalculatorButton('<-',onCalculatorDigitClick),
                CalculatorButton('Clr',onClrClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton('7',onCalculatorDigitClick),
                CalculatorButton('8',onCalculatorDigitClick),
                CalculatorButton('9',onCalculatorDigitClick),
                CalculatorButton('/',onOperatorClick),
                ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton('4',onCalculatorDigitClick),
                CalculatorButton('5',onCalculatorDigitClick),
                CalculatorButton('6',onCalculatorDigitClick),
                CalculatorButton('*',onOperatorClick),
                ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton('1',onCalculatorDigitClick),
                CalculatorButton('2',onCalculatorDigitClick),
                CalculatorButton('3',onCalculatorDigitClick),
                CalculatorButton('-',onOperatorClick),
                ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton('.', onCalculatorDigitClick),
                CalculatorButton('0', onCalculatorDigitClick),
                CalculatorButton('=', onEqualClick),
                CalculatorButton('+', onOperatorClick),
                ],
            ),
          ),
        ],
      ),
    );
  }
  void onDotClick(String digitText){
    if(resTextView.contains('.') && digitText == '.'){
      return;
    }
    setState(() {});
  }

  void onClrClick(String _){
    savedOperator = '';
    savedResult = '';
    resTextView = '';
    setState(() {});
  }

  void onEqualClick(String _){
    String rhs = resTextView;
    savedResult= calculate(savedResult, savedOperator, rhs);
    resTextView = savedResult;
    savedOperator = '';
    savedResult = '';
    setState(() {});
  }

  String savedOperator = '';
  String savedResult = '';
  void onOperatorClick(String operatorText){
    if(savedOperator.isEmpty){
      savedResult = resTextView;
    }else{
      String rhs = resTextView;
      savedResult= calculate(savedResult, savedOperator, rhs);
    }
    savedOperator = operatorText;
    resTextView= '';
    setState(() {});
  }
  String calculate(String lhs, String operator, String rhs){
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    double? res =0;
    if(operator=='+'){
      res = n1+n2;
    }else if(operator=='-'){
      res = n1-n2;
    }else if(operator=='*'){
      res = n1*n2;
    }else if(operator=='/'){
      res = n1/n2;
    }else if(operator=='Power'){
      res = pow(n1, n2) as double?;
    }
    return res.toString();
  }
  void onCalculatorDigitClick(String digitText){
    print('Dn $digitText');
    setState(() {
      resTextView += digitText;
    });

  }
}
