import 'package:backendless_sdk/backendless_sdk.dart';

import 'package:flutter/material.dart';
import 'package:myfinal_app/services/helper_salon.dart';
import 'package:myfinal_app/services/helper_home.dart';
import 'package:myfinal_app/services/todo_service.dart';
import 'package:myfinal_app/services/user_service.dart';
import 'package:myfinal_app/widgets/app_progress_indicator.dart';
import 'package:myfinal_app/widgets/promo_card.dart';
import 'package:myfinal_app/widgets/todo_card.dart';
import 'package:provider/provider.dart' as provider;
import 'package:tuple/tuple.dart';

class Promotions extends StatefulWidget {
  const Promotions({Key? key}) : super(key: key);

  @override
  _PromotionsState createState() => _PromotionsState();
}

class _PromotionsState extends State<Promotions> {
  late TextEditingController styleController;
  late TextEditingController priceController;
  late TextEditingController dayController;

  @override
  void initState() {
    super.initState();
    styleController = TextEditingController();
    priceController = TextEditingController();
    dayController = TextEditingController();
  }

  @override
  void dispose() {
    styleController.dispose();
    priceController.dispose();
    dayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.lime],
          ),
        ),
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // IconButton(
                        //   icon: Icon(
                        //     Icons.refresh,
                        //     color: Colors.white,
                        //     size: 30,
                        //   ),
                        //   onPressed: () {
                        //     refreshPromosInUI(context);
                        //   },
                        // ),
                        IconButton(
                          icon: Icon(
                            Icons.save,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () async {
                            saveAllTodosInUI(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Promotions list',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 20),
                      child: provider.Consumer<TodoService>(
                        builder: (context, value, child) {
                          return ListView.builder(
                            itemCount: value.promos.length,
                            itemBuilder: (context, index) {
                              return PromoCard(
                                promo: value.promos[index],
                                todoToggleAction: (valueStatus) async {
                                  context
                                      .read<TodoService>()
                                      .togglePromoDone(index);
                                },
                                deleteAction: () async {
                                  context
                                      .read<TodoService>()
                                      .deletePromo(value.promos[index]);
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              title: Text('Create a new promotions'),
                              content: Container(
                                height: 150,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      TextField(
                                        decoration: InputDecoration(
                                            hintText:
                                                'Please enter style name'),
                                        controller: styleController,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Please enter price'),
                                        controller: priceController,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                            hintText:
                                                'Please enter the last day of the Promo'),
                                        controller: dayController,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: Text('Save'),
                                  onPressed: () async {
                                    createNewPromoInUI(context,
                                        styleController: styleController,
                                        discountController: priceController,
                                        lastdayController: dayController);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Add more Promotions'),
                    ),
                  ),
                ],
              ),
            ),
            provider.Selector<UserService, Tuple2>(
              selector: (context, value) =>
                  Tuple2(value.showUserProgress, value.userProgressText),
              builder: (context, value, child) {
                return value.item1
                    ? AppProgressIndicator(text: value.item2)
                    : Container();
              },
            ),
            provider.Selector<TodoService, Tuple2>(
              selector: (context, value) =>
                  Tuple2(value.busyRetrieving1, value.busySaving1),
              builder: (context, value, child) {
                return value.item1
                    ? AppProgressIndicator(
                        text:
                            'Busy retrieving data from the database...please wait...')
                    : value.item2
                        ? AppProgressIndicator(
                            text:
                                'Busy saving data to the database...please wait...')
                        : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}






























// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:myfinal_app/routes/routes.dart';
// import 'package:myfinal_app/widgets/dialogs.dart';

// class Promotions extends StatefulWidget {
//   const Promotions({Key? key}) : super(key: key);

//   @override
//   _PromotionsState createState() => _PromotionsState();
// }

// class _PromotionsState extends State<Promotions>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: 805.0,
//         decoration: const BoxDecoration(
//           color: Colors.blue,
//         ),
//         child: Column(
//           children: [
//             const SizedBox(height: 15),
//             const Text(
//               'Promotions List',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Card(
//               child: Row(children: [
//                 Column(
//                   children: [
//                     Column(
//                       children: const [
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text('Product On Promo   : xxx'),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text('Promotion Discount   : xxx'),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text('Product On Promo   : xxx'),
//                         SizedBox(
//                           height: 10,
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   width: 15,
//                 ),
//                 Column(
//                   children: const [
//                     Icon(
//                       Icons.person,
//                       size: 50,
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   width: 15,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                                 titleTextStyle: const TextStyle(
//                                   fontSize: 20.0,
//                                 ),
//                                 content: const Text(
//                                     'Are you sure you want to Delete This file?'),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () {
//                                       showSnackBar(context, 'Cancelled!');
//                                       Navigator.pop(context);
//                                     },
//                                     child: const Text(' NO '),
//                                   ),
//                                   TextButton(
//                                     onPressed: () {
//                                       showSnackBar(context, 'Deleted!');
//                                       Navigator.pop(context);
//                                     },
//                                     child: const Text(' Yes '),
//                                   ),
//                                 ]);
//                           },
//                         );
//                       },
//                       child: const Text('Delete'),
//                     ),
//                   ],
//                 ),
//               ]),
//             ),
//             ElevatedButton(
//                 style: const ButtonStyle(),
//                 onPressed: () {
//                   Navigator.pushNamed(context, RouteManager.addPromo);
//                 },
//                 child: const Text('Add New promo')),
//           ],
//         ),
//       ),
//     );
//   }
// }
