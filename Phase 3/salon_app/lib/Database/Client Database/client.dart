import 'package:salon_app/Database/user.dart';

class Client extends User {
  String location;
  String wallet;
  String favourites;

  Client(
      String userID,
      String cellphone,
      String role,
      String email,
      String gender,
      String name,
      String surname,
      this.favourites,
      this.wallet,
      this.location)
      : super(userID, name, surname, email, cellphone, role, gender);
}
