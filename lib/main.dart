import 'package:driver/view/bottom_navigation/screen/bootom_navigation.dart';
import 'package:driver/view/flash/flash.dart';
import 'package:driver/widgets/app_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  _handleLocationPermission();
  runApp(const MyApp());
}

Future<bool> _handleLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    AppToast(text: 'Location services are disabled. Please enable the services', color: Colors.red);
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      AppToast(text: 'Location permissions are denied', color: Colors.red);
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    AppToast(text: 'Location permissions are permanently denied, we cannot request permissions.', color: Colors.red);
    return false;
  }
  return true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All One Autos',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "Poppins"
      ),
      home:  FirebaseAuth.instance.currentUser == null ? AppBottomNavigation() : Flash(),
    );
  }
}
