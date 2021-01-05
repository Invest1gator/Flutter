/*
 * Copyright (c) 2020. Serkan Koçoğlu.
 */
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

//TAVUK ÜCRETİ 30 , YUMURTA ÜCRETİ 1 , İLK BAKİYE 1000

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Çiftlik Bank Chapter 1: Tosunun kaçışı'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  int value;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int tavuk = 3;
  int bakiye = 1000;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                //                   <--- left side
                color: (Colors.blue),
                width: 15.0,
              ),
              top: BorderSide(
                //                    <--- top side
                color: (Colors.blue[700]),
                width: 15.0,
              ),
              right: BorderSide(
                //                    <--- top side
                color: (Colors.blue[500]),
                width: 15.0,
              ),
              bottom: BorderSide(
                //                    <--- top side
                color: (Colors.blue[700]),
                width: 15.0,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Yumurta sayısı: $_counter",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              buttons(),
              chickenBtn(),
              Account(),
              image(),
            ],
          ),
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  Widget buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
            child: Text(
              'Hasat Yap',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            color: Colors.blue,
            elevation: 4.0,
            splashColor: Colors.yellow,
            onPressed: () {
              _incrementCounter();
            }),
        RaisedButton(
            child: Text(
              "Yumurta Sat  x10",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            color: Colors.blue,
            elevation: 4.0,
            splashColor: Colors.yellow,
            onPressed: () {
              _decrementCounter();
            }),
      ],
    );
  }

  Widget chickenBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.red],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          padding: const EdgeInsets.all(5.0),
          width: 150,
          height: 35,
          alignment: Alignment.center,
          child: Text(
            'Tavuk Adedi: ${tavuk}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        increment_decrement()
      ],
    );
  }

  Widget increment_decrement() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RaisedButton(
            child: Text(
              '+',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            color: Colors.blue,
            elevation: 4.0,
            splashColor: Colors.yellow,
            onPressed: () {
              _tavukAl();
            }),
        RaisedButton(
            child: Text(
              '-',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            color: Colors.redAccent,
            elevation: 10.0,
            splashColor: Colors.yellow,
            onPressed: () {
              _tavukSat();
            }),
      ],
    );
  }

  Widget Account() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 0.0, right: 00.0, top: 100),
          width: 150,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            'Bakiye : ${bakiye} \$',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.red], //renk geçişi
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }

  Widget image() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(180.0)),
            color: Colors.redAccent,
          ),
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
          child: CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                'https://im.haberturk.com/2018/07/17/ver1531824447/2062501_981ddc14630425bef370c76bb3cfef54.jpg',
              )),
        ),
      ],
    );
  }

  void _tavukSat() {
    if (tavuk >= 1) {
      setState(() {
        bakiye = bakiye + 30;
        tavuk--;
      });
    }
  }
  void _tavukAl() {
    if (bakiye >= 30) {
      setState(() {
        bakiye = bakiye - 30;
        tavuk++;
      });
    }
  }
  void _incrementCounter() {
    //hasat yap
    setState(() {
      _counter = _counter + tavuk;
    });
  }
  void _decrementCounter() {
    //yumurta sat
    if (_counter >= 10) {
      setState(() {
        _counter = _counter - 10;
        bakiye = bakiye + 10;
      });
    }
  }
  void hesap() {
    setState(() {
      bakiye = bakiye + _counter;
    });
  }
}
