import 'package:agroscan/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_language_fonts/google_language_fonts.dart';

class Lang extends StatefulWidget {
  const Lang({super.key});

  @override
  State<Lang> createState() => _LangState();
}

class _LangState extends State<Lang> {
  @override
  Widget build(BuildContext context) {
    late String lang;
    return Scaffold(
      body: Center(
          child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          stops: [0.3, 1.0],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(126, 217, 87, 1),
            Color.fromRGBO(126, 217, 87, 1),
          ],
        )),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(onTap: (){
                lang = "English";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(lang: lang)));
              },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 15,
                      child: Center(
                        child: Text(
                          "English",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  color: Colors.white,
                  elevation: 30,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  lang = "Marathi";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(lang: lang)));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                  elevation: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 15,
                      child: Center(
                        child: Text(
                          'मराठी',
                          style: DevanagariFonts.hind(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
