// Create a global variable for context
import 'package:flutter/material.dart';

class AppContext {
  static BuildContext? _context;

  static void setContext(BuildContext context) {
    _context = context;
  }

  static BuildContext? get context => _context;
}
