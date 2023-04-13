import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class theameProvider extends ChangeNotifier {
  Brightness lightmode = Brightness.light;

  Brightnessmode() {
    if (lightmode == Brightness.light) {
      lightmode = Brightness.dark;
    } else if (lightmode == Brightness.dark) {
      lightmode = Brightness.light;
    }
    notifyListeners();
  }

  BrightnessIcon() {
    if (lightmode == Brightness.dark) {
      Icon(Icons.dark_mode,);
    } else if (lightmode == Brightness.light) {
      Icon(Icons.light_mode);
    }
    notifyListeners();
  }
}