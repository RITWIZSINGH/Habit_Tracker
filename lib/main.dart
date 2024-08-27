// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, use_super_parameters, unused_import

import 'package:flutter/material.dart';
import 'package:habit_tracker_app/screens/nav_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationScreen(
        currentIndex: 0,
      ),
    );
  }
}
