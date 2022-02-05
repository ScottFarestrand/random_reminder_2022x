import 'package:flutter/material.dart';
import './widgets/reminder_list.dart';
import './widgets/new_reminder.dart';
import './models/person.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Person> _reminders = [Person(
      id: 'P1',
      name: 'Fred Farestrand',
      numberOfReminders: 9,
      birthDate: DateTime(1944, 08, 3),
      anniversaryDate: DateTime(1994, 10, 30),
      annivesaryType: 'Married'),
  ];

  void _addNewPerson(
      String name,
      int numberOfReminders,
      DateTime birthDate,
      DateTime anniversaryDate,
      String anniversaryType,
      ){
    print("Entered");
    final newPerson = Person(
        id: DateTime.now().toString(),
        name: name,
        numberOfReminders: numberOfReminders,
        birthDate: birthDate,
        anniversaryDate: anniversaryDate,
        annivesaryType: anniversaryType);
    setState(() {
      _reminders.add(newPerson);
    });

  }


  void showInputArea(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return NewReminder(_addNewPerson);
            // return Text('Text');
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Reminder'),
        actions: [IconButton(
            onPressed: () => showInputArea(context),
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
            child: ReminderList(_reminders),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add New Reminder',
        onPressed: () => showInputArea(context),
        ),
    );
  }
}
