import 'package:book_store/pages/loging_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../pages/favorite_list.dart';
import 'Provider_Class.dart';

class Drower extends StatefulWidget {
  const Drower({Key? key}) : super(key: key);

  @override
  State<Drower> createState() => _DrowerState();
}

class _DrowerState extends State<Drower> {
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
              Provider.of<theameProvider>(context).Name,
              style: GoogleFonts.amaranth(
                  textStyle: Theme.of(context).textTheme.displayMedium,
                  fontSize: 15,
                  // color: Colors.black87
              ),
            )
          ]),
          // decoration: BoxDecoration(color: Colors.blue[400]),
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text(
            "logout",
            style: GoogleFonts.acme(
                textStyle: Theme.of(context).textTheme.displayMedium,
                fontSize: 15,
                // color: Colors.black87
            ),
          ),
          onTap: () {
            signout(context);
            Fluttertoast.showToast(msg: "logout.....");

            print("logout");
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            "settings",
            style: GoogleFonts.acme(
                textStyle: Theme.of(context).textTheme.displayMedium,
                fontSize: 15,
                // color: Colors.black87
            ),
          ),
          onTap: () {
            Fluttertoast.showToast(msg: "settins........");
            print("settings");
          },
        ),
        ListTile(
          leading: Icon(Icons.manage_search_rounded),
          title: Text(
            "manage app and device",
            style: GoogleFonts.acme(
                textStyle: Theme.of(context).textTheme.displayMedium,
                fontSize: 15,
                // color: Colors.black87
            ),
          ),
          onTap: () {
            Fluttertoast.showToast(msg: "manage app and device");
            print("manage app and device");
          },
        ),
        ListTile(
          leading: Icon(Icons.local_library),
          title: Text(
            "library",
            style: GoogleFonts.acme(
                textStyle: Theme.of(context).textTheme.displayMedium,
                fontSize: 15,
                // color: Colors.black87
            ),
          ),
          onTap: () {
            Fluttertoast.showToast(msg: "Library......");
            print("library");
          },
        ),
        ListTile(
          leading: Icon(Icons.card_travel),
          title: Text(
            " Your favorites lists",
            style: GoogleFonts.acme(
              textStyle: Theme.of(context).textTheme.displayMedium,
              fontSize: 15,
              // color: Colors.black87
            ),
          ),
          onTap: () {
            Fluttertoast.showToast(msg: "favorites......");
            print("favorites");
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return favorite();
            },));
          },
        ),
        ListTile(
          leading: Icon(Icons.dynamic_feed),
          title: Text(
            "help and feed back",
            style: GoogleFonts.acme(
                textStyle: Theme.of(context).textTheme.displayMedium,
                fontSize: 15,
                // color: Colors.black87
            ),
          ),
          onTap: () {
            Fluttertoast.showToast(msg: "help and feed back");
            print("help and feed back");
          },
        ),
        ListTile(
          leading: IconButton(
            onPressed: () {
              setState(() {
                Provider.of<theameProvider>(context, listen: false)
                    .Brightnessmode();
                Provider.of<theameProvider>(context, listen: false)
                    .BrightnessIcon();
              });
            },
            icon: Icon(Provider.of<theameProvider>(context).lightmode ==
                    Brightness.dark
                ? Icons.dark_mode
                : Icons.light_mode),
            // color: Colors.black,
          ),
          title: Text("Select Mode",style: GoogleFonts.acme(
              textStyle: Theme.of(context).textTheme.displayMedium,
              fontSize: 15,
              // color: Colors.black87
          ),),
        ),
      ],
    );
  }

  signout(context) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    await GoogleSignIn().signOut();
    await _firebaseAuth.signOut();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Loging()), (route) => false);
  }
}
