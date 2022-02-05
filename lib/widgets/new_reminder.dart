import 'package:flutter/material.dart';

class NewReminder extends StatefulWidget {
  final Function addNewReminder;

  NewReminder(this.addNewReminder);

  @override
  State<NewReminder> createState() => _NewReminderState();
}

class _NewReminderState extends State<NewReminder> {
  final inputNameController = TextEditingController();

  final inputBirthDateController = TextEditingController(text: '01/01/2001');

  final inputAnniversaryDateController = TextEditingController(text: '02/02/2002');

  final inputTypeOfAnnivesaryController = TextEditingController(text: 'Type');

  final inputNumberOfRemindersController = TextEditingController(text: '9');

  DateTime currentDate = DateTime.now();

  // Future<void> _selectDate(BuildContext context) async {
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
              // onChanged: (value){
              //   print(value);
              //   inputName = value;
              //   inputNameController.text = value;
              // },
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
                widget.addNewReminder(
                  inputNameController.text,
                  9,
                  // int.parse(inputNumberOfRemindersController.text),
                  // bd,
                  DateTime.now(),
                  // ad,
                  DateTime.now(),
                  // inputTypeOfAnnivesaryController.text,
                  'Test',

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
