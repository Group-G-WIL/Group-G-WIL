// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'app_textfield.dart';

class PaymentAlert extends StatelessWidget {
  const PaymentAlert({
    Key? key,
    required this.firstController,
    required this.firstHeaderText,
    required this.secondController,
    required this.secondHeaderText,
    required this.thirdController,
    required this.thirdHeaderText,
    required this.forthController,
    required this.forthHeadText,
    required this.actions,
  }) : super(key: key);

  final TextEditingController firstController;
  final TextEditingController secondController;
  final TextEditingController thirdController;
  final TextEditingController forthController;

  final String firstHeaderText;
  final String secondHeaderText;
  final String thirdHeaderText;
  final String forthHeadText;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle: const TextStyle(
        fontSize: 10.0,
      ),
      contentPadding: EdgeInsets.zero,
      content: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Add Your Card To Pay',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
          ),
          AppTextField(
            focusedBorderColor: Colors.purple,
            enabledBorderColor: Colors.blue,
            keyboardType: TextInputType.text,
            controller: firstController,
            textFieldHeaderColor: Colors.black,
            textFieldColor: Colors.black,
            textFieldHeader: firstHeaderText,
            textFieldHeaderFlex: 1,
            textFieldFlex: 4,
            // labelText: name,
          ),
          AppTextField(
            focusedBorderColor: Colors.purple,
            enabledBorderColor: Colors.blue,
            keyboardType: TextInputType.text,
            controller: secondController,
            textFieldHeaderColor: Colors.black,
            textFieldColor: Colors.black,
            textFieldHeader: secondHeaderText,
            textFieldHeaderFlex: 1,
            textFieldFlex: 4,
            //labelText: surname,
          ),
          AppTextField(
            focusedBorderColor: Colors.purple,
            enabledBorderColor: Colors.blue,
            keyboardType: TextInputType.phone,
            controller: thirdController,
            textFieldHeaderColor: Colors.black,
            textFieldColor: Colors.black,
            textFieldHeader: thirdHeaderText,
            textFieldFlex: 4,
            textFieldHeaderFlex: 1,
          ),
          AppTextField(
            focusedBorderColor: Colors.purple,
            enabledBorderColor: Colors.blue,
            keyboardType: TextInputType.phone,
            controller: forthController,
            textFieldHeaderColor: Colors.black,
            textFieldColor: Colors.black,
            textFieldHeader: forthHeadText,
            textFieldFlex: 4,
            textFieldHeaderFlex: 1,
          ),
          AppTextField(
            focusedBorderColor: Colors.purple,
            enabledBorderColor: Colors.blue,
            keyboardType: TextInputType.phone,
            controller: thirdController,
            textFieldHeaderColor: Colors.black,
            textFieldColor: Colors.black,
            textFieldHeader: thirdHeaderText,
            textFieldFlex: 4,
            textFieldHeaderFlex: 1,
          ),
        ],
      ),
      actions: actions,
    );
  }
}
