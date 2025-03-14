import 'package:mrjoo/core/utils/constants/firebase_keys.dart';

class TermsAndConditionsModel {
  final String arabicTerms;
  final String englishTerms;
  final String arabicConditions;
  final String englishConditions;

  TermsAndConditionsModel({
    required this.arabicTerms,
    required this.englishTerms,
    required this.arabicConditions,
    required this.englishConditions,
  });
  factory TermsAndConditionsModel.fromJson(Map<String, dynamic> json) {
    return TermsAndConditionsModel(
      arabicTerms: json[DashboardKeys.kTermsArabicField],
      englishTerms: json[DashboardKeys.kTermsEnglishField],
      arabicConditions: json[DashboardKeys.kConditionsArabicField],
      englishConditions: json[DashboardKeys.kConditionsEnglishField],
    );
  }
  Map<String, dynamic> toJson() => {
        DashboardKeys.kTermsArabicField: arabicTerms,
        DashboardKeys.kTermsEnglishField: englishTerms,
        DashboardKeys.kConditionsArabicField: arabicConditions,
        DashboardKeys.kConditionsEnglishField: englishConditions,
      };
}
