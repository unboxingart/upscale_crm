import 'dart:async';

import 'package:crm_unboxingart/constants/colors_fonts.dart';
import 'package:crm_unboxingart/screens/all_leads.dart';
import 'package:crm_unboxingart/screens/conversion_rate.dart';
import 'package:crm_unboxingart/screens/home_navigation.dart';
import 'package:crm_unboxingart/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _versionName = 'V1.0.0';
  final splashDelay = 2;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  navigationPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themePink,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40.0, top: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Image(
              image: AssetImage('images/upscale_logo.png'),
              height: 200,
            ),
            Column(
              children: [
                Text("upScale", style: themeTitleTextStyleBigWhite),
                const SizedBox(height: 10),
                Text("by Unboxing Art", style: splashScreenTextStyle),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // Spacer(),
                  Text(_versionName,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(fontSize: 12, color: themeWhite),
                      )),
                  Text('© Dark Room Poets EdTech Pvt. Ltd.',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(fontSize: 12, color: themeWhite),
                      )),
                  //Spacer(),
                ]),
          ],
        ),
      ),
    );
  }
}
