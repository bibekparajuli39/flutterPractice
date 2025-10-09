import 'package:flutter/material.dart';

class Notepad extends StatelessWidget {
  const Notepad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NOTES",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 10,
              shadowColor: Colors.blueAccent,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(children: [Text("this is notepad logo")]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
