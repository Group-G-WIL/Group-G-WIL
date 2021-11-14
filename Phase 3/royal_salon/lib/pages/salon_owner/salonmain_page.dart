import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royal_salon/default/default.dart';
import 'package:royal_salon/routes/routes.dart';
import 'package:royal_salon/services/user_helper.dart';

var indexClicked = 0;

class SalonPage extends StatefulWidget {
  const SalonPage({Key? key}) : super(key: key);

  @override
  _SalonPageState createState() => _SalonPageState();
}

class _SalonPageState extends State<SalonPage> {
  final pages = const [
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Inbox'),
    ),
    Center(
      child: Text('Reviews'),
    ),
    Center(
      child: Text('Promotions'),
    ),
    Center(
      child: Text('Schedule'),
    ),
    Center(
      child: Text('Wallet'),
    ),
    Center(
      child: Text('Account Settings'),
    ),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
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
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const CircleAvatar(
                    radius: 42,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
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
                    'john@rambo.com',
                    style: GoogleFonts.sanchez(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
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
                    onTap: updateState(2),
                  ),
                  AppDrawerTile(
                    index: 3,
                    onTap:
                      updateState(3),
                  ),
                  AppDrawerTile(
                    index: 4,
                    onTap: updateState(4),
                  ),
                  AppDrawerTile(
                    index: 5,
                    onTap: updateState(5),
                  ),
                  AppDrawerTile(
                    index: 6,               
                    onTap: () {
                      updateState(6);
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
          Defaults.drawerItemIcon1[index],
          size: 35,
          color: indexClicked == index
              ? Defaults.drawerItemSelectedColor
              : Defaults.drawerItemColor,
        ),
        title: Text(
          Defaults.drawerItemText1[index],
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
