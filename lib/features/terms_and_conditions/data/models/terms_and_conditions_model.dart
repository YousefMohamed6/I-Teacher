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
      arabicTerms: json[DashBoardKeys.kTermsArabicField],
      englishTerms: json[DashBoardKeys.kTermsEnglishField],
      arabicConditions: json[DashBoardKeys.kConditionsArabicField],
      englishConditions: json[DashBoardKeys.kConditionsEnglishField],
    );
  }
  Map<String, dynamic> toJson() => {
        DashBoardKeys.kTermsArabicField: arabicTerms,
        DashBoardKeys.kTermsEnglishField: englishTerms,
        DashBoardKeys.kConditionsArabicField: arabicConditions,
        DashBoardKeys.kConditionsEnglishField: englishConditions,
      };
}
