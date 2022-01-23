import 'package:flutter/material.dart';
import '/Model/person.dart';

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
  final List<Person> people = [
    Person(
        id: 'P1',
        name: 'Sandi Farestrand',
        numberOfReminders: 9,
        birthDate: DateTime(1944, 08, 3),
        anniversaryDate: DateTime(1994, 10, 30),
        annivesaryType: 'Married'),
    // Person(
    //     id: 'P2',
    //     name: 'Luoyi Farestrand',
    //     numberOfReminders: 3,
    //     birthDate: DateTime(1996, 03, 6),
    //     anniversaryDate: DateTime(2007, 8, 05),
    //     annivesaryType: 'Adoption'),
    // Person(
    //     id: 'P3',
    //     name: 'LeeAnn Farestrand',
    //     numberOfReminders: 3,
    //     birthDate: DateTime(1996, 08, 7),
    //     anniversaryDate: DateTime(1998, 6, 30),
    //     annivesaryType: 'Adoption'),
    // Person(id: ('P4'),
    //     name: 'KiLee Farestrand',
    //     numberOfReminders: 2,
    //     birthDate: DateTime(2002, 08, 15),
    //     anniversaryDate: DateTime(2005, 10, 30),
    //     annivesaryType: 'Adoption'),
  ];
  String inputName = '';
  String inputBirthDate = '';
  String inputAnniversaryDate = '';
  String inputTypeOfAnniversary = '';
  String inputNumberofReminders = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Reminder'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                color: Colors.lightBlue,
                child: Container(

                  // margin: EdgeInsets.all(2),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Name'),
                      onChanged: (value) {inputName = value;},
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'BirthDate'),
                      onChanged: (value) {inputBirthDate = value;},
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Type of anniversary'),
                      keyboardType: TextInputType.datetime,
                    onChanged: (value) {inputTypeOfAnniversary = value;},
                    ),
                    TextField(decoration: InputDecoration(labelText: 'Anniversary Date'),
                      keyboardType: TextInputType.datetime,
                    onChanged: (value) {inputAnniversaryDate = value;},
                    ),
                    TextField(decoration: InputDecoration(labelText: '# of Random Reminders'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {inputNumberofReminders = value;},
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(inputNumberofReminders);
                      },
                      child: Text('Press me', style: TextStyle(color: Colors.purple),),
                    )
                  ],
                  ),
                ),
              ),
              Container(
                child: Column(children: people.map((person) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 3),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    )
                  ),
                  child: SizedBox(
                    height: 60,
                    child: Card(
                      elevation: 0,
                      child: Row(children: [
                        Row(children: [
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(person.name, style: TextStyle(fontSize: 20),),
                                Text(person.FormattedReminderCount),
                              ],
                            ),
                          ),
                          // SizedBox(child: Text(person.name), width: MediaQuery.of(context).size.width * .30),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(person.annivesaryType),
                                Text('BirthDate')
                              ],
                            ),
                              width: MediaQuery.of(context).size.width * .30,
                            ),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(person.formattedAnniversaryDate),
                                Text(person.formattedBirthDate),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width * .20,
                          )
                        ],)
                      ],),
                    ),
                  ),
                );
              }).toList(),),),
            ],
          ),
        ),
      )
    );
  }
}
