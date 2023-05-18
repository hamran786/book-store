import 'dart:convert';
import 'dart:ui';

import 'package:book_store/pages/body.dart';
import 'package:book_store/pages/home_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  @override
  void initState() {
    checkIndex();
    super.initState();
  }
  bool isFavorited = false;
  bool isRemove = false;
// Future<dynamic> Detailslist()
  checkIndex(){
    print(favorites.favoritesList);
    favorites.favoritesList.forEach((element) {
      print(element);
    });
  }
  @override
  Widget build(BuildContext context) {
    print({
      "deatils page ->>>>>>>>>>>>>>>>>>>>>>>>>>",
      Gestor.GustersList[widget.data!]
    });
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.red[900],
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.deepOrange),
      //     onPressed: () {
      //       print("you pressed back buttun");
      //       Navigator.pushReplacement(context, MaterialPageRoute(
      //         builder: (context) {
      //           return Home_Page();
      //         },
      //       ));
      //     },
      //   ),
      //   title: Text(
      //     Gestor.GustersList[widget.data!]["volumeInfo"]['title'],
      //     style: GoogleFonts.alike(
      //         textStyle: Theme.of(context).textTheme.displayMedium,
      //         fontSize: 20,
      //         color: Colors.white),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         setState(() {
      //           Provider.of<theameProvider>(context, listen: false)
      //               .Brightnessmode();
      //           Provider.of<theameProvider>(context, listen: false)
      //               .BrightnessIcon();
      //         });
      //       },
      //       icon: Icon(Provider.of<theameProvider>(context).lightmode ==
      //               Brightness.dark
      //           ? Icons.dark_mode
      //           : Icons.light_mode),
      //       color: Colors.black,
      //     )
      //   ],
      // ),
      body: Stack(
        children: [
          SafeArea(
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
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            Gestor.GustersList[widget.data]
                                                    ["volumeInfo"]['imageLinks']
                                                ['smallThumbnail']),
                                        fit: BoxFit.contain),
                                    borderRadius: BorderRadius.circular(12.0),
                                    // color: Colors.white,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  child: ClipRRect(
// make sure we apply clip it properly
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.white.withOpacity(0.01),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ), //
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 50, top: 70),
                                child: SizedBox.fromSize(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                          Gestor.GustersList[widget.data]
                                                  ["volumeInfo"]['imageLinks']
                                              ['smallThumbnail']),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            left: 200,
                            top: 65,
                            child: Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                Gestor.GustersList[widget.data!]["volumeInfo"]
                                    ['title'],
                                style: GoogleFonts.alike(
                                  textStyle:
                                      Theme.of(context).textTheme.displayMedium,
                                  fontSize: 22,
                                  color: Provider.of<theameProvider>(context)
                                              .lightmode ==
                                          Brightness.dark
                                      ? Colors.grey[200]
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 165,
                            left: 280,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  Gestor.GustersList[widget.data]["volumeInfo"]
                                      ['authors'][0],
                                  style: GoogleFonts.alike(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: ()async {

                                print(widget.data);
                                if(isFavorited == false)  {
                                  print("add to fav");
                                  favorites.favoritesList.add(widget.data);

                                }else{
                                  favorites.favoritesList.remove(widget.data);
                                }
                                setState(() {
                                  isFavorited = !isFavorited;
                                  AddToFav();

                                });
                                print(favorites.favoritesList);
                              },
                              icon: Icon(isFavorited == true ? Icons.favorite : Icons.favorite_border,size: 33,)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(23.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              // boxShadow: [
                              //   BoxShadow(
                              //     blurRadius: 40.0,
                              //   ),
                              // ],
                              ),
                          // decoration: BoxDecoration(color: Colors.transparent),
                          child: Text(
                            Gestor.GustersList[widget.data]["volumeInfo"]
                                ['description'],
                            style: GoogleFonts.alike(
                              textStyle:
                                  Theme.of(context).textTheme.displayMedium,
                              fontSize: 15,
                              height: 2,
                              // color: Colors.blue[200]
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Gestor.GustersList[widget.data]['saleInfo']
                                ["saleability"],
                            style: GoogleFonts.alike(
                                textStyle:
                                    Theme.of(context).textTheme.displayMedium,
                                fontSize: 10,
                                color: Colors.teal[900]),
                          ),
                        ],
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
                                      Theme.of(context).textTheme.displayMedium,
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
                                    Theme.of(context).textTheme.displayMedium,
                                fontSize: 15,
                              ),
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
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     Gestor.GustersList[widget.data]["volumeInfo"]
          //     ['title'],
          //     style: GoogleFonts.alike(
          //         textStyle:
          //         Theme
          //             .of(context)
          //             .textTheme
          //             .displayMedium,
          //         fontSize: 20,
          //         color: Colors.black87),
          //   ),
          //  ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       InkWell(
          //           onTap: () {
          //             return print("add to book mark---------->");
          //           },
          //           child: Icon(
          //             Icons.bookmark_add,
          //             color: Colors.yellow[700],
          //           ))
          //     ],
          //   ),
          // ),

          Positioned(
            bottom: 0,
            child: Container(
              color: Provider.of<theameProvider>(context).lightmode ==
                      Brightness.dark
                  ? Colors.black
                  : Colors.white,
              // borderRadius: BorderRadius.circular(52),

              width: MediaQuery.of(context).size.width,
              height: 90,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 12),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          Gestor.GustersList[widget.data]["volumeInfo"]
                              ['imageLinks']['smallThumbnail']),
                    ),

                    // radius: 25,child: Image(image:NetworkImage(

                    // backgroundColor: Colors.white,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          // color: Colors.white,
                          height: 70,
                          width: 250,
                          child: Column(
                            children: [
                              Text(
                                // overflow: TextOverflow.ellipsis,
                                // maxLines: 1,
                                Gestor.GustersList[widget.data]["volumeInfo"]
                                    ['title'],

                                style: GoogleFonts.acme(
                                  textStyle:
                                      Theme.of(context).textTheme.displayMedium,
                                  fontSize: 15,
                                  // color: Colors.black87
                                ),
                              ),
                              Container(
                                height: 15,
                                width: 150,
                                child: Text(
                                  "Number of Pages:" +
                                      Gestor.GustersList[widget.data]
                                              ["volumeInfo"]['pageCount']
                                          .toString(),
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                    fontSize: 10,
                                    // color: Colors.black87
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Column(
                      //   children: [
                      //     Text(
                      //       Gestor.GustersList[widget.data]["volumeInfo"]
                      //           ['authors'][0],
                      //       overflow: TextOverflow.ellipsis,
                      //       maxLines: 1,
                      //       style: GoogleFonts.alike(
                      //           textStyle:
                      //               Theme.of(context).textTheme.displayMedium,
                      //           fontSize: 10),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: IconButton(
                          onPressed: () {
                            Fluttertoast.showToast(msg: "downloading....");
                            return print("Downloading---------->");
                          },
                          icon: Icon(
                            Icons.download_for_offline_outlined,
                            color: Colors.red[200],
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // } else {
    //   return Center(child: Text("Something Went Wrong"));
    // }
  }
  Future AddToFav() async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String myFavDecoded = await jsonEncode(favorites.favoritesList);
    print({"MY FAV ENCODED :",myFavDecoded.runtimeType});
    sharedPref.setString('myFav', myFavDecoded);
    String? myStoredData = await sharedPref.getString('myFav');
    print('++++++++'+myStoredData!);
    List Decoded =await jsonDecode(myStoredData!);
    print({Decoded});

  }
}


