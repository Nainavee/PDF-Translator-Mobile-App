import 'dart:io';
import 'package:flutter/material.dart';

//import 'package:pdftranslator/components/Rounded_Button.dart';

class Translated extends StatefulWidget {
  final String pdfname;
  Translated({this.pdfname});
  @override
  _TranslatedState createState() => _TranslatedState();
}

class _TranslatedState extends State<Translated> {
  Future<bool> onWillPop() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: Text('Do You Really Want To Exit App?'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text('No')),
                  TextButton(
                      onPressed: () {
                        exit(0);
                      },
                      child: Text('Yes'))
                ]));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Color(0xff03fcc2)],
              begin: Alignment.topLeft,
              stops: [0.01, 1],
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: Text(
                  'PDF Translator',
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 60),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(90),
                        topRight: Radius.circular(80)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          'Your Translated PDF is here!!!',
                          style:
                              TextStyle(color: Color(0xff2d9c6f), fontSize: 35),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Icon(Icons.picture_as_pdf_rounded,
                            color: Colors.blueGrey, size: 50),
                      ),
                      Text(
                        widget.pdfname,
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff2d9c6f),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          elevation: 5.0,
                          color: Color(0xff2d9c6f),
                          borderRadius: BorderRadius.circular(30.0),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'Upload_File');
                            },
                            minWidth: 200.0,
                            height: 42.0,
                            child: Text(
                              'Translate Another PDF',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
