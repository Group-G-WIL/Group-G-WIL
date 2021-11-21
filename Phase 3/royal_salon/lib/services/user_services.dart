import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:royal_salon/models/salon_entry.dart';

class UserService with ChangeNotifier {
  BackendlessUser? _currentUser;
  BackendlessUser? get currentUser => _currentUser;

  void setCurrentUserNull() {
    _currentUser = null;
  }

  String result = 'OK';

  bool _userExists = false;
  bool get userExists => _userExists;

  bool _userIsClient = true;
  bool get userIsClient => _userIsClient;

  set userExists(bool value) {
    _userExists = value;
    notifyListeners();
  }

  bool _showUserProgress = false;
  bool get showUserProgress => _showUserProgress;

  String _userProgressText = '';
  String get userProgressText => _userProgressText;

  Future<String> resetPassword(String username) async {
    _showUserProgress = true;
    _userProgressText = 'Busy sending reset instructions...please wait...';
    notifyListeners();
    await Backendless.userService
        .restorePassword(username)
        .onError((error, stackTrace) {
      debugPrint(error.toString());
      result = getHumanReadableError(error.toString());
    });
    _showUserProgress = false;
    notifyListeners();

    debugPrint(result.toString());
    return result;
  }

  Future<String> loginUser(String username, String password) async {
    _showUserProgress = true;
    _userProgressText = 'Busy logging you in...please wait...';
    notifyListeners();
    debugPrint('Logging in user: ');
    BackendlessUser? user = await Backendless.userService
        .login(username, password, true)
        .onError((error, stackTrace) {
      debugPrint(error.toString());
      result = getHumanReadableError(error.toString());
    });
    if (user != null) {
      _currentUser = user;
    }
    _showUserProgress = false;
    notifyListeners();

    debugPrint(result.toString());
    return result;
  }

  Future<String> logoutUser() async {
    _showUserProgress = true;
    _userProgressText = 'Busy signing you out...please wait...';
    notifyListeners();
    debugPrint('Logging out user: ');
    await Backendless.userService.logout().onError((error, stackTrace) {
      debugPrint(error.toString());
      result = error.toString();
    });
    _showUserProgress = false;
    notifyListeners();

    debugPrint(result);
    return result;
  }

  Future<String> checkIfUserLoggedIn() async {
    debugPrint('Checking If User Is Valid: ');
    bool? validLogin = await Backendless.userService
        .isValidLogin()
        .onError((error, stackTrace) {
      debugPrint(error.toString());
      result = error.toString();
    });

    if (validLogin != null && validLogin) {
      debugPrint('Checking User Object Id : ');
      String? currentUserObjectId = await Backendless.userService
          .loggedInUser()
          .onError((error, stackTrace) {
        debugPrint(error.toString());
        result = error.toString();
      });
      if (currentUserObjectId != null) {
        debugPrint('Find by Id: $currentUserObjectId');
        Map<dynamic, dynamic>? mapOfCurrentUser = await Backendless.data
            .of("Users")
            .findById(currentUserObjectId)
            .onError((error, stackTrace) {
          debugPrint(error.toString());
          result = error.toString();
        });
        if (mapOfCurrentUser != null) {
          _currentUser = BackendlessUser.fromJson(mapOfCurrentUser);
          notifyListeners();
        } else {
          result = 'NOT OK 1';
        }
      } else {
        result = 'NOT OK 2';
      }
    } else {
      result = 'NOT OK 3';
    }

    debugPrint('Result: $result');
    return result;
  }

  void checkIfUserExists(String username) async {
    DataQueryBuilder queryBuilder = DataQueryBuilder()
      ..whereClause = "email = '$username'";

    await Backendless.data
        .withClass<BackendlessUser>()
        .find(queryBuilder)
        .then((value) {
      if (value == null || value.isEmpty) {
        _userExists = false;
        notifyListeners();
      } else {
        _userExists = true;
        notifyListeners();
      }
    }).onError((error, stackTrace) {
      getHumanReadableError(error.toString());
    });
  }

  Future<String> createUser(BackendlessUser user) async {
    _showUserProgress = true;
    _userProgressText = 'Creating a new user...please wait...';
    notifyListeners();
    try {
      await Backendless.userService.register(user);
      SalonEntry emptyEntry = SalonEntry(
        salons: {},
        username: user.email,
        // salonName: user.getProperty('salon_name'),
        // salonAddress: user.getProperty('salon_address'),
        // salonBankingDetails: user.getProperty('salon_banking_details')
      );
      await Backendless.data
          .of('SalonEntry')
          .save(emptyEntry.toJson())
          .onError((error, stackTrace) {
        result = error.toString();
      });
    } catch (e) {
      result = getHumanReadableError(e.toString());
    }
    _showUserProgress = false;
    notifyListeners();

    debugPrint(result);
    return result;
  }

  Future<bool> checkIfClientOrSalon(String username) async {
    DataQueryBuilder queryBuilder = DataQueryBuilder()
      ..whereClause = "email = '$username'";

    await Backendless.data
        .withClass<BackendlessUser>()
        .find(queryBuilder)
        .then((value) {
      if (value == null || value.isEmpty) {
        _userIsClient = false;
        notifyListeners();
      } else {
        _userIsClient = true;
        notifyListeners();
      }
    }).onError((error, stackTrace) {
      getHumanReadableError(error.toString());
    });

    debugPrint(result);
    return _userIsClient;
  }

  Future<String> update(String index, String change) async {
    _showUserProgress = true;
    _userProgressText = 'Updating user data...please wait...';
    BackendlessUser user = BackendlessUser();

    notifyListeners();
    try {
      await Backendless.userService.getCurrentUser().then((value) {
        if (value != null) {
          value.setProperty(index, change);
          notifyListeners();
        } else {
          result = 'NOT OK 6';
        }
      });
    } catch (e) {
      result = getHumanReadableError(e.toString() + '  6');
    }

    debugPrint('Current name: ${user.getProperty('name')}');
    // BackendlessUser user = new BackendlessUser();

    // user.setProperty("age", 32);
    // Backendless.userService.update(user).then((user) {
    //   debugPrint("User has been updated");
    //   debugPrint("Age - ${user!.getProperty("age")}");
    // });

    try {
      Backendless.userService.update(user).onError((error, stackTrace) {
        result = getHumanReadableError(error.toString());
      });
    } catch (e) {
      result = getHumanReadableError(e.toString() + '  7');
    }
    //result = '5: no null yet';
    _showUserProgress = false;
    notifyListeners();

    debugPrint(result);
    return result;
  }
}

String getHumanReadableError(String message) {
  if (message.contains('email address must be confirmed first')) {
    return 'Please check your inbox and confirm your email address and try to login again.';
  }
  if (message.contains('User already exists')) {
    return 'This user already exists in our database. Please create a new user.';
  }
  if (message.contains('Invalid login or password')) {
    return 'Please check your username or password. The combination do not match any entry in our database.';
  }
  if (message
      .contains('User account is locked out due to too many failed logins')) {
    return 'Your account is locked due to too many failed login attempts. Please wait 30 minutes and try again.';
  }
  if (message.contains('Unable to find a user with the specified identity')) {
    return 'Your email address does not exist in our database. Please check for spelling mistakes.';
  }
  if (message.contains(
      'Unable to resolve host "api.backendless.com": No address associated with hostname')) {
    return 'It seems as if you do not have an internet connection. Please connect and try again.';
  }
  return message;
}
