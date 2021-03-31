import 'package:flutter/material.dart';

import 'calButtonO.dart';

var btnCol = Colors.orange;

class OCalApp extends StatefulWidget {
  OCalApp({Key key}) : super(key: key);

  @override
  _OCalAppState createState() => _OCalAppState();
}

class _OCalAppState extends State<OCalApp> {
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
      var se = num.parse(secondNum);
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
        case '*':
         if(firstNum is int && se is int ){
          exp = (firstNum * se).toString();
        }
        else{
          exp = (firstNum * se).toStringAsFixed(3);
        }
          break;
        case '/':
          if(firstNum is int && se is int ){
          exp = (firstNum ~/ se).toString();
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Calaulater'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        hostory,
                        style: TextStyle(fontSize: 30, color: Colors.black38),
                      ),
                    ),

                    Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 50),
                  child: Text(
                    exp,
                    style: TextStyle(fontSize: 50, color: Colors.black),
                  ),
                ),
                  ],
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalButton(
                    text: "1",
                    textColor: Colors.white,
                    btnColor: btnCol,
                    onpress: enternumber,
                  ),
                  CalButton(
                    text: "2",
                    textColor: Colors.white,
                    btnColor: btnCol,
                    onpress: enternumber,
                  ),
                  CalButton(
                    text: "3",
                    textColor: Colors.white,
                    btnColor: btnCol,
                    onpress: enternumber,
                  ),
                  CalButton(
                    text: "+",
                    textColor: Colors.white,
                    btnColor: btnCol,
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
                    btnColor: btnCol,
                    onpress: enternumber,
                  ),
                  CalButton(
                    text: "5",
                    textColor: Colors.white,
                    btnColor: btnCol,
                    onpress: enternumber,
                  ),
                  CalButton(
                    text: "6",
                    textColor: Colors.white,
                    btnColor: btnCol,
                    onpress: enternumber,
                  ),
                  CalButton(
                    text: "-",
                    textColor: Colors.white,
                    btnColor: btnCol,
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
                    btnColor: btnCol,
                    onpress: enternumber,
                  ),
                  CalButton(
                    text: "8",
                    textColor: Colors.white,
                    btnColor: btnCol,
                    onpress: enternumber,
                  ),
                  CalButton(
                    text: "9",
                    textColor: Colors.white,
                    btnColor: btnCol,
                    onpress: enternumber,
                  ),
                  CalButton(
                    text: "*",
                    textColor: Colors.white,
                    btnColor: btnCol,
                    onpress: enterop,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalButton(
                    text: "C",
                    textColor: Colors.white,
                    btnColor: btnCol,
                    onpress: clearAll,
                  ),
                  CalButton(
                    text: "0",
                    textColor: Colors.white,
                    btnColor: btnCol,
                    onpress: enternumber,
                  ),
                  CalButton(
                    text: "=",
                    textColor: Colors.white,
                    btnColor: btnCol,
                    onpress: evaluate,
                  ),
                  CalButton(
                    text: "/",
                    textColor: Colors.white,
                    btnColor: btnCol,
                    onpress: enterop,
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
