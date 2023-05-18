import 'package:book_store/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../classes/Provider_Class.dart';
import 'home_Page.dart';
//
// void main(){
//   FirebaseAnalytics analytics= FirebaseAnalytics();
//   runApp(MyApp(analytics:analytics));
// }


class Loging extends StatefulWidget {
  Loging({Key? key}) : super(key: key);

  @override
  State<Loging> createState() => _LogingState();
}


class _LogingState extends State<Loging> {


  final FirebaseAuth _auth = FirebaseAuth.instance;
  late GoogleSignInAccount userObj;




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
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      // backgroundColor: Color(0xFFffffff),
      body: SafeArea(
        child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 0.06),
          SizedBox(
            height: 120,
          ),
          Center(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.transparent,
              child: Image(
                fit: BoxFit.contain,
                image: AssetImage("asset/images/ images.loading.jpeg"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                "Start your journey",
                style: GoogleFonts.aclonica(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    fontSize: 22,
                    color: Colors.black87),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
            child: Center(
              child: Text(
                "Acces the 30+ million books in various    "
                "  languages with an easy and simole"
                "monthly subscription and read anywhere.   "
                "any device first month will be free",
                style: GoogleFonts.abel(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    fontSize: 18,
                    color: Colors.black87),
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
                onTap: () async {
                  print("loging with google");
                  // signInwithGoogle();
                  Fluttertoast.showToast(msg: "welcome to book store");

                  GoogleSignIn().signIn().then((Userdata) {
                    print({'dfdf>>>>>>>>>>>>>>>>>>>>>>>>', Userdata});
                    setState(() {
                      userObj = Userdata!;
                      Provider.of<theameProvider>(context, listen: false)
                          .googledata(userObj.displayName.toString());
                      userObj.displayName!.length!=0? Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home_Page(),
                          )):null;
                      //               .Brightnessmode();
                    });
                  });
                  await FirebaseAnalytics.instance.logEvent(
                    name: 'My_google_signIn',
                    parameters: {'note': 'name >>>>>>>>>>>>>>>>>events'},
                  );
                },
                child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage("asset/images/google.icon.jpeg"),
                    height: 40,
                    width: 40),
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
