import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/terms_and_conditions/data/models/terms_and_conditions_model.dart';
import 'package:iteacher/features/terms_and_conditions/domain/repos/i_terms_and_conditions.dart';

class TermsAndConditionsRepoImpl implements ITermsAndConditionsRepo {
  final FirebaseFirestoreService firebaseFirestoreService;
  TermsAndConditionsRepoImpl({required this.firebaseFirestoreService});
  @override
  Future<TermsAndConditionsModel> fetchTermsAndConditions() async {
    final response = await firebaseFirestoreService.getDocument(
      collectionId: DashboardKeys.kDashboardCollection,
      documentId: DashboardKeys.kDashboardCollection,
    );
    return TermsAndConditionsModel.fromJson(
        response.data() as Map<String, dynamic>);
  }
}
