import 'package:iteacher/core/utils/constants/firebase_keys.dart';

class DashboardModel {
  final String arabicTerms;
  final String englishTerms;
  final String arabicConditions;
  final String englishConditions;
  final String ownerPaymentId;
  final String cost;

  DashboardModel({
    required this.arabicTerms,
    required this.englishTerms,
    required this.arabicConditions,
    required this.englishConditions,
    required this.ownerPaymentId,
    required this.cost,
  });
  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      arabicTerms: json[DashboardKeys.kTermsArabicField],
      englishTerms: json[DashboardKeys.kTermsEnglishField],
      arabicConditions: json[DashboardKeys.kConditionsArabicField],
      englishConditions: json[DashboardKeys.kConditionsEnglishField],
      ownerPaymentId: json[DashboardKeys.kOwnerPaymentIdField],
      cost: json[DashboardKeys.kCostField],
    );
  }
  Map<String, dynamic> toJson() => {
        DashboardKeys.kTermsArabicField: arabicTerms,
        DashboardKeys.kTermsEnglishField: englishTerms,
        DashboardKeys.kConditionsArabicField: arabicConditions,
        DashboardKeys.kConditionsEnglishField: englishConditions,
        DashboardKeys.kOwnerPaymentIdField: ownerPaymentId,
        DashboardKeys.kCostField: cost,
      };
}
