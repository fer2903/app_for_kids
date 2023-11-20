import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'Main_voc.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home: homePage(this.audioPlayer,this.audioCache),
    );
  }

}
class homePage extends StatefulWidget{
  homePage(this.audioPlayer,this.audioCache);
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  @override
  _myHomePageState createState() => new _myHomePageState(this.audioPlayer,this.audioCache);


}
class _myHomePageState extends State<homePage>{
  _myHomePageState(this.audioPlayer,this.audioCache);
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  List<Color> _colors = [Colors.deepOrangeAccent,Colors.green];
  List<double> _stops = [0.0,0.7];
  @override
  void initState() {
    super.initState();
    //audioPlayer = AudioPlayer();
   // audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.stop();
    audioCache.play("pregunta.mp3");
  }
  double buttonHigh = 150;
  double buttonWidth = 200;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
     resizeToAvoidBottomPadding : false,
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(title: Text("Welcome"
      ,style: TextStyle(
          fontFamily: 'Schyler',
          fontSize: 40.0,
          //fontWeight: FontWeight.bold
        ),
      ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),

      body: ListView(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(40.0),
              child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.only(top: 30.0)),
               Container(
               // padding: EdgeInsets.all(30.00),
                 decoration: BoxDecoration(gradient: LinearGradient(colors: _colors,
                 stops: _stops),
                   borderRadius: BorderRadius.all(Radius.circular(20.0))
                 ),
                width: 200,
                height: 150,
                child: new MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  child: Text("Vocales",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Schyler',
                    fontSize: 35.0,
                    //fontWeight: FontWeight.bold
                ),),
              color: Colors.blue,
              onPressed: () {
                audioPlayer.stop();
                audioCache.play("vocales.mp3");
                //audioPlayer.pause();
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Main_voc(audioPlayer,audioCache)));
              },
            ),
          ),
          new Padding(padding: EdgeInsets.only(top: 40.0)),
          new Container(
            decoration: BoxDecoration(gradient: LinearGradient(colors: _colors,
                stops: _stops),
                borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
           // padding: EdgeInsets.all(30.00),
            width: 200,
            height: 150,
            child: new MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  onPressed: () {
                audioPlayer.stop();
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
               child: Text("Salir",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                     fontFamily: 'Schyler',
                     fontSize: 45.0,
                     //fontWeight: FontWeight.bold
                 ),
                 ),
              color: Colors.blueGrey,
    ),
          ),
          ],
        ),
          ),
        ],

    ),

    );
  }
}
