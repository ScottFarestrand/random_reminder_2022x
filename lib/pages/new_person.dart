import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
class NewPerson extends StatefulWidget {
  const NewPerson({Key? key}) : super(key: key);
  final String title = 'Add New Person';
  @override
  _NewPersonState createState() => _NewPersonState();
}

class _NewPersonState extends State<NewPerson> {
  final _formKey = GlobalKey<FormState>();

  final anniversaryDateController = TextEditingController();
  final birthDateController = TextEditingController();
  // final firstNameController = TextEditingController();
  // final lastNameController = TextEditingController();
  var  _currentSliderValue = 0;
  String dropdownValue = 'None';
  var anniversaryVisibility = false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        // title: Text('My Title'),
      ),
      body: Form(
        key: _formKey,
        child: Column(children: [
          buildNameRow(context),
          buildBirthDateRow(context),
          buildAnniversaryDateColumn(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: const Text(" Save "),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel"),
                  ),
                ),
              ),
            ],
          ),
        ],),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(title: Text('My Title'),),
    //   body: Center(child: Text('Mu Text'),
    //   ),
    // );
  }


  Column buildAnniversaryDateColumn(BuildContext context) {
    return Column(
      children: [
        Text('Number of Random Reminders: $_currentSliderValue'),
        Slider(
          value: _currentSliderValue.toDouble(),
          max: 9,
          divisions: 9,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value.toInt();
            });
          },
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .48,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Type of Anniversary'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .48,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      setState(() {
                        if (newValue == 'None') {
                          anniversaryVisibility = false;
                        }
                        else{
                          anniversaryVisibility = true;
                        }
                      });

                    });
                  },
                  items: <String>['None',  'Adoption', 'Employement', 'Friendship', 'Marriage']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Visibility(
              visible: anniversaryVisibility,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .48,
                child: const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text('Anniversary Date'),
                ),
              ),
            ),
            Visibility(
              visible: anniversaryVisibility,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .48,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => _showDatePicker(context, anniversaryDateController ),
                    child: Text(( anniversaryDateController.text != '' )
                        ? anniversaryDateController.text
                        : 'Enter Anniversary Date'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row buildBirthDateRow(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .48,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Birth Date'),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .48,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => _showDatePicker(context, birthDateController ),
              child: Text((  birthDateController.text != '' )
                  ? birthDateController.text
                  : 'Enter Birth Date'),
            ),
          ),
        ),
      ],
    );
  }

  Row buildNameRow(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    return Row(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * .48,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
              decoration: const InputDecoration(labelText: 'First Name'),
              controller: firstNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter a First Name';
                }
                return null;
              }
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * .48,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
              decoration: const InputDecoration(labelText: 'Last Name'),
              controller: lastNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter a Last Name';
                }
                return null;
              }
          ),
        ),
      ),
    ],);
  }

  void _showDatePicker( ctx, TextEditingController tec ) {
    DateTime newDate = DateTime.now();
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          height: 500,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (val) {
                      setState(() {
                        newDate = val;

                      });
                    }),
              ),

              // Close the modal
              CupertinoButton(
                  child: const Text('OK'),
                  onPressed: () {
                    setState(() {
                      tec.text =  DateFormat('EEEE MMMM d, yyyy').format(newDate);
                    });
                    Navigator.of(ctx).pop();

                  }
              )
            ],
          ),
        ));
  }
}
