import 'package:flutter/material.dart';
import '../models/person.dart';
import '../widgets/new_reminder.dart';

class NewReminder extends StatelessWidget {
  final Function addNewReminder;
  final inputNameController = TextEditingController();
  final inputBirthDateController = TextEditingController();
  final inputAnniversaryDateController = TextEditingController();
  final inputTypeOfAnnivesaryController = TextEditingController();
  final inputNumberOfRemindersController = TextEditingController();
  NewReminder(this.addNewReminder);
  @override
  Widget build(BuildContext context) {


    return Card(
      color: Colors.lightBlue,
      child: Container(
        // margin: EdgeInsets.all(2),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              controller: inputNameController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'BirthDate'),
              keyboardType: TextInputType.datetime,
              controller: inputBirthDateController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Type of anniversary'),
              controller: inputTypeOfAnnivesaryController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Anniversary Date'),
              keyboardType: TextInputType.datetime,
              controller: inputAnniversaryDateController,
            ),
            TextField(
              decoration: InputDecoration(labelText: '# of Random Reminders'),
              keyboardType: TextInputType.number,
              controller: inputNumberOfRemindersController,
            ),
            ElevatedButton(
              onPressed: () {
                print("Pressed");
                print(inputBirthDateController.text);
                String xx  = inputBirthDateController.text + ' 00:00:00.000000';
                print(xx);
                xx = inputBirthDateController.text.substring(6,10) + '-' +
                     inputBirthDateController.text.substring(0,2) + '-' +
                     inputBirthDateController.text.substring(3,5);
                DateTime bd = DateTime.parse(xx);
                print(bd);
                xx = inputAnniversaryDateController.text.substring(6,10) + '-' +
                     inputAnniversaryDateController.text.substring(0,2) + '-' +
                     inputAnniversaryDateController.text.substring(3,5);
                DateTime ad = DateTime.parse(xx);
                print(ad);


                addNewReminder(
                  inputNameController.text,
                  int.parse(inputNumberOfRemindersController.text),
                  bd,
                  ad,
                  inputTypeOfAnnivesaryController.text,
                );
              },
              child: Text(
                'Press me',
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
