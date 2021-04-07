import 'package:flutter/material.dart';
import 'package:pdf_translator/components/Rounded_Button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  @override
  void initState() {
    super.initState();
  }

  Future showAlert(String e) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(e),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.pushNamed(context, 'welcome_Screen');
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
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
                child: Text('Login',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('Welcome Back,',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
              SizedBox(height: 40),
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
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 60),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10,
                                    offset: Offset(0, 10),
                                  )
                                ],
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: email,
                                scrollPhysics: ScrollPhysics(),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'E-mail cannot be empty!';
                                  } else if (!value.contains('@')) {
                                    return 'E-mail must contain @';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(hintText: 'E-mail'),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10,
                                    offset: Offset(0, 10),
                                  )
                                ],
                              ),
                              child: TextFormField(
                                controller: password,
                                obscureText: true,
                                scrollPhysics: ScrollPhysics(),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'PassWord cannot be empty!';
                                  } else if (value.length < 6) {
                                    return 'Password must contain 6 character';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration:
                                    InputDecoration(hintText: 'Password'),
                              ),
                            ),
                            SizedBox(height: 20),
                            RoundedButton(
                              title: 'Log In',
                              fontSize: 25,
                              colour: Color(0xff2d9c6f),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    showSpinner = true;
                                  });
                                  try {
                                    final newUser =
                                        await _auth.signInWithEmailAndPassword(
                                            email: email.text,
                                            password: password.text);
                                    if (newUser != null) {
                                      setState(() {
                                        showSpinner = false;
                                      });
                                      Navigator.pushNamed(
                                          context, 'Upload_File');
                                    }
                                  } catch (error) {
                                    switch (error.code) {
                                      case "invalid-email":
                                        showAlert(
                                            "Your email address appears to be malformed.");
                                        break;
                                      case "wrong-password":
                                        showAlert("Your password is wrong.");
                                        break;
                                      case "user-not-found":
                                        showAlert(
                                            "User with this email doesn't exist.");
                                        break;

                                      default:
                                        showAlert(
                                            "Login failed! Please try again later.");
                                    }
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
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
