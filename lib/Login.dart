import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';

int mobileNo;
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String phoneNo, verificationId, smsCode;

  bool codeSent = false;
  String phonecode = '91';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
      body: Stack(
        children:<Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child:SingleChildScrollView(
              child:Container(
                child: Stack(children: <Widget>[
                  Container(height: MediaQuery.of(context).size.height*1.2,),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.10,
                    left: MediaQuery.of(context).size.width * 0.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Welcome!',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'Century',
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromRGBO(42, 51, 92, 1)),
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 1),
                            child: Text(
                              'Login to Priority Pulse',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Century',
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromRGBO(244, 93, 2, 1)),
                            )),
                      ],
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.30,
                      left: MediaQuery.of(context).size.width * 0.1,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 150,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset('assets/ambulance.png'),
                              ),
                            ),
                            Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextField(keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your phone number',
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(42, 51, 92, 1),
                                      fontSize: 14,
                                      fontFamily: 'Century',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white70,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(244, 93, 2, 1),
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(42, 51, 92, 1),
                                          width: 2),
                                    ),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      this.phoneNo = "+" + phonecode + val ;
                                      mobileNo = int.parse(val);
                                      print(phoneNo);
                                    });
                                  },
                                )),
                            codeSent?Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextField(keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Enter otp',
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(42, 51, 92, 1),
                                      fontSize: 14,
                                      fontFamily: 'Century',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white70,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(244, 93, 2, 1),
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(42, 51, 92, 1),
                                          width: 2),
                                    ),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      this.smsCode = val;
                                    });
                                  },
                                )):
                            Container(),

                            Container(
                                height: 45,
                                width: 100,
                                child: FloatingActionButton.extended(
                                  backgroundColor: Color.fromRGBO(42, 51, 92, 1),
                                  onPressed: () {
                                    codeSent ? AuthService().signInWithOTP(smsCode, verificationId):verifyPhone(phoneNo);
                                  },
                                  label: codeSent ? Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Century',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ):
                                  Text(
                                    'GET OTP',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Century',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Not yet registered',
                                      style: TextStyle(
                                        color: Color.fromRGBO(42, 51, 92, 1),
                                        fontSize: 14,
                                        fontFamily: 'Century',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text('?',
                                        style: TextStyle(
                                            color: Color.fromRGBO(42, 51, 92, 1),
                                            fontSize: 14)),
                                    InkWell(
                                      child: Text(
                                        "    Register now",
                                        style: TextStyle(
                                            color: Color.fromRGBO(42, 51, 92, 1),
                                            fontSize: 14),
                                      ),
                                      onTap: () {
                                        Navigator.pushNamed(context, '/registration');
                                        print('Navigating to registration page');
                                      },
                                    )
                                  ],
                                ))
                          ],
                        ),
                      )),
                ]),
              ),
            ),
          ),
        Positioned(
          bottom:0,
            child:Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: CustomPaint(
                painter: ShapesPainter(),
              )))
        ]
      )
      ));
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the color property of the paint

    var path = Path();
    paint.color = Color.fromRGBO(244, 93, 2, 1);

    path.moveTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height - 20, size.width, size.height - 60);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}



