import 'package:flutter/material.dart';import 'package:geolocator/geolocator.dart';class LocationController{  //  // ///get current location lat and lng  // static Future<Position> getCurrentPosition() async {  //   Position curretPossion;  //   await Geolocator.getCurrentPosition(  //       desiredAccuracy: LocationAccuracy.high)  //       .then((Position position) {  //    curretPossion = position;  //    return curretPossion;  //   }).catchError((e) {  //     debugPrint(e);  //   });  //  //   return curretPossion!;  // }}