import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http ;

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String name,mobileNo;
  File _image;
  final picker = ImagePicker();
  Future getImageFile(ImageSource source) async{
    //Click or Pick an image
    final pickedFile =  await picker.getImage(source: source);

    //Cropping the image

    File croppedFile = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
//      aspectRatio: CropAspectRatio(ratioX: 3.0,ratioY: 1.0),
        maxWidth: 512,
        maxHeight: 512,
        androidUiSettings:AndroidUiSettings(
          lockAspectRatio: false,
          initAspectRatio: CropAspectRatioPreset.original,
          toolbarTitle: 'Crop the Image',
          toolbarColor: Colors.white,
          toolbarWidgetColor: Colors.black,
        )
    );

    //Compress the image

    var result = await FlutterImageCompress.compressAndGetFile(
      croppedFile.path,
      pickedFile.path,
      quality: 50,
    );
    print('Image:Sizecomp:${result.lengthSync()}');

    setState(() {
      _image = result;
      print('Image:Size:${_image.lengthSync()}');
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(child:Container(
          height: MediaQuery.of(context).size.height*0.96,
          width: MediaQuery.of(context).size.width,

            child:Stack(children: <Widget>[
            Positioned(
                bottom: 0,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: CustomPaint(
                      painter: ShapesPainter(),
                    ))),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.10,
              left: MediaQuery.of(context).size.width * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Registration',
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Century',
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(42, 51, 92, 1)),
                      )),
                  Text('                       ',
                      style: TextStyle(
                          fontSize: 40,
                          decoration: TextDecoration.overline,
                          color: Color.fromRGBO(42, 51, 92, 1)))
                ],
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.2,
                left: MediaQuery.of(context).size.width * 0.1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child:_image==null?Stack(children: <Widget>[
                          Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(240, 240, 240, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                              child: Text('UPLOAD YOUR LICENSE HERE',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Century',
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                          Align( alignment:Alignment.bottomCenter,
                            child: new GestureDetector(onTap: (){
                              getImageFile(ImageSource.gallery);
                            },
                                child:Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(42, 51, 92, 1),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(7),
                                child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Image.asset('assets/camera.png')),
                              ),
                            )),
                          )])
                        :Image.file(_image,height: MediaQuery.of(context).size.height*0.2,)
                      ),
                      Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextField(onChanged: (text) {
                            name = text;
                          },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Enter your name',
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
                          )),
                      Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextField(onChanged: (text) {
                            mobileNo = text;
                          },
                            keyboardType: TextInputType.number,
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
                          )),
                      Container(
                          height: 45,
                          width: 120,
                          child: FloatingActionButton.extended(
                            backgroundColor: Color.fromRGBO(42, 51, 92, 1),
                            onPressed: () {
                              _makePostRequest();
                              print('registered with driver details');
                            },
                            label: Text(
                              'REGISTER',
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
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Already registered',
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
                                  "    Login now",
                                  style: TextStyle(
                                      color: Color.fromRGBO(42, 51, 92, 1),
                                      fontSize: 14),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, '/login');
                                  print('Navigating to login page');
                                },
                              )
                            ],
                          ))
                    ],
                  ),
                )),
          ]),
        )),
      ),
    );
  }

  var client = http.Client();
// POST
  _makePostRequest() async {
    // set up POST request arguments
    var _json = {"name": "$name", "driverNo": "$mobileNo"};
    // make POST request
    var response = await   client.post(_localhost(),headers: {'Content-Type':'application/json'}, body: jsonEncode(_json));
    print('Driver Details:${response.body}');
    print('DriverPost  Details:$_json');
    client.close();
  }
  String _localhost() {
    if (Platform.isAndroid)
      return 'http://10.0.2.2:7000/api/location';
    else // for iOS simulator
      return 'http://localhost:7000/api/location';
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
