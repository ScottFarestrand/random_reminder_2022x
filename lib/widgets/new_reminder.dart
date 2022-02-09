import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class NewReminder extends StatefulWidget {
  final Function addNewReminder;

  const NewReminder(this.addNewReminder);

  @override
  State<NewReminder> createState() => _NewReminderState();
}

class _NewReminderState extends State<NewReminder> {
  final inputFirstNameController = TextEditingController();
  final inputLastNameController = TextEditingController();

  final inputBirthDateController = TextEditingController(text: '01/01/2001');

  final inputAnniversaryDateController = TextEditingController(text: '02/02/2002');

  final inputTypeOfAnnivesaryController = TextEditingController(text: 'Type');

  final inputNumberOfRemindersController = TextEditingController(text: '9');
  DateTime date = DateTime(2016, 10, 26);

  DateTime currentDate = DateTime.now();

  // Future<void> _selectDate(BuildContext context) async {
  @override
  Widget build(BuildContext context) {
    void _showDialog(Widget child) {
      showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) => Container(
            height: 216,
            padding: const EdgeInsets.only(top: 6.0),
            // The Bottom margin is provided to align the popup above the system navigation bar.
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // Provide a background color for the popup.
            color: CupertinoColors.systemBackground.resolveFrom(context),
            // Use a SafeArea widget to avoid system overlaps.
            child: SafeArea(
              top: false,
              child: child,
            ),
          ));
    }


    return Card(
      color: Colors.lightBlue,
      child: Container(
        // margin: EdgeInsets.all(2),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Container(
                   width: MediaQuery.of(context).size.width *.45,
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'First Name'),
                    controller: inputFirstNameController,

                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Last Name'),
                    controller: inputLastNameController,

                  ),
                ),
              ],
            ),
            // TextField(
            //   decoration: InputDecoration(labelText: 'First Name'),
            //   controller: inputFirstNameController,
            //
            // ),
            // TextField(
            //   decoration: InputDecoration(labelText: 'Last Name'),
            //   controller: inputLastNameController,
            //
            // ),
            // TextField(
            //   decoration: const InputDecoration(labelText: 'BirthDate'),
            //   keyboardType: TextInputType.datetime,
            //   controller: inputBirthDateController,
            // ),
            _DatePickerItem(
              children: <Widget>[
                const Text('Date'),
                CupertinoButton(
                  // Display a CupertinoDatePicker in date picker mode.
                  onPressed: () => _showDialog(
                    CupertinoDatePicker(
                      initialDateTime: date,
                      mode: CupertinoDatePickerMode.date,
                      use24hFormat: true,
                      // This is called when the user changes the date.
                      onDateTimeChanged: (DateTime newDate) {
                        setState(() => date = newDate);
                      },
                    ),
                  ),
                  // In this example, the date value is formatted manually. You can use intl package
                  // to format the value based on user's locale settings.

                  child: Text(
                    '${date.month}-${date.day}-${date.year}',
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Type of anniversary'),
              controller: inputTypeOfAnnivesaryController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Anniversary Date'),
              keyboardType: TextInputType.datetime,
              controller: inputAnniversaryDateController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: '# of Random Reminders'),
              keyboardType: TextInputType.number,
              controller: inputNumberOfRemindersController,
            ),
            ElevatedButton(
              onPressed: () {

                widget.addNewReminder(
                  inputFirstNameController.text,
                  inputLastNameController.text,
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
              child: const Text(
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

class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
