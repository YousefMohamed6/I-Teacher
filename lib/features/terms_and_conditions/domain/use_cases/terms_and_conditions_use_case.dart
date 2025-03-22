import 'package:iteacher/features/terms_and_conditions/data/models/terms_and_conditions_model.dart';
import 'package:iteacher/features/terms_and_conditions/domain/repos/i_terms_and_conditions.dart';

class TermsAndConditionsUseCase {
  final ITermsAndConditionsRepo _termsAndConditionsRepo;

  TermsAndConditionsUseCase(this._termsAndConditionsRepo);

  Future<TermsAndConditionsModel> execute() async {
    return await _termsAndConditionsRepo.fetchTermsAndConditions();
  }
}
