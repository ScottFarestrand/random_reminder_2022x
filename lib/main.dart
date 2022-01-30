import 'package:flutter/material.dart';

import './widgets/user_transaction.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Reminder',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Reminder'),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: UserTransactions(),
          ),
        ),
      )
    );
  }
}
