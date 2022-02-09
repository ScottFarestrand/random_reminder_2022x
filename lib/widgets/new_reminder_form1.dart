import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NewReminderForm extends StatefulWidget {
  const NewReminderForm({Key? key}) : super(key: key);


  @override
  _NewReminderFormState createState() => _NewReminderFormState();
}

class _NewReminderFormState extends State<NewReminderForm> {
  final inputFirstNameController = TextEditingController();
  final inputLastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  DateTime birthDate = DateTime(2016, 10, 26);
  DateTime anniversaryDate = DateTime(2016, 10, 26);


  //
  // Future<void> _selectDate(BuildContext context) async {
  //    int startyear = DateTime.now().year;
  //    int lastYear = 2022;
  //    int lastMonth = 2;
  //   startyear = startyear - 90;
  //   print(startyear);
  //   final DateTime? picked = await showDatePicker(
  //       initialDatePickerMode: DatePickerMode.year,
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(startyear, 1),
  //       lastDate: DateTime(lastYear, lastMonth, 28));
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  // }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          alignment: Alignment.bottomCenter,
          height: 250,
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


  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width *.45,
                child: TextFormField(
                    decoration: const InputDecoration(labelText: 'First Name'),
                    controller: inputFirstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter a First Name';
                      }
                      return null;
                    }
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width *.45,
                child: TextFormField(
                    decoration: const InputDecoration(labelText: 'First Name'),
                    controller: inputLastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter a Last Name';
                      }
                      return null;
                    }
                ),
              ),
            ],
          ),
          _DatePickerItem(
            children: <Widget>[
              const Text('Anniversary'),
              CupertinoButton(
                // Display a CupertinoDatePicker in date picker mode.
                onPressed: () => _showDialog(
                  CupertinoDatePicker(
                    initialDateTime: anniversaryDate,
                    mode: CupertinoDatePickerMode.date,
                    use24hFormat: true,
                    // This is called when the user changes the date.
                    onDateTimeChanged: (DateTime newDate) {
                      setState(() => anniversaryDate = newDate);
                    },
                  ),
                ),
                // In this example, the date value is formatted manually. You can use intl package
                // to format the value based on user's locale settings.
                child: Text(
                  '${anniversaryDate.month}-${anniversaryDate.day}-${anniversaryDate.year}',
                  style: const TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
            ],
          ),
          _DatePickerItem(
            children: <Widget>[
              const Text('Birth Date'),
              CupertinoButton(
                // Display a CupertinoDatePicker in date picker mode.
                onPressed: () => _showDialog(
                  CupertinoDatePicker(
                    initialDateTime: birthDate,
                    mode: CupertinoDatePickerMode.date,
                    use24hFormat: true,
                    // This is called when the user changes the date.
                    onDateTimeChanged: (DateTime newDate) {
                      setState(() => birthDate = newDate);
                    },
                  ),
                ),
                // In this example, the date value is formatted manually. You can use intl package
                // to format the value based on user's locale settings.
                child: Text(
                  '${birthDate.month}-${birthDate.day}-${birthDate.year}',
                  style: const TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
            ],
          ),

          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(content: Text('Processing Data')),
                  // );
                }
              },
              child: const Text('Press Me'),),
        ],
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
