// import 'package:flutter/material.dart';

class VCButtonController {
  void Function(bool)? setLock;
  bool isActive = false;

  void dispose() {
    setLock = null;
  }
}
