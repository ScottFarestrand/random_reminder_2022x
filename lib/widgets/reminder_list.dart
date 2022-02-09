import 'package:flutter/material.dart';
import '../models/person.dart';

class ReminderList extends StatelessWidget {
  final List<Person> reminders;
  const ReminderList(this.reminders);

  @override

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      child: ListView.builder(itemCount: reminders.length,
      itemBuilder: (context, index ){
        return SizedBox(
          height: 70,
          child: Card(
            elevation: 0,
            child: Row(children: [
              Row(children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(reminders[index].firstName, style: const TextStyle(fontSize: 19),),
                      Text(reminders[index].formattedReminderCount),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(reminders[index].annivesaryType),
                      const Text('BirthDate')
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

