import 'package:flutter/material.dart';
import 'package:priority_pulse/PresentRide.dart';
import 'package:priority_pulse/Registration.dart';
import 'package:priority_pulse/HomePage.dart';
import 'package:priority_pulse/Profile.dart';
import 'package:priority_pulse/Directions.dart';
import 'package:priority_pulse/PastRides.dart';
import 'main.dart';
Route<dynamic> generateRoute(RouteSettings settings) {
  // Here we'll handle all the routing
  switch (settings.name) {
    case '/login':
      return MaterialPageRoute(builder: (context) => AuthService().handleAuth());
    case '/registration':
      return MaterialPageRoute(builder: (context) => RegistrationPage());
    case '/home':
      return MaterialPageRoute(builder: (context) => HomePage());
    case '/profile':
      return MaterialPageRoute(builder: (context) => ProfilePage(mobileNo: settings.arguments));
    case '/presentride':
      return MaterialPageRoute(builder: (context) => PresentRide(mobileNo: settings.arguments));
    case '/past rides':
      return MaterialPageRoute(builder: (context) => PastRides());
    case '/directions':
      return MaterialPageRoute(builder: (context) => DirectionsPage(data: settings.arguments));
      default:
      return MaterialPageRoute(builder: (context) => AuthService().handleAuth());
  }
}