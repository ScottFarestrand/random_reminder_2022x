import 'package:flutter/material.dart';
import 'new_reminder.dart';
import 'reminder_list.dart';
import '../models/person.dart';

class UserTransactions extends StatefulWidget {


  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewReminder(_addNewPerson),
      ReminderList(_reminders),
    ],);
  }
}
