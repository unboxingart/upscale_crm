import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crm_unboxingart/constants/colors_fonts.dart';
import 'package:crm_unboxingart/screens/filtered_leads.dart';
import 'package:crm_unboxingart/screens/lead_details.dart';
import 'package:crm_unboxingart/screens/models/lead_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  User? user = FirebaseAuth.instance.currentUser;
  HomePage(this.user, {Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            'Filter Leads',
            style: themeSubtitleTextStyle,
          ),
          centerTitle: true,
          backgroundColor: themeBlack,
        ),
        backgroundColor: themeWhite,
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => FilteredLeads(widget.user, "New")),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color(0X17000000),
                        offset: Offset(0, 3),
                        blurRadius: 3,
                      ),
                    ],
                    color: themeBlack,
                    border: Border.all(color: themeWhite, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Text("New Leads", style: themeSubtitleTextStyle),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => FilteredLeads(widget.user, "DNR")),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color(0X17000000),
                        offset: Offset(0, 3),
                        blurRadius: 3,
                      ),
                    ],
                    color: themeBlack,
                    border: Border.all(color: themeWhite, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Text("DNR Leads", style: themeSubtitleTextStyle),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) =>
                            FilteredLeads(widget.user, "Not Reachable")),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color(0X17000000),
                        offset: Offset(0, 3),
                        blurRadius: 3,
                      ),
                    ],
                    color: themeBlack,
                    border: Border.all(color: themeWhite, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Text("Not Reachable", style: themeSubtitleTextStyle),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) =>
                            FilteredLeads(widget.user, "Call Back")),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color(0X17000000),
                        offset: Offset(0, 3),
                        blurRadius: 3,
                      ),
                    ],
                    color: themeBlack,
                    border: Border.all(color: themeWhite, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Text("Call Back", style: themeSubtitleTextStyle),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) =>
                            FilteredLeads(widget.user, "Pipeline 1")),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color(0X17000000),
                        offset: Offset(0, 3),
                        blurRadius: 3,
                      ),
                    ],
                    color: themeBlack,
                    border: Border.all(color: themeWhite, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child:
                      Text("Pipeline 1 Leads", style: themeSubtitleTextStyle),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) =>
                            FilteredLeads(widget.user, "Pipeline 2")),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color(0X17000000),
                        offset: Offset(0, 3),
                        blurRadius: 3,
                      ),
                    ],
                    color: themeBlack,
                    border: Border.all(color: themeWhite, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child:
                      Text("Pipeline 2 Leads", style: themeSubtitleTextStyle),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) =>
                            FilteredLeads(widget.user, "Pipeline 3")),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color(0X17000000),
                        offset: Offset(0, 3),
                        blurRadius: 3,
                      ),
                    ],
                    color: themeBlack,
                    border: Border.all(color: themeWhite, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child:
                      Text("Pipeline 3 Leads", style: themeSubtitleTextStyle),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) =>
                            FilteredLeads(widget.user, "Converted")),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color(0X17000000),
                        offset: Offset(0, 3),
                        blurRadius: 3,
                      ),
                    ],
                    color: themeBlack,
                    border: Border.all(color: themeWhite, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Text("Converted Leads", style: themeSubtitleTextStyle),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) =>
                            FilteredLeads(widget.user, "Whatsapped")),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color(0X17000000),
                        offset: Offset(0, 3),
                        blurRadius: 3,
                      ),
                    ],
                    color: themeBlack,
                    border: Border.all(color: themeWhite, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child:
                      Text("Whatsapped Leads", style: themeSubtitleTextStyle),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => FilteredLeads(widget.user, "Emailed")),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color(0X17000000),
                        offset: Offset(0, 3),
                        blurRadius: 3,
                      ),
                    ],
                    color: themeBlack,
                    border: Border.all(color: themeWhite, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Text("Emailed Leads", style: themeSubtitleTextStyle),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => FilteredLeads(widget.user, "Denied")),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color(0X17000000),
                        offset: Offset(0, 3),
                        blurRadius: 3,
                      ),
                    ],
                    color: themeBlack,
                    border: Border.all(color: themeWhite, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Text("Denied Leads", style: themeSubtitleTextStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
