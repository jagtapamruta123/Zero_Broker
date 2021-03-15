// import 'dart:async';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// class LocationService {
//   StreamSubscription locationSubscription;
//   Location locationTracker = Location();
//   Marker marker;
//   Circle circle;
//   GoogleMapController mapController;
//   BuildContext context;
//   LocationService({
//     this.locationSubscription,
//     this.locationTracker,
//     this.mapController,
//     this.circle,
//     this.context,
//     this.marker,
//   });

//   static final CameraPosition initialLocation = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   Future<Uint8List> getMarker() async {
//     ByteData byteData =
//         await DefaultAssetBundle.of(context).load("assets/car_icon.png");
//     return byteData.buffer.asUint8List();
//   }

//   void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
//     LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);

//     // this.setState(() {
//     //   marker = Marker(
//     //       markerId: MarkerId("home"),
//     //       position: latlng,
//     //       rotation: newLocalData.heading,
//     //       draggable: false,
//     //       zIndex: 2,
//     //       flat: true,
//     //       anchor: Offset(0.5, 0.5),
//     //       icon: BitmapDescriptor.fromBytes(imageData));
//     //   circle = Circle(
//     //       circleId: CircleId("car"),
//     //       radius: newLocalData.accuracy,
//     //       zIndex: 1,
//     //       strokeColor: Colors.blue,
//     //       center: latlng,
//     //       fillColor: Colors.blue.withAlpha(70));
//     // });
//   }

//   void getCurrentLocation() async {
//     try {
//       Uint8List imageData = await getMarker();
//       var location = await locationTracker.getLocation();

//       updateMarkerAndCircle(location, imageData);

//       if (locationSubscription != null) {
//         locationSubscription.cancel();
//       }

//       locationSubscription =
//           locationTracker.onLocationChanged.listen((newLocalData) {
//         if (mapController != null) {
//           mapController.animateCamera(CameraUpdate.newCameraPosition(
//               new CameraPosition(
//                   bearing: 192.8334901395799,
//                   target: LatLng(newLocalData.latitude, newLocalData.longitude),
//                   tilt: 0,
//                   zoom: 18.00)));
//           updateMarkerAndCircle(newLocalData, imageData);
//         }
//       });
//     } on PlatformException catch (e) {
//       if (e.code == 'PERMISSION_DENIED') {
//         debugPrint("Permission Denied");
//       }
//     }
//   }
// }
