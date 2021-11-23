// ignore_for_file: file_names
// ignore_for_file: file_names, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:royal_salon/routes/routes.dart';
import 'package:royal_salon/widgets/dialogs.dart';
import 'package:intl/intl.dart';
import 'package:royal_salon/pages/salon_owner/promotion.dart';

class Promotions extends StatefulWidget {
  const Promotions(id, {Key? key}) : super(key: key);

  @override
  _PromotionsState createState() => _PromotionsState();
}

class _PromotionsState extends State<Promotions>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  DateTimeRange? dateRange;
  // ignore: prefer_final_fields
  PromotionsModel _promotionsModel = PromotionsModel(0, ' ', -0, '');
  final List<PromotionsModel> _promoArray = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  String getFrom() {
    if (dateRange == null) {
      return 'From';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateRange!.start);
    }
  }

  String getUntil() {
    if (dateRange == null) {
      return 'Until';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateRange!.end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          ' Promotions ',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        backgroundColor: Colors.purple[600],
        elevation: 10.0,
      ),
      body: Center(
        child: Column(children: [
          _form(),
          Row(children: [
            Expanded(
              child: ElevatedButton(
                child: Text(getFrom()),
                onPressed: () => pickDateRange(context),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                child: Text(getUntil()),
                onPressed: () => pickDateRange(context),
              ),
            )
          ]),
          ElevatedButton(
            child: const Text('Save'),
            onPressed: () => _submit(),
          ),
          _list(),
        ]),
      ),
    );
  }

  _form() => Container(
        color: Colors.amber,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  decoration: const InputDecoration(labelText: 'Style Name'),
                  onSaved: (val) => setState(
                        () {
                          _promotionsModel.promostyleName = val!;
                          (val) => (val == 0
                              ? 'Please Enter the required fiels'
                              : null);
                        },
                      )),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Promotion Dscount'),
                onSaved: (val) => setState(
                  () => _promotionsModel.promoDiscount,
                ),
                validator: (value) =>
                    (value == ' ' ? 'this fileld is required' : null),
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Name of the saloon'),
                onSaved: (val) => setState(
                  () {
                    _promotionsModel.promoSaloon = val!;
                    (val) => (val! == ' '
                        ? 'Please Enter the required fields'
                        : null);
                  },
                ),
              ),
              const SizedBox(height: 15),
              /*ElevatedButton(
              onPressed: () {
                _date();
              },
              child: Text("Date : ${date.day}:${date.month}:${date.year}"),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
                title: const Text("Select Duration od the promotion"),
                subtitle: Text("Time:\t ${time.hour}:${time.minute}"),
                trailing: const Icon(Icons.lock_clock_outlined,
                    color: Colors.red, size: 20),
                onTap: () {
                  _time();
                }),*/
            ],
          ),
        ),
      );
  _list() => Expanded(
        child: Card(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    child: Row(
                      children: [
                        Column(
                          children: const [
                            Icon(Icons.production_quantity_limits_rounded,
                                size: 40, color: Colors.red)
                          ],
                        ),
                        Column(
                          children: [
                            Text(_promoArray[index]
                                .promostyleName
                                .toUpperCase()),
                            Text(_promoArray[index].promoSaloon),
                            Text(_promoArray[index].promoDiscount.toString()),
                            Text('Special From :' + getFrom()),
                            Text('Last Date : ' + getUntil()),
                          ],
                        ),
                        Column(),
                      ],
<<<<<<< HEAD
=======
                    )
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  children: const [
                    Icon(
                      Icons.person,
                      size: 50,
                    )
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                titleTextStyle: const TextStyle(
                                  fontSize: 20.0,
                                ),
                                content: const Text(
                                    'Are you sure you want to Delete This file?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      showSnackBar(context, 'Cancelled!');
                                      Navigator.pop(context);
                                    },
                                    child: const Text(' NO '),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      showSnackBar(context, 'Deleted!');
                                      Navigator.pop(context);
                                    },
                                    child: const Text(' Yes '),
                                  ),
                                ]);
                          },
                        );
                      },
                      child: const Text('Delete'),
>>>>>>> 3c27f27b47b062f092991bd418d5d940de9e1f75
                    ),
                  ),
                  /*    ListTile(
                    leading: const Icon(
                        Icons.production_quantity_limits_rounded,
                        size: 40,
                        color: Colors.red),
                    title: Text(
                      _promoArray[index].promostyleName.toUpperCase(),
                    ),
                    subtitle: Text(_promoArray[index].promoSaloon),
                    trailing: Text(
                      'R' + _promoArray[index].promoDiscount.toString(),
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),*/
                  const Divider(
                    height: 5,
                  ),
                ],
              );
            },
            itemCount: _promoArray.length,
          ),
        ),
      );

  Future pickDateRange(BuildContext context) async {
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().day - 2),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange,
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }

  _submit() {
    var form = _formKey.currentState;
    if (form!.validate()) {
      setState(() {
        _promoArray.add(
          PromotionsModel(_promotionsModel.id, _promotionsModel.promostyleName,
              _promotionsModel.promoDiscount, _promotionsModel.promoSaloon),
        );
      });
      form.save();
    }
    form.reset();
  }
}
