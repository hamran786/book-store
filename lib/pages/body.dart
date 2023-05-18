import 'dart:convert';

import 'package:book_store/classes/theme.dart';
import 'package:book_store/classes/theme.dart';
import 'package:book_store/classes/theme.dart';
import 'package:book_store/classes/theme.dart';
import 'package:book_store/pages/details.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:book_store/classes/colour.dart';
import '../classes/GesturDetector.dart';
import 'Welcome_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<dynamic> lists() async {
    String Url = "https://www.googleapis.com/books/v1/volumes?q=flutter";
    Response response = await get(Uri.parse(Url));
    print(">>>>>>>>>>>>>${response.body}");
    Map data = jsonDecode(response.body);
    Gestor.GustersList = data["items"];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          child: Text(
            ("explore"),
            style: GoogleFonts.alike(
              textStyle: Theme.of(context).textTheme.displayMedium,
              fontSize: 20,
              // color: Colors.black87
            ),
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.all(12.0),
        // ),
        Expanded(
          child: FutureBuilder(
              future: lists(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  print(snapshot.data['items']);
                  return (GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 30),
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data["items"].length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (cnxt) {
                            return Details(data: index);
                          }));
                          await FirebaseAnalytics.instance.logEvent(
                              name: 'My_google_signIn',
                              parameters: {
                                'note': 'USER READY TO LIST VIEW PAGE VIEWING'
                              });
                          // await FirebaseAnalytics.instance
                          //     .setCurrentScreen(screenName: 'Products');
                        },
                        child: Stack(
                          fit: StackFit.expand,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
// overflow: Overflow.visible,
                          children: <Widget>[
// Container(
// width: 300,
// height: 300,
// color: Colors.red,
// ), //Container
                            Center(
                              child: Container(
                                height: 140,
                                width: 150,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: MyColors.itrator(),
                                  ),
                                  width: 160,
                                  height: 160,
                                ),
                              ),
                            ), //Container
                            Positioned(
                                left: 45,
                                bottom: 5,
                                child: ClipRRect(
                                  child: Image.network(
                                    snapshot.data["items"][index]["volumeInfo"]
                                        ["imageLinks"]["smallThumbnail"],
                                    height: 250,
                                    width: 110,
                                  ),
                                )),

                            Positioned(
                                bottom: 1,
                                left: 20,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    height: 15,
                                    width: 160,
                                    child: Center(
                                      child: Text(
                                        snapshot.data["items"][index]
                                            ["volumeInfo"]["authors"][0],
                                        style: GoogleFonts.alike(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .displayMedium,
                                          fontSize: 13,
                                          // color: Colors.black87
                                        ),
                                      ),
                                    )))

                            //Container
                          ], //<Widget>[]
                        ),
                      );
                    },
                  ));
                } else {
                  return Center(
                      child: Text(
                    "Somethig Went Wrong",
                    style: TextStyle(
                        height: 22, color: CupertinoColors.tertiaryLabel),
                  ));
                }
              }),
        ),
      ]),
    );
  }
}
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// crossAxisSpacing: 6,
// mainAxisSpacing: 6,
// ),
