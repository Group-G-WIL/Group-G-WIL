class User {
  String userID;
  String name;
  String surname;
  String email;
  String cellphone;
  String gender;
  String role;

  User(this.userID, 
    this.name,
    this.surname,
    this.email,
    this.cellphone, 
    this.role, 
    this.gender, 
    );

  String get userName {
    return name;
  }

  set userName(String value) {
    name = value;
  }

  String get userSurname {
    return surname;
  }

  set userSurname(String value) {
    surname = value;
  }

  String get userEmail {
    return email;
  }

  set userEmail(String value) {
    email = value;
  }

  String get userCellphone {
    return cellphone;
  }

  set userCellphone(String value) {
    cellphone = value;
  }

  String get userGender {
    return gender;
  }

  set userGender(String value) {
    gender = value;
  }

  String get userRole {
    return role;
  }

  set userRole(String value) {
    role = value;
  }
}
