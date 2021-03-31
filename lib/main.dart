import 'package:flutter/material.dart';

import 'calButton.dart';
import 'orangeCal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: CalApp(),//OCalApp() to use orange one
    );
  }
}

class CalApp extends StatefulWidget {
  CalApp({Key key}) : super(key: key);

  @override
  _CalAppState createState() => _CalAppState();
}

class _CalAppState extends State<CalApp> {
  String exp = '';
  num firstNum;
  String secondNum;
  String op = '';
  String hostory = '';

  int opCount = 0;

  void enternumber(String text) {
    setState(() {
      if (op != '') {
        secondNum += text;
      }
      exp += text;
    });
  }

  void enterop(String text) {
    setState(() {
      firstNum = num.parse(exp);
      op = text;
      secondNum = '';
      exp += text;
    });
  }

  void clearAll(String text) {
    setState(() {
      exp = '';
      hostory = '';
    });
  }

  void clear(String text) {
    setState(() {
      exp = '';
    });
  }

  void evaluate(String text) {
    setState(() {
      hostory = exp;
       var se=1;
      if(secondNum!=''){
        se= num.parse(secondNum);
      }
      
      switch (op) {
        case '+':
        if(firstNum is int && se is int ){
          exp = (firstNum + se).toString();
        }
        else{
          exp = (firstNum + se).toStringAsFixed(3);
        }
          
          break;
        case '-':
          if(firstNum is int && se is int ){
          exp = (firstNum - se).toString();
        }
        else{
          exp = (firstNum - se).toStringAsFixed(3);
        }
          break;
        case '×':
         if(firstNum is int && se is int ){
          exp = (firstNum * se).toString();
        }
        else{
          exp = (firstNum * se).toStringAsFixed(3);
        }
          break;
        case '÷':
          if(firstNum is int && se is int ){
          exp = (firstNum ~/ se).toString();
        }
        else{
          exp = (firstNum / se).toStringAsFixed(3);
        }
          break;

         case '%':
          if(firstNum is int && se is int ){
          exp = ((firstNum * se)/100).toString();
        }
        else{
          exp = (firstNum / se).toStringAsFixed(3);
        }
          break;
      }
    });
  }
    
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            backgroundColor: Colors.black38,
            title: Text('Calaulater'),
          ),
          body: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20,0,20,0),
                      child: Text(
                        hostory,
                        style: TextStyle(fontSize: 30, color: Colors.white70),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20,0,20,50),
                      child: Text(
                        exp,
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalButton(
                          text: "AC",
                          textColor: Colors.white,
                          btnColor: Colors.black87,
                          onpress: clearAll,
                          
                        ),
                        CalButton(
                          text: "C",
                          textColor: Colors.white,
                          btnColor: Colors.black87,
                          onpress: clear,
                        ),
                        CalButton(
                          text: "%",
                          textColor: Colors.blueGrey,
                          btnColor: Colors.white,
                          onpress: enterop,
                        ),
                        CalButton(
                          text: "÷",
                          textColor: Colors.blueGrey,
                          btnColor: Colors.white,
                          onpress: enterop,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalButton(
                          text: "7",
                          textColor: Colors.white,
                          onpress: enternumber,
                        ),
                        CalButton(
                          text: "8",
                          textColor: Colors.white,
                          onpress: enternumber,
                        ),
                        CalButton(
                          text: "9",
                          textColor: Colors.white,
                          onpress: enternumber,
                        ),
                        CalButton(
                          text: "×",
                          textColor: Colors.blueGrey,
                          btnColor: Colors.white,
                          onpress: enterop,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalButton(
                          text: "4",
                          textColor: Colors.white,
                          onpress: enternumber,
                        ),
                        CalButton(
                          text: "5",
                          textColor: Colors.white,
                          onpress: enternumber,
                        ),
                        CalButton(
                          text: "6",
                          textColor: Colors.white,
                          onpress: enternumber,
                        ),
                        CalButton(
                          text: "-",
                          textColor: Colors.blueGrey,
                          btnColor: Colors.white,
                          onpress: enterop,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalButton(
                          text: "1",
                          textColor: Colors.white,
                          onpress: enternumber,
                        ),
                        CalButton(
                          text: "2",
                          textColor: Colors.white,
                          onpress: enternumber,
                        ),
                        CalButton(
                          text: "3",
                          textColor: Colors.white,
                          onpress: enternumber,
                        ),
                        CalButton(
                          text: "+",
                          textColor: Colors.blueGrey,
                          btnColor: Colors.white,
                          onpress: enterop,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalButton(
                          text: ".",
                          textColor: Colors.white,
                          onpress: enternumber,
                        ),
                        CalButton(
                          text: "0",
                          textColor: Colors.white,
                          onpress: enternumber,
                        ),
                        CalButton(
                          text: "00",
                          textColor: Colors.white,
                          onpress: enternumber,
                        ),
                        CalButton(
                          text: "=",
                          textColor: Colors.blueGrey,
                          btnColor: Colors.white,
                          onpress: evaluate,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
/* var data = "";

class L2 extends StatelessWidget {
  const L2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.yellow,
            child: Center(
                child: Text(data,
                    style: TextStyle(color: Colors.white, fontSize: 50))),
          ),
          flex: 3,
        ),
        Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      /* for (var i = 1; i < 4; i++)
                  Btn(text: i.toString(),) */
                      Btn(text: "1"),
                      Btn(text: "2"),
                      Btn(text: "3"),
                      Btn(text: "+"),
                    ],
                  ),
                  /* Row(
                      children: [for (var i = 0; i < 4; i++) Btn()],
                    ), */
                ],
              ),
            ),
            flex: 5)
      ],
    );
  }
}

class Btn extends StatefulWidget {
  final String text;

  const Btn({Key key, this.text}) : super(key: key);

  @override
  _BtnState createState() => _BtnState(this.text);
}

class _BtnState extends State<Btn> {
  final String text;

  _BtnState(this.text);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          data += "1";
        });
      },
      child: Text(
        "1",
        style: TextStyle(color: Colors.white, fontSize: 50),
      ),
      shape: new CircleBorder(),
      color: Colors.orange,
    );
  }
}
 */