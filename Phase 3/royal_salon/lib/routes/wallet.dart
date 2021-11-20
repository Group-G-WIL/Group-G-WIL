import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DropdownMenuItem(
          child: ListView(
            children:[
              Card(
                child: ListTile(
                  leading: Image.asset('assets/images/logo.jpg'),
                  title: const Text('Mastercard'),
                  onTap: (){},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset('assets/images/logo.jpg'),
                  title: const Text('Cash'),
                  onTap: (){},
                ),
              ),
            ] 
          ),
        ),
      ),
    );
  }
}


