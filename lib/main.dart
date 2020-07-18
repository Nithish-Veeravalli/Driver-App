import 'package:flutter/material.dart';
import 'package:priority_pulse/HomePage.dart';
import 'router.dart' as router;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:priority_pulse/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() {
  runApp(MyApp());
}

const double CAMERA_ZOOM = 30;
const double CAMERA_TILT = 85;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(16.758018, 81.802989);
const LatLng DEST_LOCATION = LatLng(12.9879350, 77.5942624);
String googleAPIKey = 'YOUR API-KEY';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: router.generateRoute,
    );
  }
}


class AuthService {
  //Handles Auth
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginPage();
          }
        });
  }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //SignIn
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }
}





