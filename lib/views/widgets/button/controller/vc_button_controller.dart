// import 'package:flutter/material.dart';

class VCButtonController {
  void Function(bool)? setLock;

  void dispose() {
    setLock = null;
  }
}
