import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf_translator/pages/Login.dart';
import 'package:pdf_translator/pages/Signup.dart';
import 'package:pdf_translator/pages/Welcome.dart';
import 'package:pdf_translator/pages/UploadFile.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'welcome_Screen',
      routes: {
        'welcome_Screen': (context) => Welcome(),
        'login_Screen': (context) => Login(),
        'Sign_up': (context) => SignUp(),
        'Upload_File': (context) => UploadFile(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
