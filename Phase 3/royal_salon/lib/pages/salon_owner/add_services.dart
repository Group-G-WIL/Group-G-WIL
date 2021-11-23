import 'package:flutter/material.dart';
import 'package:royal_salon/widgets/app_textfield.dart';
import 'package:royal_salon/widgets/dialogs.dart';

class ServiceAdd extends StatefulWidget {
  const ServiceAdd({Key? key}) : super(key: key);

  @override
  _ServiceAddState createState() => _ServiceAddState();
}

class _ServiceAddState extends State<ServiceAdd> {
  late TextEditingController hairStyle;
  late TextEditingController price;

  @override
  void initState() {
    super.initState();
    hairStyle = TextEditingController();
    price = TextEditingController();
  }

  @override
  void dispose() {
    hairStyle.dispose();
    price.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[600],
        elevation: 10.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40.0),
                      child: Text(
                        'Add A New service!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25),
                      ),
                    ),
                    AppTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: hairStyle,
                      labelText: 'Please enter the Hairstyle name',
                    ),
                    AppTextField(
                      hideText: false,
                      keyboardType: TextInputType.number,
                      controller: price,
                      labelText: 'Please enter the style price',
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          size: 100,
                        )),
                    const SizedBox(
                      height: 55,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (hairStyle.text.isEmpty || price.text.isEmpty) {
                          showSnackBar(context, 'Please Enter all fields');
                        } else {
                          showSnackBar(context, 'Saved!');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                      ),
                      // ignore: prefer_const_constructors
                      child: Text('Add Service'),
                    ),
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
