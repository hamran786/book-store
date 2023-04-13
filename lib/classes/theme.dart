import 'package:flutter/material.dart';

class ColorTheme{
  static bgcolor(context){
    if(Theme.of(context).brightness==Brightness.light){
      return Colors.white;
    }
    else{
      return Colors.black;
    }
  }


}