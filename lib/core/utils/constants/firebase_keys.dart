sealed class DashboardKeys {
  static const String kDashboardCollection = "dashboard";
  static const String kTermsArabicField = "arabic_terms";
  static const String kTermsEnglishField = "english_terms";
  static const String kConditionsArabicField = "arabic_conditions";
  static const String kConditionsEnglishField = "english_conditions";
}

sealed class TeacherKeys {
  static const String kTeachersCollection = "teacher";
  static const String kTeacherIdField = 'teacherId';
  static const String kfirstNameField = 'firstName';
  static const String kLastNameField = 'lastName';
  static const String kEmailField = 'email';
  static const String kPhoneField = 'phone';
  static const String kDepartmentField = 'department';
  static const String kDescriptionField = 'description';
  static const String kCourseLinkField = "courseLink";
  static const String kCoursePriceField = "coursePrice";
  static const String kTeacherImageField = "image";
  static const String kTeacherRoleField = 'userRole';
}

sealed class AccountsKeys {
  static const String kAccountsCollection = "accounts";
  static const String kIconField = "icon";
  static const String kUrlField = "url";
  static const String kNameField = "name";
}

sealed class ChatKeys {
  static const String kChatCollection = "chat";
  static const String kContentField = "content";
  static const String kCreatedAtField = "createdAt";
  static const String kUesrIdField = 'userId';
  static const String kDisplayNameField = 'displayName';
  static const String kReciverField = 'reciverId';
}

sealed class StudentKeys {
  static const String kStudentsCollection = "students";
  static const String kfirstNameField = 'firstName';
  static const String kLastNameField = 'lastName';
  static const String kEmailField = 'email';
  static const String kPhoneField = 'phone';
  static const String kStudentImageField = 'imageBase64';
  static const String kStudentAddress = 'address';
  static const String kExpiryDate = 'expiry_date';
  static const String kSubscriptionDate = 'subscription_date';
  static const String kTeacherIdField = 'teacherId';
  static const String kStudentRoleField = 'userRole';
}

sealed class PaymentsKeys {
  static const String kPaymentsCollection = "payments";
  static const String kFirstNameField = 'firstName';
  static const String kLastNameField = 'lastName';
  static const String kEmailField = 'email';
  static const String kPhoneField = 'phone';
  static const String kInvoiceIdField = 'invoice_id';
  static const String kPaymentStatusField = 'payment_status';
  static const String kPaymentDateField = 'payment_date';
}
