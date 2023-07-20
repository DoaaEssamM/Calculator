import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  String text;
  Function onClickCallBack;
  CalculatorButton(this.text, this.onClickCallBack);
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      margin: EdgeInsets.all(1),
      child: ElevatedButton(onPressed: () {
        onClickCallBack(text);
      },
        child: Text('$text', style: const TextStyle(fontSize: 32)
      ),),
    ));
  }
}
