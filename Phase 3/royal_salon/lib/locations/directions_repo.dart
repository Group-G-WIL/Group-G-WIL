// import 'package:dio/dio.dart';
//import 'package:royal_salon/.env.dart';
// import 'package:royal_salon/locations/directions_model.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class DirectionsRepository {
//   static const String path =
//       'https://maps.googleapis.com/maps/api/directions/json?';

//   final Dio? _dio;

//   DirectionsRepository(Dio? dio) : _dio = dio;

//   Future<Directions?> getDirections({
//     required LatLng origin,
//     required LatLng destination,
//   }) async {
//     final response = await _dio!.get(
//       path,
//       queryParameters: {
//         'origin': '${origin.latitude},${origin.longitude}',
//         'destination': '${destination.latitude},${destination.longitude}',
//         'key': googleAPIKey,
//       },
//     );

//     // Check if response is successful
//     if (response.statusCode == 200) {
//       return Directions.fromMap(response.data);
//     }
//     return null;
//   }
// }
