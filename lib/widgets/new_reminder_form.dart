import 'package:flutter/material.dart';

class NewReminderForm extends StatefulWidget {
  const NewReminderForm({Key? key}) : super(key: key);


  @override
  _NewReminderFormState createState() => _NewReminderFormState();
}

class _NewReminderFormState extends State<NewReminderForm> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){},
      child: Text('Press Me!')
    );
  }
}
