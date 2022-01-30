import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crm_unboxingart/constants/colors_fonts.dart';
import 'package:crm_unboxingart/screens/lead_details.dart';
import 'package:crm_unboxingart/screens/models/lead_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var todayStatsCount = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  List<LeadModel> allLeads = <LeadModel>[];

  bool _todayStatsLoaded = false;
  var leadStatusList = [
    'Pipeline 1',
    'Pipeline 2',
    'Pipeline 3',
    'DNR',
    'Call Back',
    'Not Reachable',
    'Next Time',
    'Whatsapped',
    'Emailed',
    'Converted',
    'Denied',
  ];
  var leadStatusColors = [
    themeYellow,
    themeYellow,
    themeYellow,
    themeGreen,
    themeGreen,
    themeGreen,
    themeGreen,
    themeGreen,
    themeGreen,
    themePink,
    themeBlack,
  ];

  var leadStatusTextColors = [
    themeBlack,
    themeBlack,
    themeBlack,
    themeBlack,
    themeBlack,
    themeBlack,
    themeBlack,
    themeBlack,
    themeBlack,
    themeCream,
    themeCream,
  ];

  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    fetchAllLeads();
    greeting();
  }

  @override
  Widget build(BuildContext context) {
    if (allLeads.isNotEmpty) {
      return DefaultTabController(
          initialIndex: 0, // default is 0
          length: 4, // Number of Tabs
          child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: themeBlack,
                  title: RichText(
                    text: TextSpan(
                        text: 'Good ' + greeting() + ', ',
                        style: GoogleFonts.signika(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: themeYellow,
                          ),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Shraddha',
                            style: GoogleFonts.signika(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: themeWhite,
                              ),
                            ),
                          )
                        ]),
                  ),
                  bottom: const TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(text: 'Today'),
                      Tab(text: 'This Week'),
                      Tab(text: 'This Month'),
                      Tab(text: 'All Time')
                    ],
                  ),
                ),
                backgroundColor: Colors.white,
                body: TabBarView(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10.0),
                      child: GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: List.generate(
                          todayStatsCount.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: leadStatusColors[index],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      10.0,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        leadStatusList[index],
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: leadStatusTextColors[index],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        todayStatsCount[index].toString(),
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: leadStatusTextColors[index],
                                        ),
                                      ),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10.0),
                      child: GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: List.generate(
                          allLeads.length,
                          (index) {
                            allLeads.forEach((element) {
                              print(element.leadStage.toString());
                            });
                            print(allLeads.length);
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: leadStatusColors[index],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      10.0,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10.0),
                      child: GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: List.generate(
                          11,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: themeCream,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10.0),
                      child: GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: List.generate(
                          11,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: themeBlack,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )),
          ));
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

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  fetchAllLeads() async {
    await FirebaseFirestore.instance
        .collection('leads')
        .where("owner", isEqualTo: "aquib@unboxingart.in")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              // ignore: avoid_function_literals_in_foreach_calls
              querySnapshot.docs.forEach((doc) {
                setState(() {
                  allLeads.add(LeadModel(
                    doc.get("name"),
                    doc.get("email"),
                    doc.get("phone"),
                    doc.get("whatsapp"),
                    doc.get("city"),
                    doc.get("lead_datetime"),
                    doc.get("source"),
                    doc.get("stage"),
                    doc.get("profession"),
                  ));
                });
              })
            });
  }

  // fetchStatsToday() async {
  //   await FirebaseFirestore.instance
  //       .collection('leads')
  //       .where("owner", isEqualTo: "aquib@unboxingart.in")
  //       .where("status", isEqualTo: "Pipeline 1")
  //       .where(
  //         "lead_datetime",
  //         isEqualTo: DateFormat.yMMMMd().format(today),
  //       )
  //       .orderBy("added_datetime", descending: true)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) => {
  //             // ignore: avoid_function_literals_in_foreach_calls
  //             setState(() {
  //               todayStatsCount[0] = querySnapshot.size;
  //             })
  //           });
  //   await FirebaseFirestore.instance
  //       .collection('leads')
  //       .where("owner", isEqualTo: "aquib@unboxingart.in")
  //       .where("status", isEqualTo: "Pipeline 2")
  //       .where(
  //         "lead_datetime",
  //         isEqualTo: DateFormat.yMMMMd().format(today),
  //       )
  //       .orderBy("added_datetime", descending: true)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) => {
  //             // ignore: avoid_function_literals_in_foreach_calls
  //             setState(() {
  //               todayStatsCount[1] = querySnapshot.size;
  //             })
  //           });
  //   await FirebaseFirestore.instance
  //       .collection('leads')
  //       .where("owner", isEqualTo: "aquib@unboxingart.in")
  //       .where("status", isEqualTo: "Pipeline 3")
  //       .where(
  //         "lead_datetime",
  //         isEqualTo: DateFormat.yMMMMd().format(today),
  //       )
  //       .orderBy("added_datetime", descending: true)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) => {
  //             // ignore: avoid_function_literals_in_foreach_calls
  //             setState(() {
  //               todayStatsCount[2] = querySnapshot.size;
  //             })
  //           });
  //   await FirebaseFirestore.instance
  //       .collection('leads')
  //       .where("owner", isEqualTo: "aquib@unboxingart.in")
  //       .where("status", isEqualTo: "DNR")
  //       .where(
  //         "lead_datetime",
  //         isEqualTo: DateFormat.yMMMMd().format(today),
  //       )
  //       .where("added_datetime")
  //       .orderBy("added_datetime", descending: true)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) => {
  //             // ignore: avoid_function_literals_in_foreach_calls
  //             setState(() {
  //               todayStatsCount[3] = querySnapshot.size;
  //             })
  //           });
  //   await FirebaseFirestore.instance
  //       .collection('leads')
  //       .where("owner", isEqualTo: "aquib@unboxingart.in")
  //       .where("status", isEqualTo: "Call Back")
  //       .where(
  //         "lead_datetime",
  //         isEqualTo: DateFormat.yMMMMd().format(today),
  //       )
  //       .orderBy("added_datetime", descending: true)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) => {
  //             // ignore: avoid_function_literals_in_foreach_calls
  //             setState(() {
  //               todayStatsCount[4] = querySnapshot.size;
  //             })
  //           });
  //   await FirebaseFirestore.instance
  //       .collection('leads')
  //       .where("owner", isEqualTo: "aquib@unboxingart.in")
  //       .where("status", isEqualTo: "Not Reachable")
  //       .where(
  //         "lead_datetime",
  //         isEqualTo: DateFormat.yMMMMd().format(today),
  //       )
  //       .orderBy("added_datetime", descending: true)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) => {
  //             // ignore: avoid_function_literals_in_foreach_calls
  //             setState(() {
  //               todayStatsCount[5] = querySnapshot.size;
  //             })
  //           });

  //   await FirebaseFirestore.instance
  //       .collection('leads')
  //       .where("owner", isEqualTo: "aquib@unboxingart.in")
  //       .where("status", isEqualTo: "Next Time")
  //       .where(
  //         "lead_datetime",
  //         isEqualTo: DateFormat.yMMMMd().format(today),
  //       )
  //       .orderBy("added_datetime", descending: true)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) => {
  //             // ignore: avoid_function_literals_in_foreach_calls
  //             setState(() {
  //               todayStatsCount[6] = querySnapshot.size;
  //             })
  //           });
  //   await FirebaseFirestore.instance
  //       .collection('leads')
  //       .where("owner", isEqualTo: "aquib@unboxingart.in")
  //       .where("status", isEqualTo: "Whatsapped")
  //       .where(
  //         "lead_datetime",
  //         isEqualTo: DateFormat.yMMMMd().format(today),
  //       )
  //       .orderBy("added_datetime", descending: true)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) => {
  //             // ignore: avoid_function_literals_in_foreach_calls
  //             setState(() {
  //               todayStatsCount[7] = querySnapshot.size;
  //             })
  //           });
  //   await FirebaseFirestore.instance
  //       .collection('leads')
  //       .where("owner", isEqualTo: "aquib@unboxingart.in")
  //       .where("status", isEqualTo: "Emailed")
  //       .where(
  //         "lead_datetime",
  //         isEqualTo: DateFormat.yMMMMd().format(today),
  //       )
  //       .orderBy("added_datetime", descending: true)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) => {
  //             // ignore: avoid_function_literals_in_foreach_calls
  //             setState(() {
  //               todayStatsCount[8] = querySnapshot.size;
  //             })
  //           });
  //   await FirebaseFirestore.instance
  //       .collection('leads')
  //       .where("owner", isEqualTo: "aquib@unboxingart.in")
  //       .where("status", isEqualTo: "Converted")
  //       .where(
  //         "lead_datetime",
  //         isEqualTo: DateFormat.yMMMMd().format(today),
  //       )
  //       .orderBy("added_datetime", descending: true)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) => {
  //             // ignore: avoid_function_literals_in_foreach_calls
  //             setState(() {
  //               todayStatsCount[9] = querySnapshot.size;
  //             })
  //           });
  //   await FirebaseFirestore.instance
  //       .collection('leads')
  //       .where("owner", isEqualTo: "aquib@unboxingart.in")
  //       .where("status", isEqualTo: "Denied")
  //       .where(
  //         "lead_datetime",
  //         isEqualTo: DateFormat.yMMMMd().format(today),
  //       )
  //       .orderBy("added_datetime", descending: true)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) => {
  //             // ignore: avoid_function_literals_in_foreach_calls
  //             setState(() {
  //               todayStatsCount[10] = querySnapshot.size;
  //             })
  //           });
  //   _todayStatsLoaded = true;
  // }
}
