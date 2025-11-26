import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ActuatorPage extends StatefulWidget {
  const ActuatorPage({super.key});

  @override
  State<ActuatorPage> createState() => _ActuatorPageState();
}

class _ActuatorPageState extends State<ActuatorPage> {

  //------------- Variable declaration
  final DatabaseReference _dbRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: "https://iot-app-60eae-default-rtdb.asia-southeast1.firebasedatabase.app/",
  ).ref();

  bool switch1 = false;
  bool switch2 = false;

  //------------- Initialize page

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSwitchStatus();
  }



  //------------- Function block


  //Read current switch status
  void _loadSwitchStatus(){
    _dbRef.child('Actuator/switch1').onValue.listen((event){
      setState(() {
        switch1 = event.snapshot.value as bool? ?? false;
      });
    });

      _dbRef.child('Actuator/switch2').onValue.listen((event){
        setState(() {
          switch1 = event.snapshot.value as bool? ?? false;
        });
      });
  }

  //update Switch 1
  void _updateSwitch1(bool value){
    _dbRef.child('Actuator/switch1').set(value);
    setState(() {
      switch1 = value;
    });
  }

  //update switch 2
  void _updateSwitch2(bool value) {
    _dbRef.child('Actuator/switch2').set(value);
    setState(() {
      switch2 = value;
    });
  }

  //------------- Default Widget build

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Actuator Control'),),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            elevation:15,
            child: ListTile(
              title: Text('Switch 1'),
              subtitle: Text('Lab B1.13'),
              trailing: Switch(
                  value: switch1,
                  onChanged: (bool value){
                    _updateSwitch1(value);
                  }),
            ),
          ),
          Card(
            elevation:15,
            child: ListTile(
              title: Text('Switch 2'),
              subtitle: Text('Lab B1.13'),
              trailing: Switch(
                  value: switch2,
                  onChanged: (bool value){
                    _updateSwitch2(value);
                  }),
            ),
          )
      ],
      ),
    )
    );
  }
}
