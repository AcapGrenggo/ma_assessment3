import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // Data contoh
  final Map<String, dynamic> sensorData = {
    "Temperature": {"value": "27°C", "icon": Icons.thermostat, "color": Colors.orangeAccent},
    "Humidity": {"value": "63%", "icon": Icons.water_drop, "color": Colors.blueAccent},
    "Air Quality": {"value": "Good", "icon": Icons.air, "color": Colors.greenAccent},
    "Voltage": {"value": "3.3V", "icon": Icons.bolt, "color": Colors.purpleAccent},
    "Motion": {"value": "Detected", "icon": Icons.motion_photos_on, "color": Colors.redAccent},
    "Gas Level": {"value": "Safe", "icon": Icons.cloud, "color": Colors.tealAccent},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050A1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "SENSOR CONTROL SYSTEM 2070",
          style: GoogleFonts.orbitron(
            color: Colors.cyanAccent,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: sensorData.length,
          itemBuilder: (context, index) {
            String key = sensorData.keys.elementAt(index);
            var item = sensorData[key];
            return _buildSensorCard(
              key,
              item["value"],
              item["icon"],
              item["color"],
            );
          },
        ),
      ),

      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A1E3F), Color(0xFF050A1A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Text(
            "System Active • Monitoring Sensors in Real-Time",
            style: GoogleFonts.orbitron(
              color: Colors.cyanAccent.withOpacity(0.8),
              fontSize: 12,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  // Kad sensor
  Widget _buildSensorCard(String title, String value, IconData icon, Color glowColor) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$title: $value',
                style: GoogleFonts.orbitron(color: Colors.white)),
            backgroundColor: const Color(0xFF0A1E3F),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF101A3E), Color(0xFF050A1A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: glowColor.withOpacity(0.4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: glowColor, size: 45),
              const SizedBox(height: 10),
              Text(
                title.toUpperCase(),
                textAlign: TextAlign.center,
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 14,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: GoogleFonts.orbitron(
                  color: glowColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 3,
                width: 40,
                decoration: BoxDecoration(
                  color: glowColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
