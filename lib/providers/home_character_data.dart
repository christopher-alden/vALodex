import 'package:flutter/material.dart';

class HomeCharacterData {
  HomeCharacterData._privateConstructor();

  static final HomeCharacterData _instance =
      HomeCharacterData._privateConstructor();

  static HomeCharacterData get instance => _instance;

  // PLS INGET INI YANG NGE INIT PLS YA
  String _characterText = "Deadlock";
  // INGET INI BASED ON MAIN PAGE YA PATHNYA TOLONG
  String _characterImg = 'Deadlock-Character.png';

  final List<VoidCallback> _listeners = [];

  void addListener(VoidCallback callback) {
    _listeners.add(callback);
  }

  void removeListener(VoidCallback callback) {
    _listeners.remove(callback);
  }

  String getCharacterText() {
    return _characterText;
  }

  void setCharacterText(String value) {
    _characterText = value;
    _notifyListeners();
  }

  String getCharacterImg() {
    return _characterImg;
  }

  void setCharacterImg(String value) {
    _characterImg = value;
    _notifyListeners();
  }

  void _notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }
}
