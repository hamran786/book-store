import 'package:flutter/material.dart';

class stackdetails extends StatefulWidget {
  const stackdetails({Key? key}) : super(key: key);

  @override
  State<stackdetails> createState() => _stackdetailsState();
}

class _stackdetailsState extends State<stackdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.pink,
          ),
        ),
        Positioned(
            child: Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          color: Colors.green,
        )),
        Positioned(
            top: 200,
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.yellow,
            ))
      ]),
    );
  }
}
