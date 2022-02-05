import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';
// import './widgets/new_reminder.dart';


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
  // void showInputArea(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (buildContext) {
  //         return NewReminder(addNewReminder)
  //
  //       },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Reminder'),
        actions: [IconButton(
            onPressed: () {},
            icon: Icon(
                Icons.add,
                color: Colors.black,
            ),
            tooltip: 'Add new person',
        )],
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: UserTransactions(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add New Reminder',
        onPressed: () {},
        ),
    );
  }
}
