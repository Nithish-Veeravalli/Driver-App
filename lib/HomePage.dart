import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'package:priority_pulse/Login.dart';
class HomePage extends StatefulWidget {
//  final int mobileNo;
//  const HomePage({Key key, this.mobileNo}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int phoneNo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      phoneNo= mobileNo;
    });
  }
  @override
  Widget build(BuildContext context) {
    print('Driver phone No: $phoneNo');
    return SafeArea(
        child: Scaffold(resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'Priority Pulse',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Century',
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              backgroundColor: Color.fromRGBO(244, 93, 2, 1),
              actions: <Widget>[
                IconButton(
                  icon:new Image.asset('assets/logout icon.png'),
                  onPressed: () {
                    AuthService().signOut();
                    print('Logout');
                  },
                )
              ],
            ),
            body: Center(
                child: Container(height: MediaQuery.of(context).size.height,

                    child: Column(children: <Widget>[
              Container(height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/ambpic.png'))),
              ),
              Stack(children:<Widget>[
                Container(height: MediaQuery.of(context).size.width * 0.8,
                  width: MediaQuery.of(context).size.width * 0.8,
                    alignment: Alignment.center,
                    child:Container(height: MediaQuery.of(context).size.width * 0.4,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Color.fromRGBO(139, 0, 0, 1),
                )),
                Column(children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width * 0.8,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(252, 67, 73, 0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new GestureDetector(onTap: (){
                            Navigator.pushNamed(context, '/profile',arguments: phoneNo);
                            print('Navigated to profile page');
                          },
                            child: Container(
                            height: MediaQuery.of(context).size.width * 0.35,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(5.0, 5.0),
                                    color: Colors.black26,
                                    blurRadius: 5.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                              Container( height: MediaQuery.of(context).size.width * 0.25,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child:Padding(
                                padding: EdgeInsets.only(top: 7),
                                child: FittedBox(
                                    fit: BoxFit.fitHeight,
                                    child: Image.asset('assets/profile icon.png')),
                              ),),
                              Text('Profile',style: TextStyle(fontSize: 16,fontFamily: 'Century',
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromRGBO(244, 93, 2, 1)),)
                            ],),
                          ),),
                          new GestureDetector(onTap: (){
                            Navigator.pushNamed(context, '/past rides',arguments: phoneNo);
                            print('Navigated to past rides page');
                          },
                            child:Container(
                            height: MediaQuery.of(context).size.width * 0.35,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(5.0, 5.0),
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container( height: MediaQuery.of(context).size.width * 0.25,
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  child:Padding(
                                    padding: EdgeInsets.only(top: 7),
                                    child: FittedBox(
                                        fit: BoxFit.fitHeight,
                                        child: Image.asset('assets/past rides.png')),
                                  ),),
                                Text('Past Rides',style: TextStyle(fontSize: 16,fontFamily: 'Century',
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromRGBO(244, 93, 2, 1)),)
                              ],),
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new GestureDetector(onTap: (){
                            Navigator.pushNamed(context, '/presentride');
                            print('Navigated to present ride page');
                          },
                            child:Container(
                            height: MediaQuery.of(context).size.width * 0.35,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(5.0, 5.0),
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container( height: MediaQuery.of(context).size.width * 0.25,
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  child:Padding(
                                    padding: EdgeInsets.only(top: 7),
                                    child: FittedBox(
                                        fit: BoxFit.fitHeight,
                                        child: Image.asset('assets/Present ride.png')),
                                  ),),
                                Text('Present Ride',style: TextStyle(fontSize: 16,fontFamily: 'Century',
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromRGBO(244, 93, 2, 1)),)
                              ],),
                          )),
                          new GestureDetector(onTap: (){
                            Navigator.pushNamed(context, '/profile');
                            print('Navigated to alerts page');
                          },
                            child:Container(
                            height: MediaQuery.of(context).size.width * 0.35,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(5.0, 5.0),
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container( height: MediaQuery.of(context).size.width * 0.25,
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  child:Padding(
                                    padding: EdgeInsets.only(top: 7),
                                    child: FittedBox(
                                        fit: BoxFit.fitHeight,
                                        child: Image.asset('assets/Alert.png')),
                                  ),),
                                Text('Alerts',style: TextStyle(fontSize: 16,fontFamily: 'Century',
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromRGBO(244, 93, 2, 1)),)
                              ],),
                          )),
                        ],
                      )
                    ],
                  ),
                ),
              ])
              ])])))));
  }
}
