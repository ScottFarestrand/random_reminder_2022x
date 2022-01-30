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
      child: ListView.builder(itemCount: reminders.length,
      itemBuilder: (context, index ){
        return SizedBox(
          height: 60,
          child: Card(
            elevation: 0,
            child: Row(children: [
              Row(children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(reminders[index].name, style: TextStyle(fontSize: 19),),
                      Text(reminders[index].FormattedReminderCount),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(reminders[index].annivesaryType),
                      Text('BirthDate')
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * .25,
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(reminders[index].formattedAnniversaryDate),
                      Text(reminders[index].formattedBirthDate),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * .25,
                ),
              ],)
            ],),
          ),
        );
      }),
    );
  }
}

