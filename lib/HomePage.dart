import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ap/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _play = false;

  
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
                height: MediaQuery.of(context).size.height*0.5,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(50),
                decoration: BoxDecoration(
                gradient: new LinearGradient(
                colors: [Colors.greenAccent, Colors.blueAccent],
                begin: const FractionalOffset(1.0, 1.0),
                end: const FractionalOffset(0.2, 0.1),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight:  Radius.circular(30))
                ),
                ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.25-125),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.3)
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.25-100),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.5)
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.25-87.5),
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.5)
                  ),
                  child: Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Your Score:", style: TextStyle(color: Colors.blueAccent),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("150", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27, color: Colors.blueAccent),),
                          Text("pt", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blueAccent),),
                        ],
                      )],)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.5-75, left: 25, right:25),
                  constraints: BoxConstraints.expand(height:150),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight:Radius.circular(15), topLeft: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight:  Radius.circular(15)),
                  ),
              child: Center(
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: MediaQuery.of(context).size.width*0.08,
                  runSpacing: MediaQuery.of(context).size.width*0.01,
                  children: [
                  view("100%", "Completion", Colors.blueAccent),
                    view("20", "Total Questions", Colors.blueAccent),
                    view("13", "Correct", Colors.greenAccent),
                    view("07", "Wrong", Colors.redAccent),
                  ],),
              ),),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.68),
                constraints: BoxConstraints.expand(height: 200, width: MediaQuery.of(context).size.width),
                child: Center(
                  child: Wrap(
                    spacing: MediaQuery.of(context).size.width*0.03,
                    runSpacing: MediaQuery.of(context).size.width*0.05,
                    children: [InkWell(onTap: (){
                      print("Pressed");
                      Navigator.pushNamed(context, "/second");
                      setState(() {
                        _play = true;
                      });
                    },
                    child: Tile((_play? Icon(Icons.cached, size: 30, color: Colors.white): Icon(Icons.play_arrow, size: 30, color: Colors.white)), (_play? "Retry":"Play"), Color.fromRGBO(42, 157, 143, 1)),
                    ),InkWell(onTap: (){
                    },
                      child: Tile(Icon(Icons.visibility, size: 30, color: Colors.white), "Review Answers", Color.fromRGBO(244, 162, 97, 1)),
                    ),InkWell(onTap: null,
                      child: Tile(Icon(Icons.share, size: 30, color: Colors.white), "Share Score", Color.fromRGBO(181, 23, 158, 1)),
                    ),InkWell(onTap: null,
                      child: Tile(Icon(Icons.picture_as_pdf, size: 30, color: Colors.white), "Generate PDF", Color.fromRGBO(76, 201, 240, 1)),
                    ),InkWell(onTap: null,
                      child: Tile(Icon(Icons.home, size: 30, color: Colors.white), "Home", Color.fromRGBO(247, 37, 133, 1)),
                    ),InkWell(onTap: null,
                      child: Tile(Icon(Icons.stars, size: 30, color: Colors.white), "LeadBoards", Color.fromRGBO(109, 104, 117, 1)),
                    )],
                  ),
                ),
              ),
              IconButton(padding:EdgeInsets.only(top:MediaQuery.of(context).padding.top+10),icon: Icon(Icons.arrow_back), onPressed: null, iconSize: 30,)
    ]),]
    )
    )
    );
  }
}

Widget Tile(Icon icon, String label, Color color){
  return Container(
    constraints: BoxConstraints.expand(width: 110, height: 80),
    child: Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color
          ),
          child: icon,
        ),
        SizedBox(height: 5,),Text(label, style: TextStyle(fontSize: 15, color: Colors.black87))
      ],
    ),
  );
}

Widget view(String number, String text, Color color){
  return Container(
    width: 120,
      height: 60,
      child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lens, size: 9,color: color,),
            SizedBox(height: 14,)
          ],
        ),
        SizedBox(width: 6,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

            Text(number, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: color),),
          Text(text)],
            ),
        ],
  ),
  );
}
