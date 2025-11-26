import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {

  var nameController = TextEditingController();
  String _name = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Text Field Exercise'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text('Please insert your details'),
            SizedBox(height: 20,),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Enter Your Name'
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Class',
                  hintText: 'Enter Your Class'
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Student Number',
                  hintText: 'Enter Your Student Number'
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              setState(() {
                 _name = nameController.text;
              });
            }, child: Text('Submit')), //
            SizedBox(height: 50),
            Text('My name is ${_name}')
          ],
        ),
      ),
    );
  }
}
