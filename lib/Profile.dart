import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:priority_pulse/Login.dart';
import 'package:http/http.dart' as http ;
import 'dart:io';
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  final int mobileNo;
  const ProfilePage({Key key, this.mobileNo}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  num phoneNo;
  String driverName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
       phoneNo = mobileNo ;
    });
    _makeGetRequest();
  }
  @override
  Widget build(BuildContext context) {
    print('Driver phone No in profile: $phoneNo');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile', style: TextStyle(
              fontSize: 25,
              fontFamily: 'Century',
              fontWeight: FontWeight.w300,
              color: Colors.white),),
          backgroundColor: Color.fromRGBO(244, 93, 2, 1),
        ),
        body: SingleChildScrollView(child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.8,
            width: MediaQuery
                .of(context)
                .size
                .width,

            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 170,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                  child: Stack(children: <Widget>[
                    Container(
                      height: 150,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.8,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(240, 240, 240, 1),
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text('LICENSE IMAGE',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Century',
                              fontWeight: FontWeight.w300,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  ]),
                ),
                    Container(
                        height: 45,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.8,
                        decoration: BoxDecoration(
                          // color: Color.fromRGBO(244, 93, 2, 1),
                          border: Border.all(  color: Color.fromRGBO(244, 93, 2, 1),
                              width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        child:Center(child:Row(children:<Widget>[
                          Text('     Name:     ',style: TextStyle(fontSize: 16,color:Color.fromRGBO(42, 51, 92, 1), ),),
                          Text('$driverName',style: TextStyle(fontSize: 16,color:Color.fromRGBO(42, 51, 92, 1), ))] ))),
                Container(
                    height: 45,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.8,
                    decoration: BoxDecoration(
                     // color: Color.fromRGBO(244, 93, 2, 1),
                      border: Border.all(  color: Color.fromRGBO(244, 93, 2, 1),
                          width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child:Center(child:Row(children:<Widget>[
                        Text('     Mobile Number:     ',style: TextStyle(fontSize: 16,color:Color.fromRGBO(42, 51, 92, 1), ),),
                    Text('$phoneNo',style: TextStyle(fontSize: 16,color:Color.fromRGBO(42, 51, 92, 1), ))] ))),
              ],
            ))
        ),
      ),
    );
  }

  var client = http.Client();
// POST
  _makeGetRequest() async {
    final response = await http.get(_localhost());
     var driverDetails = jsonDecode(response.body);
    print(driverDetails);
    setState(() {
      driverName = driverDetails.username;
      print(driverName);
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

