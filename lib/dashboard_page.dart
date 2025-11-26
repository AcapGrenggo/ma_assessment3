import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DatabaseReference dbRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: "https://iot-app-60eae-default-rtdb.asia-southeast1.firebasedatabase.app/",
  ).ref().child('SensorData/CurrentStatus');

  double temperature = 0;
  double humidity = 0;
  double distance = 0;
  bool motion = false;
  bool fan = false;
  bool led = false;
  bool buzzer = false;
  String timestamp = '';

  @override
  void initState() {
    super.initState();
    dbRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        setState(() {
          temperature = (data['Temperature_C'] ?? 0).toDouble();
          humidity = (data['Humidity_P'] ?? 0).toDouble();
          distance = (data['Distance_cm'] ?? 0).toDouble();
          motion = data['Motion_Detected'] ?? false;
          fan = data['Fan_ON'] ?? false;
          led = data['LED_ON'] ?? false;
          buzzer = data['Buzzer_ON'] ?? false;
          timestamp = data['Timestamp'] ?? '';
        });
      }
    });
  }

  Widget sensorCard(String title, String value, Color color, IconData icon) {
    return Card(
      elevation: 6,
      shadowColor: Colors.grey.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.2), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, size: 28, color: color),
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> sensorCards = [
      sensorCard("Temperature", "${temperature.toStringAsFixed(1)} °C",
          Colors.red.shade400, Icons.thermostat),
      sensorCard("Humidity", "${humidity.toStringAsFixed(1)} %",
          Colors.blue.shade400, Icons.water_drop),
      sensorCard("Distance", "${distance.toStringAsFixed(1)} cm",
          Colors.orange.shade400, Icons.straighten),
      sensorCard("Motion", motion ? "Detected" : "None",
          Colors.purple.shade400, Icons.motion_photos_on),

      sensorCard(
          "Fan",
          fan ? "ON" : "OFF",
          Colors.green.shade400,
          fan ? Icons.air : Icons.air_outlined),
      sensorCard("LED", led ? "ON" : "OFF",
          Colors.yellow.shade700, led ? Icons.lightbulb : Icons.lightbulb_outline),
      sensorCard("Buzzer", buzzer ? "ON" : "OFF",
          Colors.pink.shade400, buzzer ? Icons.notifications_active : Icons.notifications_none),
      sensorCard("Last Update", timestamp,
          Colors.grey.shade400, Icons.access_time),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("IoT Office Dashboard"),
        backgroundColor: Colors.indigo.shade700,
        elevation: 4,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sensorCards.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // dua kad per baris
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                return sensorCards[index];
              },
            ),
            const SizedBox(height: 20),
            Text(
              "Realtime data from IoT sensors in Smart Office",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
