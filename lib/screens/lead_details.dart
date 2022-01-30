import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crm_unboxingart/constants/colors_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String leadName = '';
String leadEmail = '';
String leadPhone = '';
String leadStatus = '--Select--';
String leadWhatsapp = '';
String leadProfession = '';
String leadComments = '';
String leadCity = '';
String leadDate = '';
String leadSource = '';
String leadOwner = '';
String leadValue = '';
String leadAddedBy = '';
String leadProposedCourses = '--Select--';
String enrolledCourses = '--Select--';
String leadDescription = '';
bool _loadedDetails = false;

class LeadDetails extends StatefulWidget {
  final String leadID;
  LeadDetails(this.leadID);

  @override
  _LeadDetailsState createState() => _LeadDetailsState();
}

class _LeadDetailsState extends State<LeadDetails> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController leadCommentController = TextEditingController()
    ..text = leadComments;
  final TextEditingController leadCityController = TextEditingController()
    ..text = leadCity;
  final TextEditingController leadProfessionController = TextEditingController()
    ..text = leadProfession;
  final TextEditingController leadDescriptionController =
      TextEditingController()..text = leadDescription;
  final TextEditingController leadValueController = TextEditingController()
    ..text = leadValue;

  final leadStageUpdate = SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: themeBlack,
      content: Text(
        'Lead Stage modified successfully.',
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: themeWhite,
          ),
        ),
        textAlign: TextAlign.center,
      ));

  final leadDetailsUpdate = SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: themeBlack,
      content: Text(
        'Lead Details modified successfully.',
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: themeWhite,
          ),
        ),
        textAlign: TextAlign.center,
      ));

  final leadProposedCourseUpdate = SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: themeBlack,
      content: Text(
        'Proposed Course modified successfully.',
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: themeWhite,
          ),
        ),
        textAlign: TextAlign.center,
      ));

  final leadEnrolledCourseUpdate = SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: themeBlack,
      content: Text(
        'Enrolled Course modified successfully.',
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
    fetchLeadDetails(widget.leadID);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loadedDetails) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(leadName),
          centerTitle: true,
          backgroundColor: themeBlack,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Name',
                      style: themeSubtitleTextStyleBlack,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0X17707070), width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(leadName)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mobile Number',
                      style: themeSubtitleTextStyleBlack,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0X17707070), width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(leadPhone)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email ID',
                      style: themeSubtitleTextStyleBlack,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0X17707070), width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(leadEmail)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WhatsApp Number',
                      style: themeSubtitleTextStyleBlack,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0X17707070), width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(leadWhatsapp)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profession',
                      style: themeSubtitleTextStyleBlack,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0X17707070), width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: leadProfessionController,
                          style: GoogleFonts.lato(color: themeBlack),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Comment',
                      style: themeSubtitleTextStyleBlack,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0X17707070), width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: leadCommentController,
                          style: GoogleFonts.lato(color: themeBlack),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lead City',
                      style: themeSubtitleTextStyleBlack,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0X17707070), width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: leadCityController,
                          style: GoogleFonts.lato(color: themeBlack),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lead Stage',
                      style: themeSubtitleTextStyleBlack,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButton<String>(
                      value: leadStatus,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          leadStatus = newValue!;
                        });
                        FirebaseFirestore.instance
                            .collection("leads")
                            .doc(widget.leadID)
                            .update({"stage": leadStatus}).then((_) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(leadStageUpdate);
                        });
                      },
                      items: <String>[
                        '--Select--',
                        'New',
                        'Not Reachable',
                        'DNR',
                        'Denied',
                        'Call Back',
                        'Pipeline 1',
                        'Pipeline 2',
                        'Pipeline 3',
                        'Next Time',
                        'Converted',
                        'Whatsapped',
                        'Emailed'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lead Date',
                      style: themeSubtitleTextStyleBlack,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0X17707070), width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(leadDate)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lead Added By',
                      style: themeSubtitleTextStyleBlack,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0X17707070), width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(leadAddedBy)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Assigned to',
                      style: themeSubtitleTextStyleBlack,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0X17707070), width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(leadOwner)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Proposed Courses',
                      style: themeSubtitleTextStyleBlack,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButton<String>(
                      value: leadProposedCourses,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          leadProposedCourses = newValue!;
                        });
                        FirebaseFirestore.instance
                            .collection("leads")
                            .doc(widget.leadID)
                            .update({
                          "proposed_courses": leadProposedCourses
                        }).then((_) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(leadProposedCourseUpdate);
                        });
                      },
                      items: <String>[
                        '--Select--',
                        'Unboxing Blogging and Content Writing',
                        'Unboxing Content Creation'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enrolled Courses',
                      style: themeSubtitleTextStyleBlack,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButton<String>(
                      value: enrolledCourses,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          enrolledCourses = newValue!;
                        });
                        FirebaseFirestore.instance
                            .collection("leads")
                            .doc(widget.leadID)
                            .update({"enrolled_courses": enrolledCourses}).then(
                                (_) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(leadEnrolledCourseUpdate);
                        });
                      },
                      items: <String>[
                        '--Select--',
                        'Unboxing Blogging and Content Writing',
                        'Unboxing Content Creation'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Value',
                          style: themeSubtitleTextStyleBlack,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0X17707070), width: 2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: leadValueController,
                              style: GoogleFonts.lato(color: themeBlack),
                            )),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Save Changes',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: themePink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () async {
                    setState(() {
                      leadProfession = leadProfessionController.text;
                      leadComments = leadCommentController.text;
                      leadDescription = leadDescriptionController.text;
                      leadCity = leadCityController.text;
                      leadValue = leadValueController.text;
                    });
                    await FirebaseFirestore.instance
                        .collection("leads")
                        .doc(widget.leadID)
                        .update({
                      "profession": leadProfession,
                      "comment": leadComments,
                      "city": leadCity,
                      "value": leadValue,
                      "description": leadDescription
                    }).then((_) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(leadDetailsUpdate);
                    });
                  },
                ),
              ],
            ),
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

  Future fetchLeadDetails(String webinarID) async {
    await FirebaseFirestore.instance
        .collection('leads')
        .doc(widget.leadID)
        .get()
        .then((DocumentSnapshot snapshot) => {
              setState(() {
                leadName = snapshot["name"];
                leadDate = snapshot["lead_datetime"].toString();
                leadEmail = snapshot["email"];
                leadPhone = snapshot["phone"];
                leadStatus = snapshot["stage"];
                leadWhatsapp = snapshot["whatsapp"];
                leadProfession = snapshot["profession"];
                leadCity = snapshot["city"];
                leadAddedBy = snapshot["added_by"];
                leadSource = snapshot["source"];
                leadOwner = snapshot["owner"];
                leadProposedCourses = snapshot["proposed_courses"];
                enrolledCourses = snapshot["enrolled_courses"];
                leadDescription = snapshot["description"];
              }),
            });
    _loadedDetails = true;
  }
}
