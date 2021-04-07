import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_translator/components/Rounded_Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:pdf_translator/pages/Translation_Page.dart';

class UploadFile extends StatefulWidget {
  @override
  _UploadFileState createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  String name = '';
  String path = '';
  String size = '';
  String _directoryPath = '';
  String nm = 'No Files Selected';
  //String nm1 = 'One File Selected';
  bool _loadingPath = false;
  bool press = true;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  FilePickerResult _paths;
  PlatformFile file;

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = ' ';
       _paths = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    setState(() {
      file = _paths.files.first;
      print('data..................');
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
      _loadingPath = false;
      press = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'PDF Translator',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: GestureDetector(
                      child: Icon(
                        Icons.logout,
                        size: 30,
                        color: Colors.green[900],
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Log Out"),
                                content: Text(
                                    "Do you really want to log out from PDF Translator?"),
                                actions: [
                                  TextButton(
                                    child: Text("Yes"),
                                    onPressed: () {
                                      _auth.signOut();
                                      Navigator.pushNamed(
                                          context, 'welcome_Screen');
                                    },
                                  ),
                                  TextButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                      },
                    ),
                  ),
                ],
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
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Upload the file that you want to translate,",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff2d9c6f),
                        ),
                      ),
                      RoundedButton(
                        title: press ? 'Upload File' : 'Proceed To Translate',
                        colour: Color(0xff27cf8b),
                        fontSize: 30,
                        onPressed: () => press
                            ? _openFileExplorer()
                            : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Translation(
                                  pdfName:file.name,
                                   )
                            )
                        )
                      ),
                      Builder(
                          builder: (BuildContext context) => _loadingPath
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: const CircularProgressIndicator(),
                                )
                              : _directoryPath != null
                                  ? ListTile(
                                      title: const Text('Uploaded File(Pdf)'),
                                      subtitle: Text(press ? nm : file.name),
                                    )
                                  : SizedBox()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
