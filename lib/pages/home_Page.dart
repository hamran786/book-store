import 'dart:convert';

import 'package:book_store/classes/body.dart';
import 'package:book_store/classes/siderover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      )),backgroundColor: Colors.blue,
      appBar: AppBar(centerTitle: true,
        elevation: 0,
        title: Text("BOOK HUB", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[900],
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.deepOrange),
        //   onPressed: () {
        //     print("you pressed back buttun");
        //   },
        // ),
        actions: [
          IconButton(
              onPressed: () {
                print(("you pressed cart button"));
              },
              icon: Icon(
                Icons.local_grocery_store_outlined,
                color: Colors.white70,
              ))
        ],
      ),
      body: Body(),
    );
  }
}
