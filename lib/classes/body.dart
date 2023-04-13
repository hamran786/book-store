import 'dart:convert';

import 'package:book_store/pages/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'GesturDetector.dart';

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
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4,
                                  mainAxisSpacing: 50),
                          itemCount: snapshot.data["items"].length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: InkWell(
                                onTap: () => Navigator.push(context,
                                    MaterialPageRoute(builder: (cnxt) {
                                  return Details(data: index);
                                })),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 5, right: 5),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 50.0,
                                        ),
                                      ],
                                    ),
                                    height: 200,
                                    width: 200,
                                    child: Column(
                                      children: [
                                        Image.network(
                                          snapshot.data["items"][index]
                                                  ["volumeInfo"]["imageLinks"]
                                              ["smallThumbnail"],
                                          fit: BoxFit.fill,
                                          height: 130,
                                          width: 110,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 2),
                                          child: Text(
                                            snapshot.data["items"][index]
                                                ["volumeInfo"]["authors"][0],
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
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
      ),
    );
  }
}
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// crossAxisSpacing: 6,
// mainAxisSpacing: 6,
// ),
