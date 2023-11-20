import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  String text;
  MyApp({this.text,this.audioPlayer,this.audioCache});
  AudioPlayer audioPlayer;
  AudioCache audioCache;
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
      home: uuu(this.text,this.audioPlayer,this.audioCache),
    );
  }

}
class uuu extends StatefulWidget{
  String text;
  uuu(this.text,this.audioPlayer,this.audioCache);
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  @override
  leter createState() => new leter(this.text,this.audioPlayer,this.audioCache);


}
class leter extends State<uuu>{
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  List _salidas;
  File _Imagen;
  bool _isLoading;
  bool TEXTOS = true;
  bool validator = true;
  leter(this.text,this.audioPlayer,this.audioCache);
  String text;
  List<Color> _colors = [Colors.black54,Colors.black54];
  List<double> _stops = [0.0,0.7];
  @override
  void initState() {
    super.initState();
    audioPlayer.stop();
    audioCache.play("indicacion_mezcla.mp3");
    _isLoading =  true;
    loadModel().then((value){
      setState(() {
        _isLoading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(title: Text("A ESCRIBIR"),
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
                new Text(
                  "$text",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 150.00,
                      fontWeight: FontWeight.bold

                  ),
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
                      width: 120,
                      height: 70,
                      child: new MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                        onPressed: () {
                          TEXTOS = true;
                          validator = true;
                          pickImage();

                        },
                        child: Text("Imagen",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        color: Colors.cyan,
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(20.0)),
                    new Container(
                      decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.pinkAccent,Colors.pinkAccent],
                          stops: _stops),
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
                      // padding: EdgeInsets.all(30.00),
                      width: 120,
                      height: 70,
                      child: new MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),

                        onPressed: () {
                          TEXTOS = false;
                          validator = true;
                          pickImage();
                        },
                        child: Text("Foto",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25
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
  pickImage() async {
    if(TEXTOS == false){var imagen = await ImagePicker.pickImage(source: ImageSource.camera);
    if(imagen == null){return null;
    setState(() {
      _isLoading = true;
      _Imagen = imagen;
    });}
    clasificar(imagen);}
    if(TEXTOS == true){var imagen = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(imagen == null){return null;
    setState(() {
      _isLoading = true;
      _Imagen = imagen;
    });}
    clasificar(imagen);}
  }
  clasificar(File image)async{
    var output = await Tflite.runModelOnImage(path: image.path,
      numResults: 5,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _isLoading =  false;
      _salidas = output;
      print(_salidas);
      if( _salidas[0]['label'] == "U"){
        if(_salidas[0]['confidence'] > 0.7){print("excelente");
        audioPlayer.stop();
        audioCache.play("felicitacion.mp3");}
        else{print("mal");
        audioPlayer.stop();
        audioCache.play("error.mp3");
        }

      }

      else{print("mal");
      audioPlayer.stop();
      audioCache.play("error.mp3");
      }

    });
  }
  loadModel() async{
    await Tflite.loadModel(model: "assets/model_unquantUU.tflite",
        labels: "assets/labelsuu.txt"
    );
  }
  @override
  void dispose(){
    Tflite.close();
    super.dispose();
  }
}