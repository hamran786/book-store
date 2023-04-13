import 'dart:convert';

import 'package:book_store/classes/body.dart';
import 'package:book_store/pages/home_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../classes/GesturDetector.dart';
import '../classes/Provider_Class.dart';
import '../classes/theme.dart';

class Details extends StatefulWidget {
  Details({Key? key, required this.data}) : super(key: key);
  int data;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
// Future<dynamic> Detailslist()
  @override
  Widget build(BuildContext context) {
    print({
      "deatils page ->>>>>>>>>>>>>>>>>>>>>>>>>>",
      Gestor.GustersList[widget.data!][widget.data]
    });
    return Scaffold(
      backgroundColor: ColorTheme.bgcolor(context),
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.deepOrange),
          onPressed: () {
            print("you pressed back buttun");
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return Home_Page();
              },
            ));
          },
        ),
        title: Text(
          Gestor.GustersList[widget.data!]["volumeInfo"]['title'],
          style: GoogleFonts.alike(
              textStyle: Theme
                  .of(context)
                  .textTheme
                  .displayMedium,
              fontSize: 20,
              color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Provider.of<theameProvider>(context, listen: false)
                    .Brightnessmode();
                Provider.of<theameProvider>(context, listen: false)
                    .BrightnessIcon();
              });
            },
            icon: Icon(Provider
                .of<theameProvider>(context)
                .lightmode == Brightness.dark ? Icons.dark_mode : Icons
                .light_mode), color: Colors.black,)
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx < 0) {
              print('right');
              print(Gestor.GustersList.length);
              print(widget.data);
              if ((Gestor.GustersList.length - 1) == widget.data) {
                // Navigator.pushReplacement(context, MaterialPageRoute(
                //   builder: (context) {
                //     return Details(data: 0);
                //   },
                // ));
              } else {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return Details(data: widget.data! + 1);
                    }));
              }
            }
            if (details.delta.dx > 0) {
              print("left");
              print(Gestor.GustersList.length);
              print(widget.data);
              if (widget.data == 0) {
                // Navigator.pushReplacement(context, MaterialPageRoute(
                //   builder: (context) {
                //     return Details(data: Gestor.GustersList.length-1);
                //   },
                // ));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(data: widget.data - 1),
                    ));
              }
            }
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 80.0,
                            ),
                          ],
                        ),
                        height: 210,
                        width: 140,
                        child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(Gestor.GustersList[widget.data]
                          ["volumeInfo"]['imageLinks']['smallThumbnail']),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Gestor.GustersList[widget.data]["volumeInfo"]['title'],
                    style: GoogleFonts.alike(
                        textStyle: Theme
                            .of(context)
                            .textTheme
                            .displayMedium,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            return print("add to book mark---------->");
                          },
                          child: Icon(
                            Icons.bookmark_add,
                            color: Colors.yellow[700],
                          ))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Gestor.GustersList[widget.data]["volumeInfo"]['authors']
                        [0] +
                            " . --",
                        style: GoogleFonts.alike(
                            textStyle:
                            Theme
                                .of(context)
                                .textTheme
                                .displayMedium,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
                // Column(
                //   children: [
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         InkWell(
                //           onTap: () {
                //             return print("add to book mark---------->");
                //           },
                //           child: Icon(
                //             Icons.star_rate,
                //             color: Colors.yellow[700],
                //           ),
                //         )
                //       ],
                //     ),
                //   ],
                // ),
                Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        // BoxShadow(
                        //   blurRadius: 40.0,
                        // ),
                      ],
                    ),
                    // decoration: BoxDecoration(color: Colors.transparent),
                    child: Text(
                      Gestor.GustersList[widget.data]["volumeInfo"]
                      ['description'],
                      style: GoogleFonts.alike(
                          textStyle: Theme
                              .of(context)
                              .textTheme
                              .displayMedium,
                          fontSize: 15,
                          height: 2,
                          // color: Colors.blue[200]
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Gestor.GustersList[widget.data]['saleInfo']
                        ["saleability"],
                        style: GoogleFonts.alike(
                            textStyle:
                            Theme
                                .of(context)
                                .textTheme
                                .displayMedium,
                            fontSize: 10,
                            color: Colors.green[100]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        Gestor.GustersList[widget.data]["volumeInfo"]
                        ['publisher'] ??
                            '',
                        style: GoogleFonts.alike(
                            textStyle:
                            Theme
                                .of(context)
                                .textTheme
                                .displayMedium,
                            fontSize: 15,
                            color: Colors.blue[400]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        Gestor.GustersList[widget.data]["volumeInfo"]
                        ['publishedDate'],
                        style: GoogleFonts.alike(
                            textStyle:
                            Theme
                                .of(context)
                                .textTheme
                                .displayMedium,
                            fontSize: 15,
                            color: Colors.lightBlue[200]),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                          Gestor.GustersList[widget.data]["volumeInfo"]
                          ['maturityRating'],
                          style: TextStyle(color: Colors.blue[100])),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Download",
                    style: TextStyle(color: Colors.deepOrange),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          return print("Downloading---------->");
                        },
                        child: Icon(
                          Icons.download_for_offline_outlined,
                          color: Colors.deepOrange,
                        ))
                  ],
                ),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ),
      ),
    );
    // } else {
    //   return Center(child: Text("Something Went Wrong"));
    // }
  }
}
