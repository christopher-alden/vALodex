import 'package:flutter/material.dart';

class DrawerState {
  DrawerState._privateConstructor();

  static final DrawerState _instance = DrawerState._privateConstructor();

  static DrawerState get instance => _instance;

  bool isDrawerOpen = false;

  final List<VoidCallback> _listeners = [];

  void addListener(VoidCallback callback) {
    _listeners.add(callback);
  }

  void removeListener(VoidCallback callback) {
    _listeners.remove(callback);
  }

  bool getIsDrawerOpen() {
    return isDrawerOpen;
  }

  void setIsDrawerOpen(bool value) {
    isDrawerOpen = value;
    _notifyListeners();
  }

  void toggleState() {
    isDrawerOpen = !isDrawerOpen;
    _notifyListeners();
  }

  void _notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }
}
