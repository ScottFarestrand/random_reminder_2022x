import 'package:intl/intl.dart';
class Person {
  final String id;
  final String firstName;
  final String lastName;
  final int numberOfReminders;
  final DateTime birthDate;
  final DateTime anniversaryDate;
  final String annivesaryType;
  String formattedAnniversary = '';
  String test = '';



  Person(
      {
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.numberOfReminders,
        required this.birthDate,
        required this.anniversaryDate,
        required this.annivesaryType,
      });

  String get formattedAnniversaryDate{
    final DateFormat formatter = DateFormat('MM-dd-yyyy');
    return formatter.format(anniversaryDate);
  }

  String get formattedBirthDate{
    final DateFormat formatter = DateFormat('MMM-dd');
    if (birthDate.day == 1 ) {
      return formatter.format(birthDate) + 'st';
    }
    if (birthDate.day == 2) {
      return formatter.format(birthDate) + 'nd';
    }
    if (birthDate.day == 3) {
      return formatter.format(birthDate) + 'rd';
    }
    return formatter.format(birthDate) + 'th';
  }

  String get formattedReminderCount{
    return 'Random Reminders: ' + numberOfReminders.toString();
}


}
