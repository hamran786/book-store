import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart' as path;

import 'home_Page.dart';

class Loging extends StatefulWidget {
  Loging({Key? key}) : super(key: key);

  @override
  State<Loging> createState() => _LogingState();
}

class _LogingState extends State<Loging> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signInwithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = await GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home_Page(),
        ));
    print("loging>>>>>>>>>>>>>>>>>>>");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      // appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      // backgroundColor: Color(0xFFffffff),
      body: SafeArea(
        child: Container(
            child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 0.06),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Text("Book store",
                    style: TextStyle(fontSize: 40,fontStyle:FontStyle.italic,fontWeight: FontWeight.bold , color: Colors.black),
                ),
              ),
            ),

            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Text("Welcome",
            //         style: TextStyle(fontSize: 30, color: Color(0xFF363f93))),
            //   ),
            // ),
            SizedBox(
              height: 120,
            ),
            Center(
              child: Container(
                height: 350,
                width: 280,
                color: Colors.transparent,
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage("asset/images/reader.girl.jpeg"),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const Center(child: Text("signing with google")),
            Center(
              child: Center(
                child: InkWell(
                  onTap: () {
                    print("loging with google");
                    signInwithGoogle();
                  },
                  child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage("asset/images/google.icon.jpeg"),
                      height: 40,
                      width: 40),
                ),
              ),
            ),

          ]),
        )),
      ),
    );
  }
}


