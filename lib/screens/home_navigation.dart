import 'package:crm_unboxingart/constants/colors_fonts.dart';
import 'package:crm_unboxingart/screens/all_leads.dart';
import 'package:crm_unboxingart/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _widgetOptions = <Widget>[
    // const HomePage(),
    AllLeads(FirebaseAuth.instance.currentUser),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget customBottomNavigationBar() {
    return Container(
      color: themePink,
      padding: const EdgeInsets.only(bottom: 5),
      child: BottomNavigationBar(
        backgroundColor: themePink,
        elevation: 0,
        iconSize: 20,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 3),
              child: Opacity(
                opacity: 0.6,
                child: Icon(
                  Icons.dashboard_outlined,
                  color: themeWhite,
                ),
              ),
            ),
            label: 'Insights',
            activeIcon: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 3),
              child: Icon(
                Icons.dashboard,
                color: themeWhite,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 3),
              child: Opacity(
                opacity: 0.4,
                child: Icon(
                  Icons.contact_phone_outlined,
                  color: themeWhite,
                ),
              ),
            ),
            label: 'Leads',
            activeIcon: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 3),
              child: Icon(
                Icons.contact_phone_rounded,
                color: themeWhite,
              ),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedLabelStyle: GoogleFonts.lato(
            fontSize: 12, color: themeWhite, fontWeight: FontWeight.normal),
        selectedItemColor: themeWhite,
        unselectedItemColor: themeWhite,
        selectedLabelStyle: GoogleFonts.lato(
            fontSize: 12, color: themeWhite, fontWeight: FontWeight.bold),
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: customBottomNavigationBar());
  }
}
