sealed class DashBoardKeys {
  static const String kDashboardCollection = "dashboard";
  static const String kTremsField = "trems";
  static const String kPolicyField = "policy";
}

sealed class TeacherKeys {
  static const String kTeacherCollection = "teacher";
  static const String kTeacherIdField = 'teacherId';
  static const String kFirstNameField = 'firstName';
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
  static const String kFirstNameField = 'firstName';
  static const String kLastNameField = 'lastName';
  static const String kEmailField = 'email';
  static const String kPhoneField = 'phone';
  static const String kStudentAddress = 'address';
  static const String kExpiryDate = 'expiryDate';
  static const String kSubscriptionDate = 'subscriptionDate';
  static const String kTeacherIdField = 'teacherId';
}
