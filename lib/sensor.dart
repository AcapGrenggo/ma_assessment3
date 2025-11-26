import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({super.key});

  @override
  State<SensorPage> createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {

  final DatabaseReference _dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: "https://iot-app-60eae-default-rtdb.asia-southeast1.firebasedatabase.app/",
      ).ref();

  //Variable block --------------------
  String rssiValue = '0';

  //Function block --------------------

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readSensor();
  }

  //Read data from firebase
  void _readSensor(){
    _dbRef.child('sensor/rssi').onValue.listen(
        (event){
          final Object? rssiData = event.snapshot.value;
          setState(() {
            rssiValue = rssiData.toString();
          });
        }
    );
  }


  //Default Widget build ------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor Reading'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.network_wifi,
                    size: 80,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'RSSI Sensor',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$rssiValue dBm',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
