// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class Localisation extends StatelessWidget {
//   final double latitude;
//   final double longitude;

//   const Localisation({
//     required this.latitude,
//     required this.longitude,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       child: FlutterMap(
//         options: MapOptions(
//           center: LatLng(latitude, longitude),
//           zoom: 12.0,
//         ),
//         layers: [
//           TileLayerOptions(
//             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             subdomains: ['a', 'b', 'c'],
//           ),
//           MarkerLayerOptions(
//             markers: [
//               Marker(
//                 width: 40.0,
//                 height: 40.0,
//                 point: LatLng(latitude, longitude),
//                 builder: (ctx) => Container(
//                   child: Icon(
//                     Icons.location_pin,
//                     color: Colors.red,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
