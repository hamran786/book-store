import 'dart:convert';
import 'package:lottie/lottie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../classes/GesturDetector.dart';
import '../classes/colour.dart';

class favorite extends StatefulWidget {

  favorite({
    Key? key,
  }) : super(key: key);

  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {


  @override
  void initState() {
    shareget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Faverites")),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: favorites.favoritesList.length,
                  itemBuilder: (context, index) {
                    print({
                      ".........................",
                      Gestor.GustersList[index]
                    });
                    // return Container(child: Image.network(Gusters[favoriteList][index]
                    //   [index]["volumeInfo"]
                    //   ["imageLinks"]["smallThumbnail"],
                    //   height: 250,
                    //   width: 110,
                    // ),);
                    return Column(
                      children: [
                        Card(
                          color: MyColors.itrator(),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 50,
                                child: Image(
                                    image: NetworkImage(
                                        Gestor.GustersList[favorites.favoritesList![index]]
                                                ["volumeInfo"]['imageLinks']
                                            ['smallThumbnail'])),
                              ),
                              Column(
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          Gestor.GustersList[favorites.favoritesList![index]]
                                              ["volumeInfo"]['title'],
                                        ),
                                        IconButton(
                                            onPressed: () async{
                                               // Gestor.GustersList.(favorite.favoriteList[index]);
                                              setState(() {
                                                favorites.favoritesList.removeAt(index);
                                              });
                                              SharedPreferences sharedPref = await SharedPreferences.getInstance();
                                              String myFavDecoded = await jsonEncode(favorites.favoritesList);
                                              sharedPref.setString('myFav', myFavDecoded);
                                            },
                                            icon: Icon(Icons.delete))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container()
                        //
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }

// Lottie.asset("asset/images/61372-404-error-not-found.json");
  void shareget() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var getData = await pref.getString("myFav");
    var decoded = jsonDecode(getData!);
    setState(() {
      favorites.favoritesList = decoded;
    });
    print({"Decoded : ", favorites.favoritesList});
  }
}
