sealed class DashBoardKeys {
  static const String kDashboardCollection = "dashboard";
  static const String kTermsArabicField = "arabic_terms";
  static const String kTermsEnglishField = "english_terms";
  static const String kConditionsArabicField = "arabic_conditions";
  static const String kConditionsEnglishField = "english_conditions";
}

sealed class TeacherKeys {
  static const String kTeacherCollection = "teacher";
  static const String kTeacherIdField = 'teacherId';
  static const String kfirstNameField = 'firstName';
  static const String kLastNameField = 'lastName';
  static const String kEmailField = 'email';
  static const String kPhoneField = 'phone';
  static const String kDepartmentField = 'department';
  static const String kCourseLinkField = "courseLink";
  static const String kCoursePriceField = "coursePrice";
}

sealed class ChatKeys {
  static const String kChatCollection = "chat";
  static const String kContentField = "content";
  static const String kCreatedAtField = "createdAt";
  static const String kUesrIdField = 'userId';
  static const String kDisplayNameField = 'displayName';
}

sealed class StudentKeys {
  static const String kStudentsCollection = "students";
  static const String kfirstNameField = 'firstName';
  static const String kLastNameField = 'lastName';
  static const String kEmailField = 'email';
  static const String kPhoneField = 'phone';
  static const String kStudentAddress = 'address';
  static const String kExpiryDate = 'expiryDate';
  static const String kSubscriptionDate = 'subscriptionDate';
  static const String kTeacherIdField = 'teacherId';
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
