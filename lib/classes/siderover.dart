import 'package:book_store/pages/loging_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Drower extends StatelessWidget {
  const Drower({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 180,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(

              margin: EdgeInsets.only(bottom: 10),
              height: 50,

              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("asset/images/google.icon.jpeg"))),
            ),
            Text(
              "hamranclt&86@gmail.com",
              style: TextStyle(color: Colors.black),
            )
          ]),decoration: BoxDecoration(color: Colors.brown[300]),
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("logout", style: TextStyle(fontSize: 18,color: Colors.red[400])),
          onTap: () {
              signout(context);


            print("logout");
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("settings", style: TextStyle(fontSize: 18)),
          onTap: () {


            print("settings");
          },
        ),
        ListTile(
          leading: Icon(Icons.manage_search_rounded),
          title: Text("manage app and device", style: TextStyle(fontSize: 18)),
          onTap: () {


            print("manage app and device");
          },
        ),
        ListTile(
          leading: Icon(Icons.local_library),
          title: Text("library", style: TextStyle(fontSize: 18)),
          onTap: () {


            print("library");
          },
        ),
        ListTile(
          leading: Icon(Icons.dynamic_feed),
          title: Text("help and feed back", style: TextStyle(fontSize: 18)),
          onTap: () {


            print("help and feed back");
          },
        ),


      ],
    );
  }

  signout(context) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    await GoogleSignIn().signOut();
    await _firebaseAuth.signOut();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Loging()), (route) => false);
  }}
