import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crm_unboxingart/constants/colors_fonts.dart';
import 'package:crm_unboxingart/screens/home.dart';
import 'package:crm_unboxingart/screens/lead_details.dart';
import 'package:crm_unboxingart/screens/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class AllLeads extends StatefulWidget {
  User? user = FirebaseAuth.instance.currentUser;
  AllLeads(this.user, {Key? key}) : super(key: key);

  @override
  _AllLeadsState createState() => _AllLeadsState();
}

class _AllLeadsState extends State<AllLeads> {
  List<Widget> leadList = [];
  bool _loadedLeads = false;
  @override
  void initState() {
    super.initState();
    fetchLeads();
  }

  @override
  Widget build(BuildContext context) {
    if (_loadedLeads) {
      return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => HomePage(widget.user)),
                    );
                  },
                  child: const Icon(Icons.filter_list),
                )),
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance
                        .signOut()
                        .then((value) => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => const LoginScreen()),
                            ));
                  },
                  child: const Icon(Icons.logout),
                )),
          ],
          automaticallyImplyLeading: false,
          title: Text(
            'All Leads',
            style: themeSubtitleTextStyle,
          ),
          centerTitle: true,
          backgroundColor: themeBlack,
        ),
        backgroundColor: themeWhite,
        body: RefreshIndicator(
          color: themePink,
          onRefresh: fetchLeads,
          child: ListView(
            padding: const EdgeInsets.all(20),
            scrollDirection: Axis.vertical,
            children: leadList,
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Center(
                child: Text(
              'Loading',
              style: TextStyle(fontFamily: 'Lato', fontSize: 18),
            )),
            SizedBox(height: 20),
            Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0XFFF7567C)),
              ),
            ),
          ],
        ),
      );
    }
  }

  Future<void> fetchLeads() async {
    leadList = [];
    await FirebaseFirestore.instance
        .collection('leads')
        .where("owner", isEqualTo: widget.user!.email)
        .orderBy("added_datetime", descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              // ignore: avoid_function_literals_in_foreach_calls
              querySnapshot.docs.forEach((doc) {
                setState(() {
                  leadList.add(
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => LeadDetails(doc.id)),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.topCenter,
                          width: 200.0,
                          decoration: BoxDecoration(
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                color: Color(0X17000000),
                                offset: Offset(0, 3),
                                blurRadius: 3,
                              ),
                            ],
                            color: themeWhite,
                            border: Border.all(color: themeWhite, width: 2),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  doc.get("stage") == "New"
                                      ? Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5.0),
                                          decoration: BoxDecoration(
                                              color: themePink,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10.0))),
                                          child: Text(doc.get("stage"),
                                              style: GoogleFonts.lato(
                                                  fontSize: 12,
                                                  color: themeWhite,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      : Text(doc.get("stage"),
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              color: themeBlack,
                                              fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 5.0),
                                  Text(
                                      doc.get("name") +
                                          ' | ' +
                                          doc.get("phone"),
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          color: themeBlack,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 5.0),
                                  Text(doc.get("email"),
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          color: themeBlack,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 5.0),
                                  const Divider(),
                                  doc.get("stage") == "New"
                                      ? Container()
                                      : Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: Opacity(
                                            opacity: 0.8,
                                            child: Text(
                                              'Last engaged : ' +
                                                  DateFormat.yMMMd()
                                                      .add_jm()
                                                      .format(doc
                                                          .get("last_engaged")
                                                          .toDate()),
                                              style: GoogleFonts.lato(
                                                  fontSize: 14,
                                                  color: themeBlack,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                  Opacity(
                                    opacity: 0.6,
                                    child: Text(
                                        'Added on : ' +
                                            DateFormat.yMMMd()
                                                .add_jm()
                                                .format(doc
                                                    .get("added_datetime")
                                                    .toDate())
                                                .toString(),
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: themeBlack,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(100.0),
                                      ),
                                      color: themePink,
                                    ),
                                    child: IconButton(
                                        onPressed: () async {
                                          final Uri launchUri = Uri(
                                            scheme: 'tel',
                                            path: "+91" + doc.get("phone"),
                                          );
                                          await launch(launchUri.toString());
                                        },
                                        icon: const Icon(
                                          Icons.phone,
                                        ),
                                        color: themeWhite),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(100.0),
                                      ),
                                      color: themePink,
                                    ),
                                    child: IconButton(
                                        onPressed: () async {
                                          await launch(
                                            "https://wa.me/91" +
                                                doc.get("phone").toString(),
                                          );
                                        },
                                        icon: Icon(Icons.message,
                                            color: themeWhite)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                  _loadedLeads = true;
                });
              }),
            });
  }
}
