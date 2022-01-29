import 'package:flutter/material.dart';
import '../models/person.dart';

class ReminderList extends StatelessWidget {
  final List<Person> reminders;
  ReminderList(this.reminders);

  @override



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: reminders.map((person) {
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
      }).toList(),),);
  }
}

