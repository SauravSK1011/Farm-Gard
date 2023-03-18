import 'dart:io';
import 'package:translator/translator.dart';

import 'package:agroscan/Screens/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import '../model/datam.dart';

class predictionScreen extends StatefulWidget {
  predictionScreen({super.key, required this.data});
  late DataM data;
  @override
  State<predictionScreen> createState() => _predictionScreenState();
}

class _predictionScreenState extends State<predictionScreen> {
  var ans;
  @override
  void initState() {
    super.initState();
    loadmodal();
  }

  translate(String input) async {
    final translator = GoogleTranslator();
    ans =  await translator.translate(input, from: 'en', to: 'mr');
    print("ans is ");
    print(ans);
    setState(() {
      load = true;
    });
  }

  final imagepicker = ImagePicker();
  late File _imagefile;
  bool loading = false;
  List _pridiction = [];
  bool load = false;
  var confidence;
  late String label;

  loadmodal() async {
    await Tflite.loadModel(model: widget.data.model, labels: widget.data.lable);
  }

  _imageformgallery() async {
    var image = await imagepicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      _imagefile = File(image.path);
      setState(() {
        loading = true;
      });
    }
  }

  predict(File image) async {
    var pridection = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 250.5,
        imageStd: 250.5);
    print("pridection");
    print(pridection);

    setState(() {
      _pridiction = pridection!;
      label = _pridiction[0]["label"] != null
          ? _pridiction[0]["label"].toString().substring(2)
          : "seems like this Disease not in our database Please Contact local authorities";
      confidence = _pridiction[0]["confidence"] != null
          ? (_pridiction[0]["confidence"] * 100).toString().substring(0, 5)
          : 0;
      translate(label);
    });
  }

  _imageformcamara() async {
    var image = await imagepicker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      _imagefile = File(image.path);
      setState(() {
        loading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var location;
    // switch(widget.plant){
    //   case 'Tomato' :
    //   location="assets/tomato.jpg";
    // }
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromRGBO(126, 217, 87, 1),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Farm Guard",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 10,
            ),
            widget.data.lang == 'English'
                ? const Text(
                    "Predict Disease",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  )
                : Text(
                    "रोगाचा अंदाज लावा",
                    style: DevanagariFonts.hind(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            const SizedBox(
              height: 25,
            ),
            CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage(
                widget.data.image,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            loading
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.file(_imagefile),
                      ),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                _imageformcamara();
              },
              child: Card(
                elevation: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: widget.data.lang == 'English'
                        ? Container(width: MediaQuery.of(context).size.width/1.3,
                          child: Center(
                            child: Text(
                                "Capture Image",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                          ),
                        )
                        : Container(width: MediaQuery.of(context).size.width/1.3,
                          child: Center(
                            child: Text(
                                "फोटो काढा",
                                style: DevanagariFonts.hind(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ),
                        )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                _imageformgallery();
              },
              child: Card(
                elevation: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: widget.data.lang == 'English'
                      ? Container(width: MediaQuery.of(context).size.width/1.3,
                        child: Center(
                          child: Text(
                              "Take Image From Gallary",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                        ),
                      )
                      : Container(width: MediaQuery.of(context).size.width/1.3,
                        child: Center(
                          child: Text(
                              "गॅलरीमधून फोटो घ्या",
                              style: DevanagariFonts.hind(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ),
                      ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await predict(_imagefile);
                String predicted_Disease = _pridiction[0]["label"] != null
                    ? _pridiction[0]["label"]
                        .toString()
                        .substring(2)
                        .toUpperCase()
                    : "seems like this Disease not in our database Please Contact local authorities";
                print(predicted_Disease);
              },
              child: Card(
                elevation: 30,
                color: Color.fromARGB(255, 144, 47, 218),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: widget.data.lang == 'English'
                      ? Container(width: MediaQuery.of(context).size.width/1.3,
                        child: Center(
                          child: Text(
                              "Predict",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                        ),
                      )
                      : Container(width: MediaQuery.of(context).size.width/1.3,
                        child: Center(
                          child: Text(
                              "आजार ओळखा",
                              style: DevanagariFonts.hind(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,color: Colors.white
                              ),
                            ),
                        ),
                      ),
                ),
              ),
            ),
            load
                ? Center(
                    child: widget.data.lang == 'English'
                        ? Text(
                            label,
                            style: TextStyle(fontSize: 25),
                          )
                        : Text(
                            ans.toString(),
                            style: DevanagariFonts.hind(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  )
                : Text(""),
            load
                ? Center(
                    child: Text(
                      "Acc:-"+confidence.toString()+"%",
                      style: TextStyle(fontSize: 25),
                    ),
                  )
                : Text(""),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(
                              confidence: confidence,
                              result: label,
                              image: _imagefile,
                              lang: widget.data.lang, nameinM: ans.toString(),
                            )));
              },
              child: Card(
                elevation: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: widget.data.lang == 'English'
                      ? Container(width: MediaQuery.of(context).size.width/1.3,
                        child: Center(
                          child: Text(
                              "Detailed Report",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                        ),
                      )
                      : Container(width: MediaQuery.of(context).size.width/1.3,
                        child: Center(
                          child: Text(
                              "सविस्तर अहवाल",
                              style: DevanagariFonts.hind(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ),
                      ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
