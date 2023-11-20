import 'package:flutter/material.dart';
import 'Main_voc.dart';
import 'voc_Macent.dart';
import 'voc_U.dart';
import 'Voc_O.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  MyApp({this.audioPlayer,this.audioCache});
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
      home: acentMin(this.audioPlayer,this.audioCache),
    );
  }

}
class acentMin extends StatefulWidget{
  acentMin(this.audioPlayer,this.audioCache);
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  @override
  acentState createState() => new acentState(this.audioPlayer,this.audioCache);


}
class acentState extends State<acentMin>{
  acentState(this.audioPlayer,this.audioCache);
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  List<Color> _colors = [Colors.deepOrangeAccent,Colors.green];
  List<double> _stops = [0.7,0.0];
  @override
  void initState() {
    super.initState();
    audioPlayer.stop();
    audioCache.play("mayusc_acento.mp3");
  }
  double buttonHigh = 50;
  double buttonWidth = 100;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(title: Text("M-Acentos",
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
                      builder: (context) => multiMacent("Á",this.audioPlayer,this.audioCache)));
                },
                child: Text("Á",textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Schyler',
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
                      builder: (context) => multiMacent("É",this.audioPlayer,this.audioCache)));
                },
                child: Text("É",textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Schyler',
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
                      builder: (context) => multiMacent("Í",this.audioPlayer,this.audioCache)));
                },
                child: Text("Í",textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Schyler',
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
                      builder: (context) => ooo("Ó",this.audioPlayer,this.audioCache)));
                },
                child: Text("Ó",textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Schyler',
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
                      builder: (context) => uuu("Ú",this.audioPlayer,this.audioCache)));
                },
                child: Text("Ú",textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Schyler',
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
                child: Text("Regresar",textAlign: TextAlign.center,
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
