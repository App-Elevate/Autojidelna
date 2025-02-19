// Create a global variable for context
import 'package:flutter/material.dart';

class AppContext {
  static BuildContext? _context;

  void setContext(BuildContext context) {
    _context = context;
  }

  BuildContext? get context => _context;
}
