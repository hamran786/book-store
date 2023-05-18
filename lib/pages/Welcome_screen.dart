import 'package:flutter/material.dart';

class StackPack extends StatefulWidget {
  String bookImage;
   StackPack({Key? key,required this.bookImage}) : super(key: key);

  @override
  State<StackPack> createState() => _StackPackState();
}

class _StackPackState extends State<StackPack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 400,
          child: Center(
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
                  child: Positioned(
                    top: 80,
                    left: 80,
                    child: Container(
                      decoration: BoxDecoration(
                      ),
                      width: 180,
                      height: 230,
                    ),
                  ),
                ), //Container
                Positioned(
                  left: 15,
                  bottom: 20,
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(width: 5),
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.purple,

                    ),
                    child: Image(image: NetworkImage(widget.bookImage)),
                    height: 250,
                    width: 150,
                  ),
                ),

                Positioned(
                    top: 315,
                    left: 40,
                    child: Container(
                        height: 50,
                        width: 220,
                        color: Colors.orange,
                        child: Text('ggggg')))

                //Container
              ], //<Widget>[]
            ), //Stack
          ), //Center
        ), //SizedBox
      ),
    );
  }
}
