import 'package:flutter/material.dart';

class MyColors {
  static int temp = 0;
  static List<Color> colors = [
    Color.fromARGB(255,37,150,190,),
    Color.fromARGB(225, 199, 200, 200),
    Color.fromARGB(225, 187, 223, 219),
    Color.fromARGB(225, 221, 190, 232),
  ];
  static itrator(){

    switch(temp){
      case 0:{
       temp++;
       return colors[temp];
      }
      case 1:{
        temp++;
        return colors[temp];
      }
      case 2:{
        temp++;
        return colors[temp];
      }
      case 3:{
        temp = 0;
        return colors[temp];
      }
    }
  }
}