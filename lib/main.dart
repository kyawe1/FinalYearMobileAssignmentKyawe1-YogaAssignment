import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_assignment1/screen/mainScreen.dart';
 // main function for running apps
void main() {
  runApp(ProviderScope(child: MainScreen()));
}

