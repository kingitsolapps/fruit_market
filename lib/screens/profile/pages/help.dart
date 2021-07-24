import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'This is help page. This is help page. This is help page. This is help page. This is help page. This is help page. This is help page. This is help page. This is help page. This is help page. This is help page. This is help page. This is help page. This is help page. ',
            style: TextStyle(
              fontSize: 18,
              height: 1.7,
            ),
          ),
        ),
      ),
    );
  }
}
