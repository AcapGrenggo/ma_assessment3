import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFDF0D0D),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/acap.jpg',
                  fit: BoxFit.cover,
                  width: 200, // Reduced width
                  height: 300, // Reduced height to match width
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: const Color(0x7CE33653),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Name: ASYRAF EIMAN BIN MAZLAN",
                        style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Text("ID Number: DFI2401001",
                        style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Text("Email: romeoasyraf05@gmail.com",
                        style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Text("Phone: 013-7672678",
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}