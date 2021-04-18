import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'HomePage.dart';


void main() {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        "/": (context) => HomePage(),
        "/second": (context) => QuizScreen()
      }
    );
    }
  }


class QuizScreen extends StatefulWidget {
  QuizScreen();

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  CountDownController _controller = CountDownController();
  int _duration = 10;
  bool _check = false;
  bool _check1 = false;
  bool _check2 = false;
  bool _check3 = false;
  bool _check4 = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
      alignment: Alignment.center,
        color: Color.fromRGBO(202, 240, 248, 1),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[

                Container(
                  height: MediaQuery.of(context).size.height*0.35,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [Colors.greenAccent, Colors.blueAccent],
                          begin: const FractionalOffset(1.0, 1.0),
                          end: const FractionalOffset(0.2, 0.2),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp
                      ),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight:  Radius.circular(30))
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right:5, top: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(icon:Icon(Icons.arrow_back, size: 30,), onPressed: (){Navigator.pop(context);}),
                      Icon(Icons.settings, size: 30,)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.35-110, left: 25, right:25),
                  constraints: BoxConstraints.expand(height:220),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight:Radius.circular(15), topLeft: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight:  Radius.circular(15)),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Question",style: TextStyle(color:Colors.blueAccent,fontWeight: FontWeight.bold, fontSize: 15)),
                          Column(children:[Text(" 13 ",style: TextStyle(color:Colors.blueAccent,fontWeight: FontWeight.bold, fontSize: 20),), SizedBox(height:5)]),
                    Text("/ 20",style: TextStyle(color:Colors.blueAccent,fontWeight: FontWeight.bold, fontSize: 15),)]),
                      SizedBox(height: 20,),
                      Text("Which is the most populated country in the world?", style: TextStyle(color:Colors.black.withOpacity(0.6),fontSize: 20),textAlign: TextAlign.center,)],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 85),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularCountDownTimer(
                          // Countdown duration in Seconds.
                          duration: _duration,

                          // Countdown initial elapsed Duration in Seconds.
                          initialDuration: 0,

                          // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                          controller: _controller,

                          // Width of the Countdown Widget.
                          width: 70,

                          // Height of the Countdown Widget.
                          height: 70,

                          // Ring Color for Countdown Widget.
                          ringColor: Colors.grey[300],

                          // Ring Gradient for Countdown Widget.
                          ringGradient: null,

                          // Filling Color for Countdown Widget.
                          fillColor: Colors.blueAccent,

                          // Filling Gradient for Countdown Widget.
                          fillGradient: null,

                          // Background Color for Countdown Widget.
                          backgroundColor: Colors.white,

                          // Background Gradient for Countdown Widget.
                          backgroundGradient: null,

                          // Border Thickness of the Countdown Ring.
                          strokeWidth: 10.0,

                          // Begin and end contours with a flat edge and no extension.
                          strokeCap: StrokeCap.round,

                          // Text Style for Countdown Text.
                          textStyle: TextStyle(
                              fontSize: 27.0,
                              color: Color.fromRGBO(3, 4, 94, 1),
                              fontWeight: FontWeight.bold),

                          // Format for the Countdown Text.
                          textFormat: CountdownTextFormat.S,

                          // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                          isReverse: false,

                          // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                          isReverseAnimation: false,

                          // Handles visibility of the Countdown Text.
                          isTimerTextShown: true,

                          // Handles the timer start.
                          autoStart: true,

                          // This Callback will execute when the Countdown Starts.
                          onStart: () {
                            // Here, do whatever you want
                            print('Countdown Started');
                          },

                          // This Callback will execute when the Countdown Ends.
                          onComplete: () {
                            // Here, do whatever you want
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    )),
                ),
                Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.35-135),
                    padding: EdgeInsets.all(40),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text("04", style: TextStyle(color: Colors.greenAccent, fontSize: 15, fontWeight: FontWeight.bold),),
                            SizedBox(width: 7,),
                            Container(
                              constraints: BoxConstraints.expand(width: 40, height: 12),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.only(topRight:Radius.circular(15), topLeft: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight:  Radius.circular(15)),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              constraints: BoxConstraints.expand(width: 40, height: 12),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.only(topRight:Radius.circular(15), topLeft: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight:  Radius.circular(15)),
                              ),
                            ),SizedBox(width: 7,),Text("06", style: TextStyle(color: Colors.redAccent, fontSize: 15, fontWeight: FontWeight.bold),),
                          ]
                        )
                      ],
                    )
                ),

                //CODE REPETITION,PLEASE IGNORE
                Container(
                  margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.55,left: MediaQuery.of(context).size.width*0.5-175),
                  constraints: BoxConstraints.expand(width: 350, height: 300),
                  child: ListView(
                      padding: EdgeInsets.all(10),
                      children: <Widget>[
                        FlatButton(child:_check? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("China"),
                            _check1?Icon(Icons.check, color: Colors.green,):SizedBox()
                          ],
                        ): Text("China"), onPressed: (){
                          setState(() {
                            _check = true;
                            _check1 = true;
                            Timer(Duration(seconds: 1), (){
                              Navigator.pop(context);
                            _controller.pause();});
                          });
                        },
                          padding: EdgeInsets.all(15),
                            color:Colors.white,
                            shape: RoundedRectangleBorder(side: BorderSide(
                              width: 3,
                              color: _check ? Colors.green: Colors.grey.withOpacity(0.3),
                              style: BorderStyle.solid,
                            ),borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                            splashColor: Colors.greenAccent,),
                        SizedBox(height: 10,),
                        FlatButton(child: _check2?Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("India"),
                            _check2?Icon(Icons.close, color: Colors.red,):SizedBox(width: 0,)
                          ],
                        ):  Text("Inida"), onPressed: (){
                          setState(() {
                            _check = true;
                            _check2 = true;
                            Timer(Duration(seconds: 2), (){
                              Navigator.pop(context);
                              _controller.pause();});
                          });
                        },
                          padding: EdgeInsets.all(15),
                          color:Colors.white,
                          shape: RoundedRectangleBorder(side: BorderSide(
                            width: 3,
                            color: _check ? Colors.red: Colors.grey.withOpacity(0.3),
                            style: BorderStyle.solid,
                          ),borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                          splashColor: Colors.redAccent,),
                        SizedBox(height: 10,),
                        FlatButton(child: _check3?Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("USA"),
                            _check3?Icon(Icons.close, color: Colors.red,):SizedBox(width: 0,)
                          ],
                        ):  Text("USA"), onPressed: (){
                          setState(() {
                            _check = true;
                            _check3 = true;
                            Timer(Duration(seconds: 2), (){
                              Navigator.pop(context);
                              _controller.pause();});
                          });
                        },
                          padding: EdgeInsets.all(15),
                          color:Colors.white,
                          shape: RoundedRectangleBorder(side: BorderSide(
                            width: 3,
                            color: _check ? Colors.red: Colors.grey.withOpacity(0.3),
                            style: BorderStyle.solid,
                          ),borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                          splashColor: Colors.redAccent,),
                        SizedBox(height: 10,),
                        FlatButton(child:_check4?Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Text("Russia"),
                              _check4?Icon(Icons.close, color: Colors.red,):SizedBox(width: 0,)
                              ],
                              ):  Text("Russia"), onPressed: (){
                          setState(() {
                            _check = true;
                            _check4 = true;
                            Timer(Duration(seconds: 2), (){
                              Navigator.pop(context);
                              _controller.pause();});
                          });
                        },
                          padding: EdgeInsets.all(15),
                          color:Colors.white,
                          shape: RoundedRectangleBorder(side: BorderSide(
                            width: 3,
                            color: _check ? Colors.red: Colors.grey.withOpacity(0.3),
                            style: BorderStyle.solid,
                          ),borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                          splashColor: Colors.redAccent,),

                      ],
                  )
                )
              ]
                        ),
                    ],
                  ),
                )
        );

  }
 
}
