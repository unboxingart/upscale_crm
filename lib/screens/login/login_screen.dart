import 'package:crm_unboxingart/constants/colors_fonts.dart';
import 'package:crm_unboxingart/screens/all_leads.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var currentUser = FirebaseAuth.instance.currentUser;
  String currentUserEmail = '';

  final invalidEmailAlert = SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: themeBlack,
      content: Text(
        'No account exists with that Email',
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: themeWhite,
          ),
        ),
        textAlign: TextAlign.center,
      ));

  final processingAlert = SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: themeBlack,
      content: Text(
        'Logging you in...',
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: themeWhite,
          ),
        ),
        textAlign: TextAlign.center,
      ));

  final invalidPasswordAlert = SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: themeBlack,
      content: Text(
        'The password is incorrect',
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: themeWhite,
          ),
        ),
        textAlign: TextAlign.center,
      ));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUser != null) {
      return AllLeads(currentUser);
    } else {
      return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          body: Builder(
            builder: (context) {
              return Container(
                  constraints: const BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/bg_invert.png"),
                          fit: BoxFit.fitWidth)),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Image.asset(
                                'images/text_logo.png',
                                height: 250,
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            padding: const EdgeInsets.all(20),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter your Email ID',
                                    ),
                                    controller: email,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                    style: GoogleFonts.lato(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: themeBlack),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter your Password',
                                    ),
                                    controller: password,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a valid password';
                                      }
                                      return null;
                                    },
                                    style: GoogleFonts.lato(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: themeBlack),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    child: const Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Text(
                                        'Proceed',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(300, 50),
                                      primary: themePink,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    onPressed: () async {
                                      // Validate returns true if the form is valid, or false otherwise.
                                      if (_formKey.currentState!.validate()) {
                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.
                                        try {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(processingAlert);
                                          UserCredential userCredential =
                                              await FirebaseAuth.instance
                                                  .signInWithEmailAndPassword(
                                                      email: email.text,
                                                      password: password.text);
                                          setState(() {
                                            currentUser = userCredential.user;
                                          });
                                        } on FirebaseAuthException catch (e) {
                                          if (e.code == 'user-not-found') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                                    invalidEmailAlert);
                                          } else if (e.code ==
                                              'wrong-password') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                                    invalidPasswordAlert);
                                          }
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          ),
        ),
      );
    }
  }
}
