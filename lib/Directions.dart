import 'dart:convert';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'directions_json_entity.dart';


class DirectionsPage extends StatefulWidget {

  final LatLng data;
  const DirectionsPage({Key key, this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DirectionsPageState();
}
class DirectionsPageState extends State<DirectionsPage> {
  String _origin;
  String _destination;
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
// for my drawn routes on the map
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> _polylineCoordinates = [];
  PolylinePoints polylinePoints;
  String encPolyline;
// for my custom marker pins
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
// the user's initial location and current location
// as it moves
  LocationData currentLocation;
// wrapper around the location API
  Location location;
  LatLng destinationlocation = LatLng(12.9879350, 77.5942624);
  @override
  void initState() {
    super.initState();
    // create an instance of Location
    location = new Location();
    polylinePoints = PolylinePoints();
    // var rotatio = LocationData().heading;

    // subscribe to changes in the user's location
    // by "listening" to the location's onLocationChanged event
    location.onLocationChanged.listen((LocationData cLoc) {
      // cLoc contains the lat and long of the
      // current user's position in real time,
      // so we're holding on to it
      currentLocation = cLoc;
      updatePinOnMap();
    });
    // set custom marker pins
    setSourceAndDestinationIcons();
    // set the initial location
    setUserLocation();
  }
  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/driving_pin.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/destination_map_marker.png');
  }
  void setUserLocation() async {
    // set the initial location by pulling the user's
    // current location from the location's getLocation()
    currentLocation = await location.getLocation();
    setState(() {
      destinationlocation = widget.data;
    });

    print('equal');

  }


  void showPinsOnMap() {
    // get a LatLng for the source location
    // from the LocationData currentLocation object
    var pinPosition = LatLng(currentLocation.latitude,
        currentLocation.longitude);
    // get a LatLng out of the LocationData object
    var destPosition = LatLng(destinationlocation.latitude,
        destinationlocation.longitude);
    // add the initial source location pin
    _markers.add(Marker(
        markerId: MarkerId('sourcePin'),
        position: pinPosition,
        icon: sourceIcon
    ));
    // destination pin
    _markers.add(Marker(
        markerId: MarkerId('destPin'),
        position: destPosition,
        icon: destinationIcon
    ));
    // set the route lines on the map from source to destination
    setPolylines();

  }
  void setPolylines() async {
    if(_polylineCoordinates.length != null)
      _makeGetRequest();
    setState(() {
      // showPinsOnMap();
      _polylines.add(Polyline(
          width: 10, // set the width of the polylines
          polylineId: PolylineId("poly"),
          color: Color.fromRGBO(26, 115, 232, 1),
          points: _polylineCoordinates
      ));
    });
  }
  void updatePinOnMap() async {

    // create a new CameraPosition instance
    // every time the location changes, so the camera
    // follows the pin as it moves with an animation
//    CameraPosition cPosition = CameraPosition(
//     zoom: CAMERA_ZOOM,
//     tilt: CAMERA_TILT,
//    bearing: CAMERA_BEARING,
//     target: LatLng(currentLocation.latitude,
//    currentLocation.longitude),
//    );
//    final GoogleMapController controller = await _controller.future;
//    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
//    // do this inside the setState() so Flutter gets notified
    // that a widget update is due
    setState(() {
      // updated position
      var pinPosition = LatLng(currentLocation.latitude,
          currentLocation.longitude);

      // the trick is to remove the marker (by id)
      // and add it again at the updated location
      _markers.removeWhere(
              (m) => m.markerId.value == 'sourcePin');
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: pinPosition, // updated position
          icon: sourceIcon
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target:  LatLng(0,0),
    );
    if (currentLocation != null) {
      initialCameraPosition = CameraPosition(
          target: LatLng(currentLocation.latitude,
              currentLocation.longitude),
          zoom: CAMERA_ZOOM,
          tilt: CAMERA_TILT,
          bearing: CAMERA_BEARING
      );
    }
    return SafeArea(
      child: Scaffold(body: Stack(
        children: <Widget>[
          SpinKitRing(
            size: 50,
            color: Colors.blue,
          ),
          GoogleMap(
              myLocationEnabled: true,
              compassEnabled: true,
              tiltGesturesEnabled: false,
              markers: _markers,
              polylines: _polylines,
              mapType: MapType.normal,
              trafficEnabled : false,
              initialCameraPosition: initialCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                //controller.setMapStyle(mapStyle)
                // my map has completed being created;
                // i'm ready to show the pins on the map
                showPinsOnMap();
              }),
          Positioned(left: MediaQuery
              .of(context)
              .size
              .width * 0.4,
              bottom: MediaQuery
                  .of(context)
                  .size
                  .height * 0.03,
              child: RaisedButton(
                color: Color.fromARGB(255, 40, 122, 198),
                textColor: Colors.white,
                onPressed: () {
                  print('clicked');
                  _makePostRequest();
                },
                child: Text('Request'),
              ))

        ],

      )


      ),
    );
  }
  var client = http.Client();
  //POST
  _makePostRequest() async {
    // set up POST request arguments
    // String _json = '{"polyline": "$encPolyline","driverLocation": "[${currentLocation.latitude},${currentLocation.longitude}]","destinationLocation": "[${destinationlocation.latitude},${destinationlocation.longitude}]"}';
    // make POST request
    var response = await   client.post(_localhost(),
        headers: {'Content-Type':'application/json'},
        body: json.encode({"polyline": "$encPolyline",
          "driverLocation": [currentLocation.latitude,currentLocation.longitude],
          "destinationLocation": [destinationlocation.latitude,destinationlocation.longitude]
        }));
    print('Response:$response');
    client.close();
  }
  String _localhost() {
    if (Platform.isAndroid)
      return 'http://10.0.2.2:7000/api/location';
    else // for iOS simulator
      return 'http://localhost:7000/api/location';
  }



  _makeGetRequest() async {
    List<List<num>> totalPoints =[] ;
    //List<LatLng> polylineCoordinates=[ ];
    _origin= ' ${currentLocation.latitude},${currentLocation.longitude}';
    print('origin :$_origin');
    _destination= ' ${destinationlocation.latitude},${destinationlocation.longitude}';
    print('destination: $_destination');
    final response = await http.get('https://maps.googleapis.com/maps/api/directions/json?origin=$_origin&destination=$_destination&key=$googleAPIKey');
    Map<String, dynamic> dataResponse = jsonDecode(response.body);

    DirectionsJsonEntity dataclass = DirectionsJsonEntity().fromJson(dataResponse);
    for (int i=0;i< dataclass.routes[0].legs[0].steps.length;i++) {
      String partialPolyline = dataclass.routes[0].legs[0].steps[i].polyline.points;
      //debugPrint('smallPoly: $partialPolyline', wrapWidth: 2024);
      final coords = decodePolyline(partialPolyline);

      //Inorder to remove duplicates(one at end point and other at start point)  we are neglecting the end point of each step
      for (int j=0; j<coords.length-1;j++) {
        totalPoints.add(coords[j]) ;
      }
      //Add the end_point of the last step as it was not included in totalPoints list
      if (i == dataclass.routes[0].legs[0].steps.length-1)
        totalPoints.add(coords[coords.length-1]);
    }

    //encoding the polyline
    encPolyline = encodePolyline(totalPoints);
    setState(() {
      encPolyline = encPolyline.replaceAll(r"\", "\\\\");
    });
    debugPrint(encPolyline,wrapWidth: 2024);

    // convert List<List<num>> into List<LatLng>
    for (int i=0;i< totalPoints.length;i++) {
      _polylineCoordinates.add(LatLng(totalPoints[i][0], totalPoints[i][1]));

    }


  }

}