import 'package:calculator/calculatorScreen.dart';
import 'package:flutter/material.dart';

void main(){
runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        CalculatorScreen.routeName : (_)=> CalculatorScreen(),
      },
      initialRoute: CalculatorScreen.routeName,
    );
  }
}
