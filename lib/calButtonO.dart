import 'package:flutter/material.dart';

class CalButton extends StatelessWidget {
  final text;
  final textColor;
  final btnColor;
  final Function onpress;

  const CalButton({Key key, this.text,this.textColor,this.btnColor,this.onpress}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(5) ,
      child: FlatButton(
        onPressed: (){
          onpress(text);
        },
        color: btnColor ?? null,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(text,style: TextStyle(color: textColor,
          fontSize: 30),),
        ),
        shape: new CircleBorder()),
    );
  }
}