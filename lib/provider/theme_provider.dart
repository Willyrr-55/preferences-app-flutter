
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  late ThemeData currentTheme;
  
  ThemeProvider({
    required bool isDarkmode
  }):currentTheme = isDarkmode ? ThemeData.dark() :ThemeData(primarySwatch: Colors.teal);

  setLightMode(){
    currentTheme = ThemeData(primarySwatch: Colors.teal);
    notifyListeners();
  }

  setDarkmode(){
    currentTheme = ThemeData.dark();
    notifyListeners();
  }

}