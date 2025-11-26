// 1. IMPORT SUDAH DIPERBAIKI
import 'package:ad254a/actuator.dart';
import 'package:ad254a/dashboard.dart';
import 'package:ad254a/sensor.dart';
import 'package:ad254a/signup.dart';
import 'package:ad254a/textfield.dart';
import 'package:ad254a/webview.dart';

import 'info.dart';
import 'myprofile.dart';
import 'pizzamenu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // Tambahkan 'const' di constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Tambahkan 'const' di sini
        title: const Text('Home', style: TextStyle(color: Color(0xFFFFFFFF))),
        backgroundColor: const Color(0xFF2E0F0F),
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: const Icon(Icons.account_circle_sharp),
        actions: [
          const Icon(Icons.add), // Tambahkan const
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.ad_units) // Tambahkan const
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration( // Tambahkan const
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xC0DF7172),
                      Color(0xFF7A5151)
                    ])
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.network(
                  'https://static.vecteezy.com/system/resources/previews/026/850/474/non_2x/margherita-pizza-transparent-png.png',
                  height: 250,
                ),
              ),
              const SizedBox(height: 48), // Tambahkan const
              const Text( // Tambahkan const
                'MOBILE APPLICATION',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfilePage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF895252),
                        ),
                        child: Text('PROFILE', style: TextStyle(color: Color(0xFF070707))),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PizzaMenuPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF895252),
                        ),
                        child: Text('SHOP', style: TextStyle(color: Color(0xFF070707))),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF895252),
                        ),
                        child: Text('SIGN UP', style: TextStyle(color: Color(0xFF070707))),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF895252),
                        ),
                        child: Text('WEB VIEW', style: TextStyle(color: Color(0xFF070707))),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TextFieldPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF895252),
                        ),
                        child: Text('TEXT FIELD', style: TextStyle(color: Color(0xFF070707))),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF895252),
                        ),
                        child: Text('DASHBOARD', style: TextStyle(color: Color(0xFF070707))),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SensorPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF895252),
                        ),
                        child: Text('SENSOR', style: TextStyle(color: Color(0xFF070707))),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ActuatorPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF895252),
                        ),
                        child: Text('Actuator', style: TextStyle(color: Color(0xFF070707))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}