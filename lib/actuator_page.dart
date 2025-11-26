import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class ActuatorPage extends StatefulWidget {
  const ActuatorPage({super.key});

  @override
  State<ActuatorPage> createState() => _ActuatorPageState();
}

class _ActuatorPageState extends State<ActuatorPage> {

  final DatabaseReference _dbRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
    "https://iot-app-60eae-default-rtdb.asia-southeast1.firebasedatabase.app/",
  ).ref();


  bool isAutoMode = true;
  bool ledState = false;
  bool fanState = false;
  bool buzzerState = false;

  @override
  void initState() {
    super.initState();
    _syncStatesFromFirebase();
  }

  void _syncStatesFromFirebase() {
    _dbRef.child("Control").onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        setState(() {
          String mode = (data['Mode'] ?? 'Auto');
          isAutoMode = mode == 'Auto';
          ledState = data['LED'] ?? false;
          fanState = data['FAN'] ?? false;
          buzzerState = data['Buzzer'] ?? false;
        });
      }
    });
  }

  void _toggleMode(bool auto) {
    setState(() => isAutoMode = auto);
    _dbRef.child("Control/Mode").set(auto ? "Auto" : "Manual");
  }

  void _toggleActuator(String actuator, bool currentState) {
    bool newState = !currentState;
    setState(() {
      if (actuator == "LED") ledState = newState;
      if (actuator == "FAN") fanState = newState;
      if (actuator == "Buzzer") buzzerState = newState;
    });
    _dbRef.child("Control/$actuator").set(newState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Control Actuator Office",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.blue[900],
        elevation: 4,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
              margin: const EdgeInsets.only(bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: isAutoMode
                        ? [Colors.grey.shade200, Colors.grey.shade100]
                        : [Colors.blue.shade100, Colors.blue.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Mode",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      value: isAutoMode,
                      onChanged: (value) => _toggleMode(value),
                      activeColor: Colors.green,
                      inactiveThumbColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ),


            actuatorCard("LED Strip", ledState, "LED", Icons.lightbulb),
            const SizedBox(height: 16),
            actuatorCard("FAN Relay", fanState, "FAN", Icons.ac_unit),
            const SizedBox(height: 16),
            actuatorCard("Buzzer (No Relay)", buzzerState, "Buzzer",
                Icons.volume_up),
          ],
        ),
      ),
    );
  }

  Widget actuatorCard(
      String title, bool currentState, String actuatorKey, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: isAutoMode
                ? [Colors.grey.shade200, Colors.grey.shade100]
                : currentState
                ? [Colors.green.shade100, Colors.green.shade50]
                : [Colors.red.shade100, Colors.red.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: isAutoMode
                      ? Colors.grey
                      : currentState
                      ? Colors.green[700]
                      : Colors.red[700],
                  size: 28,
                ),
                const SizedBox(width: 14),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: isAutoMode
                  ? null
                  : () => _toggleActuator(actuatorKey, currentState),
              style: ElevatedButton.styleFrom(
                backgroundColor: currentState ? Colors.green : Colors.red,
                padding:
                const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
              ),
              child: Text(
                currentState ? "ON" : "OFF",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
