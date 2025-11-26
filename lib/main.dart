import 'package:ad254a/actuator.dart';
import 'package:ad254a/home_ass3.dart';
import 'package:ad254a/pizza_menu.dart';
import 'package:ad254a/pizzamenu.dart';
import 'package:ad254a/sensor.dart';
import 'package:ad254a/signin.dart';
import 'package:ad254a/signup.dart';
import 'package:ad254a/firebase_options.dart';
import 'package:ad254a/webview.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Elak duplicate initialization masa debug atau reload
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } catch (e) {
    print('⚠️ Firebase already initialized: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const SignInPage(),
    );
  }
}