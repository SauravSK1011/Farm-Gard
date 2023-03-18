import 'dart:async';

import 'package:agroscan/Screens/HomePage.dart';
import 'package:agroscan/Screens/SignupScreen.dart';
import 'package:agroscan/Screens/lang.dart';
import 'package:agroscan/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:glassmorphism_buttons/glassmorphism_buttons.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var data;
  @override
  void initState() {
    data = firebaseefunc.getdata();

    super.initState();
  }

  bool _success = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future _login(email, pass) async {
    User? user = (await auth.signInWithEmailAndPassword(
      email: email,
      password: pass,
    ))
        .user;

    if (user != null) {
      setState(() {
        _success = true;
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String email = "", password = "";
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                    Image.asset("assets/logo.png",scale: 1.5,),
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Login to continue!',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25,right: 25),
                      child: Card(
                        elevation: 30,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 32, right: 32, top: 8),
                              child: GlassContainer(
                                linearGradient: const LinearGradient(
                                    colors: [Colors.white38, Colors.white38]),
                                blur: 1.05,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: TextField(
                                    onChanged: (String value) {
                                      email = value;
                                    },
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 3,
                                              color:
                                                  Colors.purple), //<-- SEE HERE
                                        ),
                                        fillColor: Colors.white,
                                        hintText: "Email"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 32, right: 32, bottom: 8, top: 8),
                              child: GlassContainer(
                                linearGradient: const LinearGradient(
                                    colors: [Colors.white38, Colors.white38]),
                                blur: 1.05,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: TextField(
                                    obscureText: true,
                                    onChanged: (String value) {
                                      password = value;
                                    },
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 3,
                                              color:
                                                  Colors.purple), //<-- SEE HERE
                                        ),
                                        fillColor: Colors.white,
                                        hintText: "Password"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            GlassContainer(
                              linearGradient: const LinearGradient(
                                  colors: [Colors.white, Colors.white]),
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: InkWell(
                                      onTap: () async {
                                        await _login(email, password).onError(
                                            (error, stackTrace) => () {});
                                        if (_success != false) {
                                          print("data");
                                          // print(data[0].name);
                                          // var name11 = data[0].name;
                    
                                          await Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Lang(
                                                      )));
                                        }
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left:
                                                (MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    75),
                                            right: (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                75),
                                            bottom: 5,
                                            top: 5),
                                        child: Card(color: Color.fromARGB(255, 144, 47, 218),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(  left: 8, right: 8, bottom: 8, top: 8),
                                            child: Container(width: 150,
                                              child: Center(
                                                child: Text("Login",
                                                    style: TextStyle(
                                                      fontSize: 15.0,fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ))),
                            ),
                            InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                          ],
                        ),
                      ),
                    ),
                    
                    
                  ],
                ),
              )
              // Center(
              // child: Text(
              //   'BrainBeats!',
              //   style: TextStyle(
              //     fontSize: 48.0,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.white,
              //   ),
              // ),
              // ),
              ),
        ),
      ),
    );
  }
}
