import 'package:flutter/material.dart';


   containercolor(context){
    if(Theme.of(context).brightness==Brightness.light){
      return Colors.black;
    }
    else{
      return Colors.grey[100];
    }
  }


