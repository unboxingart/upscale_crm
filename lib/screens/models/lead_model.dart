class LeadModel {
  LeadModel(leadName, leadEmail, leadPhone, leadWhatsapp, leadCity, leadDate,
      leadSource, leadStage, leadProfession);
  late String leadName = leadName;
  late String leadEmail = leadEmail;
  late String leadPhone = leadPhone;
  late String leadWhatsapp = leadWhatsapp;
  late String leadCity = leadCity;
  late String leadDate = leadDate;
  late String leadSource = leadSource;
  late String leadStage = leadStage;
  late var leadProposedCourses = [];
  late var leadEnrolledCourses = [];
  late String leadAdSetName;
  late String leadCreatedBy;
  late String leadValue;
  late String leadInstallmentOne;
  late String leadInstallmentTwo;
  late String leadProfession = leadProfession;
  late String leadConvertedDate;
  late String leadComment;
  late String leadDenialReason;
}
