import 'package:flutter/material.dart';

class Defaults {
  //client menu
  static final Color drawerItemColor = Colors.blueGrey;
  static final Color? drawerItemSelectedColor = Colors.blue[700];
  static final Color? drawerSelectedTileColor = Colors.blue[100];

  static final drawerItemText = [
    'Inbox',
    'Bookings',
    'Favourites',
    'Wallet',
    'Account Settings',
  ];

  static final drawerItemIcon = [
    Icons.inbox,
    Icons.send,
    Icons.star,
    Icons.account_balance_wallet,
    Icons.settings
  ];

  //salon owner menu
  static final drawerItemText1 = [
    'Inbox',
    'Reviews',
    'Promotions',
    'Schedule',
    'Wallet',
    'Account Settings',
  ];

  static final drawerItemIcon1 = [
    Icons.inbox,
    Icons.send,
    Icons.star,
    Icons.timer,
    Icons.account_balance_wallet,
    Icons.settings
  ];
}
