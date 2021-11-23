import 'package:salon_app/Database/user.dart';

class SalonOwner extends User {
  String salonName;
  String workingSchedule;
  String location;

  SalonOwner(
      String userID,
      String cellphone,
      String role,
      String email,
      String gender,
      String name,
      String surname,
      this.salonName,
      this.workingSchedule,
      this.location)
      : super(userID, name, surname, email, cellphone, role, gender);
}
