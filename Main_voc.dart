import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'Mayusculas_voc.dart';
import 'minusculas_voc.dart';
import 'acento_voc.dart';
import 'Mayusc_voc_acent.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
void main() => runApp(Main_vocs());
class Main_vocs extends StatelessWidget{
  Main_vocs({this.audioPlayer,this.audioCache});
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
      home: Main_voc(this.audioPlayer,this.audioCache),
    );
  }

}
class Main_voc extends StatefulWidget{
  Main_voc(this.audioPlayer,this.audioCache);
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  @override
  Main_vocales createState() => new Main_vocales(this.audioPlayer,this.audioCache);


}
class Main_vocales extends State<Main_voc>{
  Main_vocales(this.audioPlayer,this.audioCache);
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  List<Color> _colors = [Colors.deepOrangeAccent,Colors.green];
  List<double> _stops = [5.0,0.7];
  @override
  void initState() {
    super.initState();
    //audioPlayer = AudioPlayer();
    //audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.stop();
   // audioPlayer.pause();
    audioCache.play("temas.mp3");
  }
  double buttonHigh = 50;
  double buttonWidth = 100;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(title: Text("Aprendamos Vocales",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 35.0,
           // fontWeight: FontWeight.bold
        ),),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
           Container(
      padding: EdgeInsets.all(40.0),
        child: new Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(top: 30.0)),
          new Container(
              decoration: BoxDecoration(gradient: LinearGradient(colors: _colors,
                  stops: _stops),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
              //padding: EdgeInsets.all(30.00),
              width: 200,
              height: 150,
              child: new MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Mayus(this.audioPlayer,this.audioCache)));
                },
                child: Text("1.-MAYUSCULAS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Schyler',
                      fontSize: 30.0,
                      //fontWeight: FontWeight.bold
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
              //padding: EdgeInsets.all(30.00),
              width: 200,
              height: 150,
              child: new MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => minus(this.audioPlayer,this.audioCache)));
                },
                  child: Text("2.-minusculas",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Schyler',
                        fontSize: 30.0,
                        //fontWeight: FontWeight.bold
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
             // padding: EdgeInsets.all(30.00),
              width: 200,
              height: 150,
              child: new MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => acentMin(this.audioPlayer,this.audioCache)));
                },
                child: Text("3.-MAYUSCULA con Acentos",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Schyler',
                      fontSize: 30.0,
                      //fontWeight: FontWeight.bold
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
             // padding: EdgeInsets.all(30.00),
              width: 200,
              height: 150,
              child: new MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => acent(this.audioPlayer,this.audioCache)));
                },
                child: Text("4.-minuscula con Acentos",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Schyler',
                      fontSize: 30.0,
                     // fontWeight: FontWeight.bold
                  ),
                ),
                color: Colors.blue,
              )
          ),
              new Padding(padding: EdgeInsets.only(top: 30.0)),
          new Container(
              decoration: BoxDecoration(gradient: LinearGradient(colors: _colors,
                  stops: _stops),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
              //padding: EdgeInsets.all(30.00),
              width: 200,
              height: 150,
              child: new MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                onPressed: (){
                  audioPlayer.pause();
                 // audioPlayer.play("pregunta.mp3");
                  audioCache.play("pregunta.mp3");
                  Navigator.pop(context, MaterialPageRoute(
                      builder: (context) => homePage(this.audioPlayer,this.audioCache)));
                },
                child: Text("Regresar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Schyler',
                      fontSize: 35.0,
                    //  fontWeight: FontWeight.bold
                  ),
                ),
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
