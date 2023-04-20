import 'package:flutter/material.dart';

class News_Provider extends ChangeNotifier{
  int i=0;
  void selectIndex(int value)
  {
    i=value;
    notifyListeners();
  }
}