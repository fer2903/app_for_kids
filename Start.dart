import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'main.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.cyan,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
      ),
      home: start(),
    );
  }

}
class start extends StatefulWidget{
  String text;

  @override
  _myHomePageState createState() => new _myHomePageState();


}
class _myHomePageState extends State<start>{
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  List<Color> _colors = [Colors.black54,Colors.black54];
  List<double> _stops = [0.0,0.7];
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioCache.play("bienvenida.mp3");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(title: Text("LEARNING TDA",
      style: TextStyle(
        fontSize: 35,

      ),),
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
                new Padding(padding: EdgeInsets.only(top: 50.0)),
                new Image.asset("assets/Mark.gif",
                  height: 200,
                  width: 200,
                ),
                new Padding(padding: EdgeInsets.only(top: 150.0)),
                new Row(
                  mainAxisAlignment:   MainAxisAlignment.center,
                  children: <Widget>[


                    new Container(
                      decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.pinkAccent,Colors.pinkAccent],
                          stops: _stops),
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
                      // padding: EdgeInsets.all(30.00),
                      width: 150,
                      height: 100,
                      child: new MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),

                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => homePage(this.audioPlayer,this.audioCache)));

                        },
                        child: Text("START",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35
                          ),
                        ),
                        color: Colors.cyan,

                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
