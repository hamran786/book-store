import 'dart:convert';

import 'package:book_store/pages/body.dart';
import 'package:book_store/classes/siderover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  Future<dynamic> bookhub() async {
    String Url = "https://www.googleapis.com/books/v1/volumes?q=flutter";
    Response response = await get(Uri.parse(Url));
    var data = jsonDecode(response.body)["items"];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [Drower()],
          )),
        )),
        // backgroundColor: Colors.blue,
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.blue[400]
          ),
          centerTitle: true,
          elevation: 0,
          title: Text("HOME",  style: GoogleFonts.alike(
            textStyle: Theme.of(context).textTheme.displayMedium,
            fontSize: 20,
            // color: Colors.black87
          ),),
          // backgroundColor: Colors.white,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back, color: Colors.deepOrange),
          //   onPressed: () {
          //     print("you pressed back buttun");
          //   },
          // ),
          actions: [
            IconButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: "view purchased books");
                  print(("you pressed cart button"));
                },
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: Colors.blue[400],
                ))
          ],
        ),
        body:Body()



        // Container(
            //   height: 40,
            //   width: MediaQuery.of(context).size.width,
            //   color: Colors.pink,child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Text("EXPLORE", style: GoogleFonts.alike(
            //       textStyle: Theme.of(context).textTheme.displayMedium,
            //       fontSize: 20,
            //       color: Colors.black87), ),
            //   ),
            // ),

        );
    // body: Body(),
  }
}
