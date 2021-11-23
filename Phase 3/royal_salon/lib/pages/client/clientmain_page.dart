// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';
import 'package:royal_salon/default/default.dart';
<<<<<<< HEAD
import 'package:royal_salon/routes/edit_account.dart';
import 'package:royal_salon/routes/routes.dart';
import 'package:royal_salon/services/user_helper.dart';
import 'package:royal_salon/services/user_services.dart';

import 'FindSalon/Book.dart';
import 'FindSalon/findsalon.dart';
=======
import 'package:royal_salon/pages/client/bookings.dart';
import 'package:royal_salon/pages/client/favourites.dart';
import 'package:royal_salon/routes/edit_account.dart';
import 'package:royal_salon/pages/client/find_salon/findsalon.dart';
import 'package:royal_salon/routes/wallet.dart';
import 'package:royal_salon/services/user_helper.dart';
import 'package:royal_salon/services/user_services.dart';
>>>>>>> 3c27f27b47b062f092991bd418d5d940de9e1f75

var indexClicked = 0;

class ClientMain extends StatefulWidget {
  const ClientMain({Key? key}) : super(key: key);

  @override
  _ClientMainState createState() => _ClientMainState();
}

class _ClientMainState extends State<ClientMain> {
<<<<<<< HEAD
  late String email;
  final pages = [
=======
  final pages = const [
    //
>>>>>>> 3c27f27b47b062f092991bd418d5d940de9e1f75
    FindSalon(), //please just call your state here like this dont change any thing on the body
    //

    //
    Center(
      child: Text('Inbox'), //you can remove this and only call your state
    ),

    //
<<<<<<< HEAD
    BookNow(), //you can remove this and only call your state

    Center(
      child: Text('Favourites'),
    ),

    Center(
      child: Text('Wallet'),
    ),
=======
    Booking(),
    //

    //
    Favourites(),
    //

    //
    Wallet(),
    //
>>>>>>> 3c27f27b47b062f092991bd418d5d940de9e1f75

    //
    EditAccount(),
    //
  ];

  VoidCallback updateState(int index) {
    return () {
      setState(() {
        indexClicked = index;
      });
      Navigator.pop(context);
    };
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    email = context.read<UserService>().currentUser!.email;
    debugPrint(email);

=======
    String email = context.read<UserService>().currentUser!.email;
    String name = context.read<UserService>().currentUser!.getProperty('name');
    String surname = context.read<UserService>().currentUser!.getProperty('surname');
>>>>>>> 3c27f27b47b062f092991bd418d5d940de9e1f75
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Royal Salon',
        ),
      ),
      body: pages[indexClicked],
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/drawer.jpg'),
                ),
              ),
              padding: const EdgeInsets.all(0),
              child: Container(
<<<<<<< HEAD
                child: Column(children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const CircleAvatar(
                        radius: 42,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
=======
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$name $surname',
                      style: GoogleFonts.sanchez(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      email,
                      style: GoogleFonts.sanchez(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
>>>>>>> 3c27f27b47b062f092991bd418d5d940de9e1f75
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'John Rambo',
                        style: GoogleFonts.sanchez(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        email,
                        style: GoogleFonts.sanchez(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  AppDrawerTile(
                    index: 0,
                    onTap: updateState(0),
                  ),
                  AppDrawerTile(
                    index: 1,
                    onTap: updateState(1),
                  ),
                  AppDrawerTile(
                    index: 2,
                    onTap: () {
                      updateState(2);
                      Navigator.pushNamed(context, RouteManager.bookPage,
                          arguments: Null);
                    },
                  ),
                  AppDrawerTile(
                    index: 3,
                    onTap: updateState(3),
                  ),
                  AppDrawerTile(
                    index: 4,
                    onTap: updateState(4),
                  ),
                  AppDrawerTile(
                    index: 5,
                    onTap: () {
                      updateState(5);
                      Navigator.pushNamed(context, RouteManager.editAccountPage,
                          arguments: Null);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const AppDrawerDivider(),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      logoutUserInUI(context);
                    },
                    child: Center(
                      child: Text(
                        'Log out',
                        style: GoogleFonts.sanchez(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          color: Defaults.drawerItemSelectedColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const AppDrawerDivider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawerDivider extends StatelessWidget {
  const AppDrawerDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: Defaults.drawerItemColor,
      indent: 3,
      endIndent: 3,
    );
  }
}

class AppDrawerTile extends StatelessWidget {
  const AppDrawerTile({Key? key, required this.index, required this.onTap})
      : super(key: key);

  final int index;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        onTap: onTap,
        selected: indexClicked == index,
        selectedTileColor: Defaults.drawerSelectedTileColor,
        leading: Icon(
          Defaults.drawerItemIcon[index],
          size: 35,
          color: indexClicked == index
              ? Defaults.drawerItemSelectedColor
              : Defaults.drawerItemColor,
        ),
        title: Text(
          Defaults.drawerItemText[index],
          style: GoogleFonts.sanchez(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: indexClicked == index
                ? Defaults.drawerItemSelectedColor
                : Defaults.drawerItemColor,
          ),
        ),
      ),
    );
  }
}
