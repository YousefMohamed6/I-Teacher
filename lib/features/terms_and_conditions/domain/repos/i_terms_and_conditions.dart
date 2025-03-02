import 'package:mrjoo/features/terms_and_conditions/data/models/terms_and_conditions_model.dart';

abstract class ITermsAndConditionsRepo {
  Future<TermsAndConditionsModel> fetchTermsAndConditions();
}
