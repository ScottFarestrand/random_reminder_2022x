import 'package:flutter/material.dart';
import './widgets/reminder_list.dart';
import './models/person.dart';
import './pages/new_person.dart';
import 'package:flutter/cupertino.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Reminder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
           '/newperson': (context) =>  NewPerson(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Person> _reminders = [
    // Person(
    //   id: 'P1',
    //   firstName: 'Fred',
    //   lastName: 'Farestrand',
    //   numberOfReminders: 9,
    //   birthDate: DateTime(1944, 08, 3),
    //   anniversaryDate: DateTime(1994, 10, 30),
    //   annivesaryType: 'Married'),
  ];

  void _addNewPerson(
      String firstName,
      String lastName,
      int numberOfReminders,
      DateTime birthDate,
      DateTime anniversaryDate,
      String anniversaryType,
      ){
    final newPerson = Person(
        id: DateTime.now().toString(),
        firstName: firstName,
        lastName:  lastName,
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Reminder'),
        actions: [IconButton(
          onPressed: () {
            print("pushing");
            Navigator.pushNamed(context, '/newperson');
          },
            // onPressed: () => showInputArea(context),
            icon: const Icon(
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
    );
  }
}
