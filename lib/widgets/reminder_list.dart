import 'package:flutter/material.dart';
import '../models/person.dart';

class ReminderList extends StatelessWidget {
  final List<Person> reminders;
  ReminderList(this.reminders);

  @override


  // final List<Person> _reminders = [Person(
  //   id: 'P1',
  //   name: 'KiLee Farestrand',
  //   numberOfReminders: 9,
  //   birthDate: DateTime(1944, 08, 3),
  //   anniversaryDate: DateTime(1994, 10, 30),
  //   annivesaryType: 'Married'),
  // ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView(children: reminders.map((person) {
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
                        Text(person.name, style: TextStyle(fontSize: 19),),
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
                    width: MediaQuery.of(context).size.width * .25,
                  ),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(person.formattedAnniversaryDate),
                        Text(person.formattedBirthDate),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * .15,
                  )
                ],)
              ],),
            ),
          ),
        );
      }).toList(),),);
  }
}

