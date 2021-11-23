<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
=======
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
>>>>>>> 3c27f27b47b062f092991bd418d5d940de9e1f75

// import 'package:royal_salon/routes/routes.dart';

<<<<<<< HEAD
class FindSalon extends StatelessWidget {
  const FindSalon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(RouteManager.mapPage);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.purple,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Find a salon'),
              SizedBox(width: 15),
              Icon(Icons.search_off_outlined)
            ],
          ),
        ),
      ),
    );
  }
}

class SelectSalon extends StatefulWidget {
  const SelectSalon({Key? key}) : super(key: key);

  @override
  _SelectSalonState createState() => _SelectSalonState();
}

class _SelectSalonState extends State<SelectSalon> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Find a Salon'),
        ),
        backgroundColor: Colors.cyan[100],
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  color: Colors.blue,
                  height: 50,
                  width: 150,
                  //text control
                  child: const Text('Enter your location'),
                ),
              ),
            ),
            Container(
              color: Colors.red,
              height: 250,
              width: 250,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    IconButton(
                      icon: const Icon(Icons.pin_drop_outlined),
                      onPressed: showBottomSheet,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IconButton(
                      icon: const Icon(Icons.home_work_outlined),
                      onPressed: showBottomSheet1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
=======
// class FindSalon extends StatelessWidget {
//   const FindSalon({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[50],
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.of(context).pushNamed(RouteManager.findsalonPage);
//           },
//           style: ElevatedButton.styleFrom(
//             primary: Colors.purple,
//           ),
//           child: const Text('Find a salon'),
//         ),
//       ),
//     );
//   }
// }

// class SelectSalon extends StatefulWidget {
//   const SelectSalon({Key? key}) : super(key: key);

//   @override
//   _SelectSalonState createState() => _SelectSalonState();
// }
>>>>>>> 3c27f27b47b062f092991bd418d5d940de9e1f75

// class _SelectSalonState extends State<SelectSalon> {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: const Text('Find a Salon'),
//         ),
//         backgroundColor: Colors.cyan[100],
//         body: Column(
//           children: [
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(40.0),
//                 child: Container(
//                   color: Colors.blue,
//                   height: 50,
//                   width: 150,
//                   //text control
//                   child: const Text('Enter your location'),
//                 ),
//               ),
//             ),
//             Container(
//               color: Colors.red,
//               height: 250,
//               width: 250,
//               child: Center(
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 30,
//                     ),

//                     IconButton(
//                       icon: const Icon(Icons.home_work_outlined),
//                       onPressed: showBottomSheet,
//                     ),

//                     const SizedBox(
//                       height: 10,
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.home_work_outlined),
//                       onPressed: showBottomSheet1,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );

//   void showBottomSheet1() => showModalBottomSheet(
//       enableDrag: false,
//       isDismissible: false,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(24),
//           topRight: Radius.circular(24),
//         ),
//       ),
//       barrierColor: Colors.orange.withOpacity(0.2),
//       context: context,
//       builder: (context) => SizedBox(
//             height: 180,
//             child: Column(
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       'Salon name',
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text('Salon Address')
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.of(context)
//                               .pushNamed(RouteManager.servicesPage);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.purple,
//                         ),
//                         child: const Text('Services'),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.of(context)
//                               .pushNamed(RouteManager.reviewsPage);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.purple,
//                         ),
//                         child: const Text('View Reviews'),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Navigator.of(context)
//                           //     .pushNamed(RouteManager.findsalonPage);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.purple,
//                         ),
//                         child: const Text('Get Directions'),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Navigator.of(context)
//                     //     .pushNamed(RouteManager.findsalonPage);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.purple,
//                   ),
//                   child: const Text('Add to favourites'),
//                 ),
//               ],
//             ),
//           ));

//   void showBottomSheet() => showModalBottomSheet(
//         enableDrag: false,
//         isDismissible: false,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(24),
//             topRight: Radius.circular(24),
//           ),
//         ),
//         barrierColor: Colors.orange.withOpacity(0.2),
//         context: context,
//         builder: (context) => const SizedBox(
//           height: 100,
//           child: Text(
//             'Sorry the salon will open at //time',
//             textAlign: TextAlign.center,
//           ),
//         ),
//       );
// }
