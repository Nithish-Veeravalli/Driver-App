import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
//import 'package:priority_pulse/Login.dart';
import 'main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http ;
import 'dart:io';
import 'dart:convert';





class PresentRide extends StatefulWidget {
  final int mobileNo;
  const PresentRide({Key key, this.mobileNo}) : super(key: key);
  @override
  _PresentRideState createState() => _PresentRideState();
}

class _PresentRideState extends State<PresentRide> {
  String patientName,caseP,patientmobileNo;
  int age;
  bool tapped = false;
  PickResult res;
  Location location;
  LatLng destinationlocation;
  LatLng sourcelocation;
  LocationData currentLocation;
  LocationData destinationLocation;
  @override
  void initState() {
    super.initState();
    setUserLocation();
    _makeGetRequest();
  }


  void setUserLocation() async {
    // set the initial location by pulling the user's
    // current location from the location's getLocation()
    currentLocation = await location.getLocation();
    setState(() {
      sourcelocation = LatLng(currentLocation.latitude, currentLocation.longitude);
    });

  }

  void setDestLocation()  {
    setState(() {
      // hard-coded destination for this example
      destinationlocation = LatLng(res.geometry.location.lat, res.geometry.location.lng);
    });
    print(sourcelocation);
    print('$destinationlocation');
    Navigator.pushNamed(context, '/directions',arguments: destinationlocation);

  }



  @override
  Widget build(BuildContext context) {
    LatLng initialposition = SOURCE_LOCATION;
    if (currentLocation != null){
      initialposition = sourcelocation;
    }
    return Scaffold(
        body: SafeArea(child:Stack(
          children: <Widget>[
            SpinKitChasingDots(
              size: 50 ,
              color: Colors.orange,
            ),
            PlacePicker(apiKey: googleAPIKey,
              useCurrentLocation: true,
              initialPosition:initialposition,
              onPlacePicked: (result) {
                res = result;
                setDestLocation();
              },
            ),
            Positioned(top:150 ,right: 15,
            child: new GestureDetector(
              onTap: (){
                setState(() {
                  tapped = true;
                });
              },
              child:Container(height: 35,width: 35,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                offset: Offset(5.0, 5.0),
                color: Colors.black26,
                blurRadius: 5.0,
              )
            ],
                color: Colors.white,shape: BoxShape.circle
            ),
              child: Padding(padding: EdgeInsets.all(4),
              child: Image.asset('assets/profile icon.png'),),
            ),)),
            Padding(padding: EdgeInsets.only(bottom: 10),
              child:Align(alignment: Alignment.bottomCenter,
              child:tapped? Container(height: 170,width: MediaQuery.of(context).size.width*0.85,
            decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(5.0, 5.0),
                  color: Colors.black26,
                  blurRadius: 5.0,
                ),
                BoxShadow(
                  offset: Offset(-5.0, 5.0),
                  color: Colors.black26,
                  blurRadius: 5.0,
                )
              ],
            ),
            child:Padding(padding: EdgeInsets.all(10),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Text('Patient Details',style: TextStyle(fontSize: 20,decoration: TextDecoration.underline,),),
              Text('Name: $patientName',style: TextStyle(fontSize: 14,),),
              Text('Age: $age',style: TextStyle(fontSize: 14,),),
              Text('Case: $caseP',style: TextStyle(fontSize: 14,),),
              Text('Mobile No: $patientmobileNo',style: TextStyle(fontSize: 14,),),
                Align(alignment: Alignment.bottomCenter,
                  child:RaisedButton(onPressed: (){
                  setState(() {
                    tapped = false;
                  });
                },
                    color: Color.fromRGBO(244, 93, 2, 1),
                  child: Text('OK'),
                )
                )],),)):
                Container())

            )],
        )
        ));
  }

  var client = http.Client();
// POST
  _makeGetRequest() async {
    final response = await http.get(_localhost());
    var patientDetails = jsonDecode(response.body);
    print(patientDetails);
    setState(() {
      patientName = patientDetails.username;
      patientmobileNo =   patientDetails.patientmobileNo;
      caseP = patientDetails.caseP;
      //age
    });
    client.close();
  }
  String _localhost() {
    if (Platform.isAndroid)
      return 'http://10.0.2.2:7000/api/location';
    else // for iOS simulator
      return 'http://localhost:7000/api/location';
  }

}