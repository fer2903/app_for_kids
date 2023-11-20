import 'package:flutter/material.dart';
import 'Main_voc.dart';
import 'voc.dart';
import 'voc_U.dart';
import 'Voc_O.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
void main() => runApp(MyAppss());
class MyAppss extends StatelessWidget{
  MyAppss({this.audioPlayer,this.audioCache});
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Schyler',
        brightness: Brightness.light,
        primarySwatch: Colors.cyan,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Schyler',
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
      ),
      home: minus(this.audioPlayer,this.audioCache),
    );
  }

}
class minus extends StatefulWidget{
  minus(this.audioPlayer,this.audioCache);
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  @override
  minusState createState() => new minusState(this.audioPlayer,this.audioCache);


}
class minusState extends State<minus>{
  minusState(this.audioPlayer,this.audioCache);
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  List<Color> _colors = [Colors.deepOrangeAccent,Colors.green];
  List<double> _stops = [0.7,0.0];
  @override
  void initState() {
    super.initState();
    audioPlayer.stop();
    audioCache.play("minusculas.mp3");
  }
  double buttonHigh = 50;
  double buttonWidth = 100;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(title: Text("minusculas",
      style: TextStyle(fontFamily: 'Schyler',
        fontSize: 40.0,),),
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
      new Container(
      padding: EdgeInsets.all(40.0),
      child: new Column(
        children: <Widget>[
          new Padding(padding: EdgeInsets.only(top: 30.0)),
          new Container(
              decoration: BoxDecoration(gradient: LinearGradient(colors: _colors,
                  stops: _stops),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
              width: 200,
              height: 150,
              child: new MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => multi("a",this.audioPlayer,this.audioCache)));
                },
                child: Text("a",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    //fontFamily: 'Schyler',
                    fontSize: 100.0,
                  ),),
                color: Colors.blue,
              )
          ),
          new Padding(padding: EdgeInsets.only(top: 30.0)),
          new Container(
              decoration: BoxDecoration(gradient: LinearGradient(colors: _colors,
                  stops: _stops),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
              width: 200,
              height: 150,
              child: new MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => multi("e",this.audioPlayer,this.audioCache)));
                },
                child: Text("e",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    //fontFamily: 'Schyler',
                    fontSize: 100.0,
                  ),),
                color: Colors.blue,
              )
          ),
          new Padding(padding: EdgeInsets.only(top: 30.0)),
          new Container(
              decoration: BoxDecoration(gradient: LinearGradient(colors: _colors,
                  stops: _stops),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
              width: 200,
              height: 150,
              child: new MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => multi("i",this.audioPlayer,this.audioCache)));
                },
                child: Text("i",textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 100.0,
                  ),),
                color: Colors.blue,
              )
          ),
          new Padding(padding: EdgeInsets.only(top: 30.0)),
          new Container(
              decoration: BoxDecoration(gradient: LinearGradient(colors: _colors,
                  stops: _stops),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
              width: 200,
              height: 150,
              child: new MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ooo("o",this.audioPlayer,this.audioCache)));
                },
                child: Text("o",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 100.0,
                  ),),
                color: Colors.blue,
              )
          ),
          new Padding(padding: EdgeInsets.only(top: 30.0)),
          new Container(
              decoration: BoxDecoration(gradient: LinearGradient(colors: _colors,
                  stops: _stops),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
              width: 200,
              height: 150,
              child: new MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => uuu("u",this.audioPlayer,this.audioCache)));
                },
                child: Text("u",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 100.0,
                  ),),
                color: Colors.blue,
              )
          ),
          new Padding(padding: EdgeInsets.only(top: 30.0)),
          new Container(
              decoration: BoxDecoration(gradient: LinearGradient(colors: _colors,
                  stops: _stops),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
              width: 200,
              height: 150,
              child: new MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                onPressed: (){
                  audioPlayer.stop();
                  audioCache.play("temas.mp3");
                  Navigator.pop(context, MaterialPageRoute(
                     builder: (context) => Main_voc(this.audioPlayer,this.audioCache)));
                },
                child: Text("Regresar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Schyler',
                    fontSize: 40.0,
                  ),),
                color: Colors.blueGrey,
              )
          ),

        ],
      ),
      ),
        ],
      ),

    );
  }
}
